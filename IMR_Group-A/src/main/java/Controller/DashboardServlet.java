package Controller;

import DAO.DashboardDAO;
import DAO.UserDAO;
import Model.DashboardModels.DashboardStats;
import Model.DashboardModels.DailySalesItem;
import Model.DashboardModels.CategorySalesItem;
import Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet(name = "DashboardServlet", urlPatterns = {"/DashboardServlet"})
public class DashboardServlet extends HttpServlet {
    
    private DashboardDAO dashboardDAO = new DashboardDAO();
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int userID = (int) session.getAttribute("userID");
        User currentUser = userDAO.getUserByID(userID);
        if (currentUser == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        String role = currentUser.getRole();
        if ("Cashier".equalsIgnoreCase(role)) {
            response.sendRedirect("Login.jsp");
            return;
        }

        request.setAttribute("currentRole", role);
        request.setAttribute("fullname", currentUser.getFullName());

        try {
            DashboardStats stats = dashboardDAO.getDashboardStats();
            request.setAttribute("totalCustomers", stats.getTotalCustomers());
            request.setAttribute("criticalStock", stats.getCriticalStock());
            request.setAttribute("totalSales", String.format("%.2f", stats.getTotalSales()));
            request.setAttribute("totalItems", (int) stats.getTotalItems()); // converting double to int if you prefer

            List<DailySalesItem> dailySalesList = dashboardDAO.getDailySales();
            request.setAttribute("dailySalesData", dailySalesList);

            List<CategorySalesItem> categorySalesList = dashboardDAO.getCategorySales();
            request.setAttribute("incomeData", categorySalesList);

        } catch (SQLException e) {
        }

        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
    }

}
