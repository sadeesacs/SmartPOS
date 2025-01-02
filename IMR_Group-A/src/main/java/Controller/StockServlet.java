package Controller;

import DAO.StockDAO;
import DAO.UserDAO;
import Model.Stock;
import Model.User;

import jakarta.servlet.http.*;
import java.sql.Date;
import java.util.List;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "StockServlet", urlPatterns = {"/StockServlet"})
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

        List<Stock> normal   = stockDAO.getNormalStock();
        List<Stock> critical = stockDAO.getCriticalStock();
        List<Stock> low      = stockDAO.getLowStock();
        List<Stock> outOf    = stockDAO.getOutOfStock();

        request.setAttribute("normalStock", normal);
        request.setAttribute("criticalStock", critical);
        request.setAttribute("lowStock", low);
        request.setAttribute("outOfStock", outOf);
        request.setAttribute("fullname", fullName);
        request.setAttribute("currentRole", currentRole);

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
            response.sendRedirect("Login.jsp");
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

        Date mDate = null;
        if (mDateStr != null && !mDateStr.isEmpty()) {
            mDate = Date.valueOf(mDateStr);
        }
        Date eDate = null;
        if (eDateStr != null && !eDateStr.isEmpty()) {
            eDate = Date.valueOf(eDateStr);
        }

        Stock st = new Stock();
        st.setProductID(productID);
        st.setQuantity(quantity);
        st.setManufactureDate(mDate);
        st.setExpiryDate(eDate);

        stockDAO.addStock(st);
    }

    private void handleUpdateStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String stockIDStr  = request.getParameter("stockID");
        String quantityStr = request.getParameter("quantity");
        String mDateStr    = request.getParameter("manufactureDate");
        String eDateStr    = request.getParameter("expiryDate");

        int stockID = Integer.parseInt(stockIDStr);
        double quantity = Double.parseDouble(quantityStr);

        Date mDate = null;
        if (mDateStr != null && !mDateStr.isEmpty()) {
            mDate = Date.valueOf(mDateStr);
        }
        Date eDate = null;
        if (eDateStr != null && !eDateStr.isEmpty()) {
            eDate = Date.valueOf(eDateStr);
        }

        Stock st = new Stock();
        st.setStockID(stockID);
        st.setQuantity(quantity);
        st.setManufactureDate(mDate);
        st.setExpiryDate(eDate);

        stockDAO.updateStock(st);
    }

    private void handleDeleteStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String stockIDStr = request.getParameter("stockID");
        int stockID = Integer.parseInt(stockIDStr);

        stockDAO.deleteStock(stockID);
    }
}