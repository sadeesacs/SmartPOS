package DAO;

import DB.dbconn;
import Model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT ProductID, ProductName, ProductCategory, "
                   + "IsWeighted, PricePerUnit, PricePer100g, ProductImageURL "
                   + "FROM Products "
                   + "ORDER BY ProductID ASC";

        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setProductCategory(rs.getString("ProductCategory"));
                p.setWeighted(rs.getBoolean("IsWeighted"));
                p.setPricePerUnit(rs.getDouble("PricePerUnit"));
                p.setPricePer100g(rs.getDouble("PricePer100g"));
                p.setProductImageURL(rs.getString("ProductImageURL"));
                productList.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public int addProduct(Product product) {
        int newID = -1;
        String sql = "{CALL spAddProduct(?,?,?,?,?,?)}"; 
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setString(1, product.getProductName());
            cstmt.setString(2, product.getProductCategory());
            cstmt.setBoolean(3, product.isWeighted());
            cstmt.setDouble(4, product.getPricePerUnit());
            cstmt.setDouble(5, product.getPricePer100g());
            cstmt.setString(6, product.getProductImageURL());

            try (ResultSet rs = cstmt.executeQuery()) {
                if (rs.next()) {
                    newID = rs.getInt("NewProductID");
                }
            }
        } catch (SQLException e) {
        }
        return newID;
    }

    public void updateProduct(Product product) {
        String sql = "{CALL spUpdateProduct(?,?,?,?,?,?,?)}"; 
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setInt(1, product.getProductID());
            cstmt.setString(2, product.getProductName());
            cstmt.setString(3, product.getProductCategory());
            cstmt.setBoolean(4, product.isWeighted());
            cstmt.setDouble(5, product.getPricePerUnit());
            cstmt.setDouble(6, product.getPricePer100g());
            cstmt.setString(7, product.getProductImageURL());

            cstmt.execute();
        } catch (SQLException e) {
        }
    }
    
    public void deleteProduct(int productID) {
        String sql = "{CALL spDeleteProduct(?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setInt(1, productID);
            cstmt.execute();
        } catch (SQLException e) {
        }
    }
}