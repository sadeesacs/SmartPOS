package Controller;

import DAO.DiscountDAO;
import DAO.DiscountDAO.DiscountViewItem;
import DAO.UserDAO;
import Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "DiscountServlet", urlPatterns = {"/DiscountServlet"})
public class DiscountServlet extends HttpServlet {
    
    private DiscountDAO discountDAO = new DiscountDAO();
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
        User currentUser = userDAO.getUserByID(currentUserID);
        String currentRole = (currentUser != null) ? currentUser.getRole() : "Unknown";
        String fullname = (currentUser != null) ? currentUser.getFullName() : "UnknownUser";

        request.setAttribute("currentRole", currentRole);
        request.setAttribute("fullname", fullname);

        List<DiscountViewItem> discountList = discountDAO.getAllDiscounts();
        request.setAttribute("discountList", discountList);

        request.getRequestDispatcher("Discounts.jsp").forward(request, response);
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
        User currentUser = userDAO.getUserByID(currentUserID);
        String currentRole = (currentUser != null) ? currentUser.getRole() : "Unknown";

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("DiscountServlet");
            return;
        }

        if ("Cashier".equalsIgnoreCase(currentRole)) {
            response.sendRedirect("DiscountServlet");
            return;
        }

        switch (action.toLowerCase()) {
            case "adddiscount":
                handleAddDiscount(request, response);
                break;
            case "deletediscount":
                handleDeleteDiscount(request, response);
                break;
        }
    }
    
    private void handleAddDiscount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productCodeStr = request.getParameter("productCode"); 
        String discountPctStr = request.getParameter("discountPercentage");

        try {
            int productID = Integer.parseInt(productCodeStr);
            double discountPct = Double.parseDouble(discountPctStr);

            Date startDate = Date.valueOf(LocalDate.now());

            discountDAO.addDiscount(productID, discountPct, startDate);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (SQLException e) {
        }

        response.sendRedirect("DiscountServlet");
    }

    private void handleDeleteDiscount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productIDStr = request.getParameter("productID"); 
        try {
            int productID = Integer.parseInt(productIDStr);
            discountDAO.deleteDiscount(productID);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (SQLException e) {
        }
        response.sendRedirect("DiscountServlet");
    }
}
