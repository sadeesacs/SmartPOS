package Controller;

import DAO.StockDAO;
import DAO.UserDAO;
import Model.Stock;
import Model.User;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.sql.Date;
import java.util.List;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "StockServlet", urlPatterns = {"/StockServlet"})
@MultipartConfig
public class StockServlet extends HttpServlet {
    
    private StockDAO stockDAO = new StockDAO();
    private UserDAO userDAO = new UserDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int currentUserID = (int) session.getAttribute("userID");
        String currentRole = userDAO.getUserRoleByID(currentUserID);

        if ("Cashier".equalsIgnoreCase(currentRole)) {
            response.sendRedirect("Login.jsp");
            return;
        }

        User currentUser = userDAO.getUserByID(currentUserID);
        String fullName = (currentUser != null) ? currentUser.getFullName() : "UnknownUser";

        List<Stock> normalStock    = stockDAO.getNormalStock();
        List<Stock> criticalStock  = stockDAO.getCriticalStock();
        List<Stock> lowStock       = stockDAO.getLowStock();
        List<Stock> outOfStock     = stockDAO.getOutOfStock();

        request.setAttribute("fullname", fullName);
        request.setAttribute("currentRole", currentRole);

        request.setAttribute("normalStock", normalStock);
        request.setAttribute("criticalStock", criticalStock);
        request.setAttribute("lowStock", lowStock);
        request.setAttribute("outOfStock", outOfStock);

        request.getRequestDispatcher("Stock.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int currentUserID = (int) session.getAttribute("userID");
        String currentRole = userDAO.getUserRoleByID(currentUserID);

        if ("Cashier".equalsIgnoreCase(currentRole)) {
            response.sendRedirect("AccessDenied.jsp");
            return;
        }

        String action = request.getParameter("action");
        if ("logout".equalsIgnoreCase(action)) {
            session.invalidate();
            response.sendRedirect("Login.jsp");
            return;
        }

        if (action != null) {
            switch (action.toLowerCase()) {
                case "add":
                    handleAddStock(request, response);
                    break;
                case "update":
                    handleUpdateStock(request, response);
                    break;
                case "delete":
                    handleDeleteStock(request, response);
                    break;
            }
        }
        response.sendRedirect("StockServlet");
    }
    
    private void handleAddStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productIDStr = request.getParameter("productID");
        String quantityStr  = request.getParameter("quantity");
        String mDateStr     = request.getParameter("manufactureDate");
        String eDateStr     = request.getParameter("expiryDate");

        int productID = Integer.parseInt(productIDStr);
        double quantity = Double.parseDouble(quantityStr);

        Date manufactureDate = null;
        if (mDateStr != null && !mDateStr.isEmpty()) {
            manufactureDate = Date.valueOf(mDateStr);
        }
        Date expiryDate = null;
        if (eDateStr != null && !eDateStr.isEmpty()) {
            expiryDate = Date.valueOf(eDateStr);
        }

        Stock newStock = new Stock();
        newStock.setProductID(productID);
        newStock.setQuantity(quantity);
        newStock.setManufactureDate(manufactureDate);
        newStock.setExpiryDate(expiryDate);

        stockDAO.addStock(newStock);
    }

    private void handleUpdateStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String stockIDStr   = request.getParameter("stockID");
        String quantityStr  = request.getParameter("quantity");
        String mDateStr     = request.getParameter("manufactureDate");
        String eDateStr     = request.getParameter("expiryDate");

        int stockID = Integer.parseInt(stockIDStr);
        double quantity = Double.parseDouble(quantityStr);

        Date manufactureDate = null;
        if (mDateStr != null && !mDateStr.isEmpty()) {
            manufactureDate = Date.valueOf(mDateStr);
        }
        Date expiryDate = null;
        if (eDateStr != null && !eDateStr.isEmpty()) {
            expiryDate = Date.valueOf(eDateStr);
        }

        Stock st = new Stock();
        st.setStockID(stockID);
        st.setQuantity(quantity);
        st.setManufactureDate(manufactureDate);
        st.setExpiryDate(expiryDate);

        stockDAO.updateStock(st);
    }

    private void handleDeleteStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String stockIDStr = request.getParameter("stockID");
        int stockID = Integer.parseInt(stockIDStr);

        stockDAO.deleteStock(stockID);
    }
}