package DAO;

import DB.dbconn;
import Model.ReportModels.DailyStockItem;
import Model.ReportModels.MonthlyRevenueItem;
import Model.ReportModels.ProductPerformance;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {
    public List<DailyStockItem> getDailyStockReport(String selectedDate) throws SQLException {
        List<DailyStockItem> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.fn_GetDailyStockReport(?)";

        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            if (selectedDate != null && !selectedDate.isEmpty()) {
                stmt.setDate(1, java.sql.Date.valueOf(selectedDate));
            } else {
                stmt.setDate(1, new java.sql.Date(System.currentTimeMillis()));
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int quantitySold = rs.getInt("QuantitySold");
                    if (quantitySold > 0) {
                        DailyStockItem item = new DailyStockItem();
                        item.setProductID(rs.getString("ProductID"));
                        item.setProductName(rs.getString("ProductName"));
                        item.setStockQuantity(rs.getInt("Quantity"));
                        item.setQuantitySold(quantitySold);
                        item.setStockStatus(rs.getString("StockStatus"));
                        list.add(item);
                    }
                }
            }
        }
        return list;
    }

    public List<MonthlyRevenueItem> getMonthlyRevenueData(String year, String month) throws SQLException {
        List<MonthlyRevenueItem> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.fn_GetMonthlyRevenueData(?, ?)";

        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, year);
            stmt.setString(2, month);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    MonthlyRevenueItem item = new MonthlyRevenueItem();
                    item.setDay(rs.getInt("day"));
                    item.setTotalRevenue(rs.getDouble("total_revenue"));
                    list.add(item);
                }
            }
        }
        return list;
    }

    public List<ProductPerformance> getTopPerformingProducts(String year, String month) throws SQLException {
        List<ProductPerformance> list = new ArrayList<>();
        String sql = "SELECT ProductID, ProductName, SUM(UnitsSold) AS UnitsSold, SUM(Revenue) AS Revenue "
                   + "FROM vwTopPerformingProducts "
                   + "WHERE TxYear=? AND TxMonth=? "
                   + "GROUP BY ProductID, ProductName "
                   + "HAVING SUM(Revenue) > 0 "
                   + "ORDER BY SUM(Revenue) DESC";

        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, year);
            stmt.setString(2, month);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ProductPerformance pp = new ProductPerformance();
                    pp.setProductID(rs.getString("ProductID"));
                    pp.setProductName(rs.getString("ProductName"));
                    pp.setUnitsSold(rs.getInt("UnitsSold"));
                    pp.setRevenue(rs.getDouble("Revenue"));
                    list.add(pp);
                }
            }
        }
        return list;
    }

    public List<ProductPerformance> getLowPerformingProducts(String year, String month) throws SQLException {
        List<ProductPerformance> list = new ArrayList<>();
        String sql = "SELECT ProductID, ProductName, SUM(UnitsSold) AS UnitsSold, SUM(Revenue) AS Revenue "
                   + "FROM vwLowPerformingProducts "
                   + "WHERE TxYear=? AND TxMonth=? "
                   + "GROUP BY ProductID, ProductName "
                   + "HAVING SUM(Revenue) > 0 "
                   + "ORDER BY SUM(Revenue) ASC";

        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, year);
            stmt.setString(2, month);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ProductPerformance pp = new ProductPerformance();
                    pp.setProductID(rs.getString("ProductID"));
                    pp.setProductName(rs.getString("ProductName"));
                    pp.setUnitsSold(rs.getInt("UnitsSold"));
                    pp.setRevenue(rs.getDouble("Revenue"));
                    list.add(pp);
                }
            }
        }
        return list;
    }
}
