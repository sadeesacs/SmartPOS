package Controller;


import DAO.ProductDAO;
import DAO.TransactionDAO;
import DAO.UserDAO;
import DB.dbconn;
import Model.Product;
import Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;


@WebServlet(name = "POSServlet", urlPatterns = {"/POSServlet"})
public class POSServlet extends HttpServlet {
    
    private ProductDAO productDAO = new ProductDAO();
    private TransactionDAO transactionDAO = new TransactionDAO();
    private UserDAO userDAO = new UserDAO();

    public static class POSItem {
        public int stockID;
        public String productName;
        public double quantity;    
        public double price;       
        public double discountPct; 
        public double grossCost;   
        public double lineTotal;   

        public POSItem(int stockID, String productName, double quantity, double price, double discountPct, double grossCost, double lineTotal) {
            this.stockID = stockID;
            this.productName = productName;
            this.quantity = quantity;
            this.price = price;
            this.discountPct = discountPct;
            this.grossCost = grossCost;
            this.lineTotal = lineTotal;
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int currentUserID = (int) session.getAttribute("userID");
        User currentUser = userDAO.getUserByID(currentUserID);
        String currentRole = (currentUser != null) ? currentUser.getRole() : "Unknown";
        String fullName = (currentUser != null) ? currentUser.getFullName() : "UnknownUser";

        request.setAttribute("currentRole", currentRole);
        request.setAttribute("fullname", fullName);

        List<POSItem> cart = (List<POSItem>) session.getAttribute("posCart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        double totalGross = 0.0;
        double totalDiscount = 0.0;
        for (POSItem item : cart) {
            totalGross += item.grossCost;
            double lineDisc = item.grossCost - item.lineTotal; 
            totalDiscount += lineDisc;
        }
        double net = totalGross - totalDiscount;

        request.setAttribute("cartItems", cart);
        request.setAttribute("cartTotal", totalGross);
        request.setAttribute("cartDiscount", totalDiscount);
        request.setAttribute("cartNet", net);

        String showReceipt = request.getParameter("showReceipt");
        if ("true".equalsIgnoreCase(showReceipt)) {
            Integer rxID = (Integer) session.getAttribute("receiptTransactionID");
            Double rTot   = (Double)  session.getAttribute("receiptTotal");
            Double rDisc  = (Double)  session.getAttribute("receiptDiscount");
            Double rNet   = (Double)  session.getAttribute("receiptNet");
            if (rxID != null)  request.setAttribute("receiptTransactionID", rxID);
            if (rTot != null) request.setAttribute("receiptTotal", rTot);
            if (rDisc != null) request.setAttribute("receiptDiscount", rDisc);
            if (rNet != null) request.setAttribute("receiptNet", rNet);

            List<POSItem> finalReceiptLines = (List<POSItem>) session.getAttribute("receiptLines");
            if (finalReceiptLines != null) {
                request.setAttribute("receiptLines", finalReceiptLines);
            }
        }

        request.getRequestDispatcher("POS.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String action = request.getParameter("action");
        if ("logout".equalsIgnoreCase(action)) {
            session.invalidate();
            response.sendRedirect("Login.jsp");
            return;
        }

        if (action == null) {
            response.sendRedirect("POSServlet");
            return;
        }

        switch (action.toLowerCase()) {
            case "enterproduct":
                handleEnterProduct(request, response);
                break;
            case "clearcart":
                handleClearCart(request, response);
                break;
            case "removeitem":
                handleRemoveItem(request, response);
                break;
            case "printbill":
                handlePrintBill(request, response);
                break;
        }
    }
    
    private void handleEnterProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<POSItem> cart = (List<POSItem>) session.getAttribute("posCart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        String stockCode = request.getParameter("product-code"); 
        String qtyStr    = request.getParameter("product-quantity");

        int stockID;
        double quantity;
        boolean isWeighted = false;
        double price = 0.0;
        double discountPct = 0.0;
        String productName = "[Unknown]";

        if (stockCode.length() > 6) {
            String sID = stockCode.substring(0,6);
            String sGrams = stockCode.substring(6);
            stockID = Integer.parseInt(sID);
            quantity = Double.parseDouble(sGrams); 
        } else {
            stockID = Integer.parseInt(stockCode);
            if (qtyStr == null || qtyStr.isEmpty()) {
                quantity = 1.0;
            } else {
                quantity = Double.parseDouble(qtyStr);
            }
        }

        // 2) Retrieve product info
        try (Connection conn = dbconn.getConnection()) {
            String sql = "SELECT s.ProductID, p.ProductName, p.IsWeighted, p.PricePerUnit, p.PricePer100g " +
                         "FROM Stock s " +
                         "JOIN Products p ON s.ProductID = p.ProductID " +
                         "WHERE s.StockID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, stockID);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        isWeighted = rs.getBoolean("IsWeighted");
                        productName = rs.getString("ProductName");
                        int productID = rs.getInt("ProductID");
                        if (isWeighted) {
                            price = rs.getDouble("PricePer100g");
                        } else {
                            price = rs.getDouble("PricePerUnit");
                        }
                        String discSql = "SELECT DiscountPercentage FROM Discount WHERE ProductID = ?";
                        try (PreparedStatement ds = conn.prepareStatement(discSql)) {
                            ds.setInt(1, productID);
                            try (ResultSet drs = ds.executeQuery()) {
                                if (drs.next()) {
                                    discountPct = drs.getDouble("DiscountPercentage");
                                }
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
        }

        double gross = 0.0;
        if (isWeighted) {
            gross = (quantity / 100.0) * price;
        } else {
            gross = quantity * price;
        }
        double discountVal = gross * (discountPct / 100.0);
        double lineTotal = gross - discountVal;

        POSItem item = new POSItem( stockID, productName, quantity, price, discountPct, gross, lineTotal);
        cart.add(item);
        session.setAttribute("posCart", cart);

        response.sendRedirect("POSServlet");
    }

    private void handleClearCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("posCart");
        response.sendRedirect("POSServlet");
    }

    private void handleRemoveItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<POSItem> cart = (List<POSItem>) session.getAttribute("posCart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        String stockIDStr = request.getParameter("stockID");
        if (stockIDStr != null) {
            int sID = Integer.parseInt(stockIDStr);
            Iterator<POSItem> it = cart.iterator();
            while (it.hasNext()) {
                POSItem pi = it.next();
                if (pi.stockID == sID) {
                    it.remove();
                    break;
                }
            }
        }
        session.setAttribute("posCart", cart);
        response.sendRedirect("POSServlet");
    }

    private void handlePrintBill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<POSItem> cart = (List<POSItem>) session.getAttribute("posCart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("POSServlet");
            return;
        }

        int currentUserID = (int) session.getAttribute("userID");

        int newTxID = transactionDAO.addTransactionHeader("Cash", currentUserID);

        int lineNum = 1;
        for (POSItem item : cart) {
            transactionDAO.addTransactionLine( newTxID, lineNum, item.stockID, item.quantity, item.discountPct);
            lineNum++;
        }

        double totalGross = 0.0;
        double totalDiscount = 0.0;
        for (POSItem pi : cart) {
            totalGross += pi.grossCost;
            double discVal = pi.grossCost - pi.lineTotal; 
            totalDiscount += discVal;
        }
        double net = totalGross - totalDiscount;

        session.setAttribute("receiptTransactionID", newTxID);
        session.setAttribute("receiptTotal", totalGross);
        session.setAttribute("receiptDiscount", totalDiscount);
        session.setAttribute("receiptNet", net);
        session.setAttribute("receiptLines", cart);

        session.removeAttribute("posCart");

        response.sendRedirect("POSServlet?showReceipt=true");
    }
}