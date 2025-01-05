package Controller;

import DAO.ReportDAO;
import Model.ReportModels.DailyStockItem;
import Model.ReportModels.MonthlyRevenueItem;
import Model.ReportModels.ProductPerformance;
import DAO.UserDAO;
import Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;


@WebServlet(urlPatterns = {"/ReportsServlet"})
public class ReportsServlet extends HttpServlet {
    
    private ReportDAO reportDAO = new ReportDAO();
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
        
        // Daily Stock
        String reportDate = request.getParameter("reportDate");
        if (reportDate == null || reportDate.isEmpty()) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            reportDate = sdf.format(new Date());
        }
        List<DailyStockItem> dailyStockList = new ArrayList<>();
        try {
            dailyStockList = reportDAO.getDailyStockReport(reportDate);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("reportDate", reportDate);
        request.setAttribute("dailyStockList", dailyStockList);

        // Monthly Revenue
        String reportMonth = request.getParameter("reportMonth");
        if (reportMonth == null) reportMonth = "01";
        String year = "2025";
        List<MonthlyRevenueItem> monthlyRevs = new ArrayList<>();
        try {
            monthlyRevs = reportDAO.getMonthlyRevenueData(year, reportMonth);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("reportMonth", reportMonth);
        request.setAttribute("monthlyRevenueData", monthlyRevs);
        request.setAttribute("year", year);

        // Top Performing
        String topPerformMonth = request.getParameter("topPerformMonth");
        if (topPerformMonth == null) topPerformMonth = "01";
        List<ProductPerformance> topList = new ArrayList<>();
        try {
            topList = reportDAO.getTopPerformingProducts(year, topPerformMonth);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("topPerformMonth", topPerformMonth);
        request.setAttribute("topPerformingList", topList);

        // Low Performing
        String lowPerformMonth = request.getParameter("lowPerformMonth");
        if (lowPerformMonth == null) lowPerformMonth = "01";
        List<ProductPerformance> lowList = new ArrayList<>();
        try {
            lowList = reportDAO.getLowPerformingProducts(year, lowPerformMonth);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("lowPerformMonth", lowPerformMonth);
        request.setAttribute("lowPerformingList", lowList);

        request.getRequestDispatcher("Reports.jsp").forward(request, response);
    }
}
