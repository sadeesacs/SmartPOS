package DAO;

import DB.dbconn;
import Model.Customers;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomersDAO {
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    
   
 
        public boolean addCustomer(Customers customer) {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean success = false;
        
        try {
            conn = dbconn.getConnection();
            String sql = "INSERT INTO Customers (firstName, lastName, email, phone, nic) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, customer.getFirstName());
            ps.setString(2, customer.getLastName());
            ps.setString(3, customer.getEmail());
            ps.setString(4, customer.getPhone());
            ps.setString(5, customer.getNic());
            
            int rowsAffected = ps.executeUpdate();
            success = rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return success;
    }
   
    public boolean deleteCustomer(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean success = false;
        
        try {
            conn = dbconn.getConnection();
            String sql = "DELETE FROM Customers WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            
            int rowsAffected = ps.executeUpdate();
            success = rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return success;
    }
        
    

   public boolean updateCustomer(Customers customer) {
    String query = "UPDATE Customers SET firstName = ?, lastName = ?, email = ?, phone = ?, nic = ? WHERE id = ?";
    try (Connection conn = dbconn.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {
        stmt.setString(1, customer.getFirstName());
        stmt.setString(2, customer.getLastName());
        stmt.setString(3, customer.getEmail());
        stmt.setString(4, customer.getPhone());
        stmt.setString(5, customer.getNic());
        stmt.setInt(6, customer.getId());
        int rowsUpdated = stmt.executeUpdate();
        return rowsUpdated > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
    
   }

    public List<Customers> getAllCustomers() {
        List<Customers> customers = new ArrayList<>();
        String query = "SELECT * FROM Customers";
        try (Connection conn = dbconn.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Customers customer = new Customers(rs.getInt("id"), rs.getString("firstName"),
                        rs.getString("lastName"), rs.getString("email"),
                        rs.getString("phone"), rs.getString("nic"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
    
    public Customers getCustomerById(int id) {
    Customers customer = null;
    String query = "SELECT * FROM Customers WHERE id = ?";
    try (Connection conn = dbconn.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            customer = new Customers(
                rs.getInt("id"),
                rs.getString("firstName"),
                rs.getString("lastName"),
                rs.getString("email"),
                rs.getString("phone"),
                rs.getString("nic")
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return customer;
}
}
