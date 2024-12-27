package DAO;

import DB.dbconn;
import Model.Stock;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StockDAO {
    public List<Stock> getNormalStock() {
        List<Stock> list = new ArrayList<>();
        String sql = "SELECT s.StockID, s.ProductID, p.ProductName, s.Quantity, s.ManufactureDate, s.ExpiryDate "
                   + "FROM Stock s "
                   + "JOIN Products p ON s.ProductID = p.ProductID "
                   + "WHERE s.Quantity >= 30 "
                   + "  AND s.Quantity != 0 "
                   + "  AND DATEDIFF(day, GETDATE(), s.ExpiryDate) > 15 "
                   + "ORDER BY s.StockID ASC";

        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Stock st = new Stock();
                st.setStockID(rs.getInt("StockID"));
                st.setProductID(rs.getInt("ProductID"));
                st.setProductName(rs.getString("ProductName"));
                st.setQuantity(rs.getDouble("Quantity"));
                st.setManufactureDate(rs.getDate("ManufactureDate"));
                st.setExpiryDate(rs.getDate("ExpiryDate"));
                list.add(st);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Stock> getCriticalStock() {
        List<Stock> list = new ArrayList<>();
        String sql = "SELECT s.StockID, s.ProductID, p.ProductName, s.Quantity, s.ManufactureDate, s.ExpiryDate "
                   + "FROM Stock s "
                   + "JOIN Products p ON s.ProductID = p.ProductID "
                   + "WHERE DATEDIFF(day, GETDATE(), s.ExpiryDate) <= 15 "
                   + "  AND s.Quantity != 0 "
                   + "ORDER BY s.StockID ASC";

        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Stock st = new Stock();
                st.setStockID(rs.getInt("StockID"));
                st.setProductID(rs.getInt("ProductID"));
                st.setProductName(rs.getString("ProductName"));
                st.setQuantity(rs.getDouble("Quantity"));
                st.setManufactureDate(rs.getDate("ManufactureDate"));
                st.setExpiryDate(rs.getDate("ExpiryDate"));
                list.add(st);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Stock> getLowStock() {
        List<Stock> list = new ArrayList<>();
        String sql = "SELECT s.StockID, s.ProductID, p.ProductName, s.Quantity, s.ManufactureDate, s.ExpiryDate "
                   + "FROM Stock s "
                   + "JOIN Products p ON s.ProductID = p.ProductID "
                   + "WHERE s.Quantity < 30 "
                   + "  AND s.Quantity != 0 "
                   + "ORDER BY s.StockID ASC";

        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Stock st = new Stock();
                st.setStockID(rs.getInt("StockID"));
                st.setProductID(rs.getInt("ProductID"));
                st.setProductName(rs.getString("ProductName"));
                st.setQuantity(rs.getDouble("Quantity"));
                st.setManufactureDate(rs.getDate("ManufactureDate"));
                st.setExpiryDate(rs.getDate("ExpiryDate"));
                list.add(st);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    
    public List<Stock> getOutOfStock() {
        List<Stock> list = new ArrayList<>();
        
        String sqlA = "SELECT s.StockID, s.ProductID, p.ProductName, s.Quantity, s.ManufactureDate, s.ExpiryDate "
                    + "FROM Stock s "
                    + "JOIN Products p ON s.ProductID = p.ProductID "
                    + "WHERE s.Quantity = 0 "
                    + "ORDER BY s.StockID ASC";

        String sqlB = "SELECT p.ProductID, p.ProductName, 0 AS StockID, 0 AS Quantity, NULL AS ManufactureDate, NULL AS ExpiryDate "
                    + "FROM Products p "
                    + "WHERE NOT EXISTS (SELECT 1 FROM Stock s WHERE s.ProductID = p.ProductID)";

        try (Connection conn = dbconn.getConnection();
             Statement stmt = conn.createStatement()) {

            try (ResultSet rs = stmt.executeQuery(sqlA)) {
                while (rs.next()) {
                    Stock st = new Stock();
                    st.setStockID(rs.getInt("StockID"));
                    st.setProductID(rs.getInt("ProductID"));
                    st.setProductName(rs.getString("ProductName"));
                    st.setQuantity(rs.getDouble("Quantity"));
                    st.setManufactureDate(rs.getDate("ManufactureDate"));
                    st.setExpiryDate(rs.getDate("ExpiryDate"));
                    list.add(st);
                }
            }
            
            try (ResultSet rs2 = stmt.executeQuery(sqlB)) {
                while (rs2.next()) {
                    Stock st = new Stock();
                    st.setStockID(rs2.getInt("StockID")); // 0
                    st.setProductID(rs2.getInt("ProductID"));
                    st.setProductName(rs2.getString("ProductName"));
                    st.setQuantity(rs2.getDouble("Quantity")); // 0
                    st.setManufactureDate(rs2.getDate("ManufactureDate")); // null
                    st.setExpiryDate(rs2.getDate("ExpiryDate")); // null
                    list.add(st);
                }
            }

        } catch (SQLException e) {
        }
        return list;
    }

    public int addStock(Stock stock) {
        int newID = -1;
        String sql = "{CALL spAddStock(?,?,?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setInt(1, stock.getProductID());
            cstmt.setDouble(2, stock.getQuantity());
            cstmt.setDate(3, stock.getManufactureDate());
            cstmt.setDate(4, stock.getExpiryDate());

            try (ResultSet rs = cstmt.executeQuery()) {
                if (rs.next()) {
                    newID = rs.getInt("NewStockID");
                }
            }
        } catch (SQLException e) {
        }
        return newID;
    }

    public void updateStock(Stock stock) {
        String sql = "{CALL spUpdateStock(?,?,?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setInt(1, stock.getStockID());
            cstmt.setDouble(2, stock.getQuantity());
            cstmt.setDate(3, stock.getManufactureDate());
            cstmt.setDate(4, stock.getExpiryDate());
            cstmt.execute();
        } catch (SQLException e) {
        }
    }

    public void deleteStock(int stockID) {
        String sql = "{CALL spDeleteStock(?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            cstmt.setInt(1, stockID);
            cstmt.execute();
        } catch (SQLException e) {
        }
    }
}