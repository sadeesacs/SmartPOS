package DAO;

import DB.dbconn;
import Model.Stock;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StockDAO {
    public List<Stock> getNormalStock() {
        List<Stock> list = new ArrayList<>();
        String sql = "SELECT s.StockID, s.ProductID, p.ProductName, s.Quantity, "
                   + "s.ManufactureDate, s.ExpiryDate "
                   + "FROM Stock s "
                   + "JOIN Products p ON s.ProductID = p.ProductID "
                   + "WHERE s.Quantity >= 30 "
                   + "AND s.Quantity != 0 "
                   + "AND DATEDIFF(day, GETDATE(), s.ExpiryDate) > 15 "
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

    // Critical stock => expiry <= 15 days, quantity != 0
    public List<Stock> getCriticalStock() {
        List<Stock> list = new ArrayList<>();
        String sql = "SELECT s.StockID, s.ProductID, p.ProductName, s.Quantity, "
                   + "s.ManufactureDate, s.ExpiryDate "
                   + "FROM Stock s "
                   + "JOIN Products p ON s.ProductID = p.ProductID "
                   + "WHERE s.Quantity != 0 "
                   + "AND DATEDIFF(day, GETDATE(), s.ExpiryDate) <= 15 "
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

    // Low stock => quantity < 30, quantity != 0
    public List<Stock> getLowStock() {
        List<Stock> list = new ArrayList<>();
        String sql = "SELECT s.StockID, s.ProductID, p.ProductName, s.Quantity, "
                   + "s.ManufactureDate, s.ExpiryDate "
                   + "FROM Stock s "
                   + "JOIN Products p ON s.ProductID = p.ProductID "
                   + "WHERE s.Quantity < 30 "
                   + "AND s.Quantity != 0 "
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

    // Out of stock => quantity=0 or no stock row
    public List<Stock> getOutOfStock() {
        List<Stock> list = new ArrayList<>();
        // PART A: s.Quantity=0
        String sqlA = 
            "SELECT s.StockID, s.ProductID, p.ProductName, s.Quantity, s.ManufactureDate, s.ExpiryDate " +
            "FROM Stock s " +
            "JOIN Products p ON s.ProductID = p.ProductID " +
            "WHERE s.Quantity = 0 " +
            "ORDER BY s.StockID ASC";
        try (Connection conn = dbconn.getConnection();
             Statement stmt = conn.createStatement()) {
            // part A
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
        } catch (SQLException e) {
        }
        return list;
    }

    // spAddStock
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

    // spUpdateStock
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

    // spDeleteStock
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