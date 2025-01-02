package DAO;

import DB.dbconn;
import Model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    public List<Customer> getAllCustomers() {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT CustomerID, FirstName, LastName, NIC, PhoneNumber, Email "
                      + "FROM vwCustomers "
                      + "ORDER BY CustomerID DESC";
        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Customer c = new Customer();
                c.setCustomerID(rs.getInt("CustomerID"));
                c.setFirstName(rs.getString("FirstName"));
                c.setLastName(rs.getString("LastName"));
                c.setNic(rs.getString("NIC"));
                c.setPhoneNumber(rs.getString("PhoneNumber"));
                c.setEmail(rs.getString("Email"));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int addCustomer(Customer cust) throws SQLException {
        int newID = -1;
        String sql = "{CALL spAddCustomer(?,?,?,?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setString(1, cust.getFirstName());
            cstmt.setString(2, cust.getLastName());
            cstmt.setString(3, cust.getNic());
            cstmt.setString(4, cust.getPhoneNumber());
            cstmt.setString(5, cust.getEmail());

            try (ResultSet rs = cstmt.executeQuery()) {
                if (rs.next()) {
                    newID = rs.getInt("NewCustomerID");
                }
            }
        }
        return newID;
    }

    public void updateCustomer(Customer cust) throws SQLException {
        String sql = "{CALL spUpdateCustomer(?,?,?,?,?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setInt(1, cust.getCustomerID());
            cstmt.setString(2, cust.getFirstName());
            cstmt.setString(3, cust.getLastName());
            cstmt.setString(4, cust.getNic());
            cstmt.setString(5, cust.getPhoneNumber());
            cstmt.setString(6, cust.getEmail());

            cstmt.execute();
        }
    }

    public void deleteCustomer(int customerID) throws SQLException {
        String sql = "{CALL spDeleteCustomer(?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            cstmt.setInt(1, customerID);
            cstmt.execute();
        }
    }
}
