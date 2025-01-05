package DAO;

import DB.dbconn;
import Model.DashboardModels.DashboardStats;
import Model.DashboardModels.DailySalesItem;
import Model.DashboardModels.CategorySalesItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DashboardDAO {
    public DashboardStats getDashboardStats() throws SQLException {
        DashboardStats stats = new DashboardStats();
        String sql = "SELECT totalCustomers, criticalStock, totalSales, totalItems FROM vwDashboardStats";

        try (Connection conn = dbconn.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                stats.setTotalCustomers(rs.getInt("totalCustomers"));
                stats.setCriticalStock(rs.getInt("criticalStock"));
                stats.setTotalSales(rs.getDouble("totalSales"));
                stats.setTotalItems(rs.getDouble("totalItems"));
            }
        }
        return stats;
    }

    public List<DailySalesItem> getDailySales() throws SQLException {
        List<DailySalesItem> list = new ArrayList<>();
        String sql = "SELECT [day], total FROM fn_GetDailySalesDashboard()";

        try (Connection conn = dbconn.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                DailySalesItem item = new DailySalesItem();
                item.setDay(rs.getDate("day"));
                item.setTotal(rs.getDouble("total"));
                list.add(item);
            }
        }
        list.sort((a, b) -> a.getDay().compareTo(b.getDay()));
        return list;
    }

    public List<CategorySalesItem> getCategorySales() throws SQLException {
        List<CategorySalesItem> list = new ArrayList<>();
        String sql = "SELECT category, total FROM fn_GetCategorySalesDashboard()";

        try (Connection conn = dbconn.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                CategorySalesItem csi = new CategorySalesItem();
                csi.setCategory(rs.getString("category"));
                csi.setTotal(rs.getDouble("total"));
                list.add(csi);
            }
        }
        list.sort((a, b) -> Double.compare(b.getTotal(), a.getTotal()));
        return list;
    }
}
