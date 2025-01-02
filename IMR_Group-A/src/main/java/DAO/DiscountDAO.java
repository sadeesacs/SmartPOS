package DAO;

import DB.dbconn;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DiscountDAO {
    public int addDiscount(int productID, double discountPct, java.sql.Date startDate) throws SQLException {
        int newID = -1;
        String sql = "{CALL spAddDiscount(?,?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setInt(1, productID);
            cstmt.setDouble(2, discountPct);
            if (startDate != null) {
                cstmt.setDate(3, startDate);
            } else {
                cstmt.setNull(3, java.sql.Types.DATE);
            }

            try (ResultSet rs = cstmt.executeQuery()) {
                if (rs.next()) {
                    newID = rs.getInt("NewDiscountID");
                }
            }
        }
        return newID;
    }

    public void deleteDiscount(int productID) throws SQLException {
        String sql = "{CALL spDeleteDiscount(?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            cstmt.setInt(1, productID);
            cstmt.execute();
        }
    }

    public List<DiscountViewItem> getAllDiscounts() {
        List<DiscountViewItem> list = new ArrayList<>();
        String sql = "SELECT ProductID, ProductName, IsWeighted, Price, DiscountPercentage, StartDate "
                   + "FROM vwDiscountedProducts "
                   + "ORDER BY ProductID ASC";
        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                DiscountViewItem di = new DiscountViewItem();
                di.setProductID(rs.getInt("ProductID"));
                di.setProductName(rs.getString("ProductName"));
                di.setIsWeighted(rs.getBoolean("IsWeighted"));
                di.setPrice(rs.getDouble("Price"));
                di.setDiscountPercentage(rs.getDouble("DiscountPercentage"));
                di.setStartDate(rs.getDate("StartDate"));
                list.add(di);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static class DiscountViewItem {
        private int productID;
        private String productName;
        private boolean isWeighted;
        private double price;
        private double discountPercentage;
        private java.sql.Date startDate;

        public int getProductID() { return productID; }
        public void setProductID(int productID) { this.productID = productID; }

        public String getProductName() { return productName; }
        public void setProductName(String productName) { this.productName = productName; }

        public boolean isIsWeighted() { return isWeighted; }
        public void setIsWeighted(boolean isWeighted) { this.isWeighted = isWeighted; }

        public double getPrice() { return price; }
        public void setPrice(double price) { this.price = price; }

        public double getDiscountPercentage() { return discountPercentage; }
        public void setDiscountPercentage(double discountPercentage) { this.discountPercentage = discountPercentage; }

        public java.sql.Date getStartDate() { return startDate; }
        public void setStartDate(java.sql.Date startDate) { this.startDate = startDate; }
    }
}
