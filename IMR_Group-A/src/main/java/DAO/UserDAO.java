package DAO;

import DB.dbconn;
import Model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDAO {
    public String getUserRoleByID(int userID) {
        String sql = "SELECT Role FROM Users WHERE UserID = ?";
        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("Role");
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public User getUserByID(int userID) {
        String sql = "SELECT UserID, FullName, NIC, Role, Password FROM vwUsers WHERE UserID = ?";
        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserID(rs.getInt("UserID"));
                    user.setFullName(rs.getString("FullName"));
                    user.setNic(rs.getString("NIC"));
                    user.setRole(rs.getString("Role"));
                    user.setPassword(rs.getString("Password"));
                    return user;
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT UserID, FullName, NIC, Role, Password FROM vwUsers ORDER BY UserID ASC";
        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setFullName(rs.getString("FullName"));
                user.setNic(rs.getString("NIC"));
                user.setRole(rs.getString("Role"));
                user.setPassword(rs.getString("Password"));
                users.add(user);
            }
        } catch (SQLException e) {
        }
        return users;
    }

    public List<User> getManagerView(int managerID) {
        User manager = getUserByID(managerID);
        List<User> result = new ArrayList<>();
        if (manager != null) {
            result.add(manager);
        }
        String sql = "SELECT UserID, FullName, NIC, Role, Password FROM vwUsers WHERE Role = 'Cashier' ORDER BY UserID ASC";
        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setFullName(rs.getString("FullName"));
                user.setNic(rs.getString("NIC"));
                user.setRole(rs.getString("Role"));
                user.setPassword(rs.getString("Password"));
                result.add(user);
            }
        } catch (SQLException e) {
        }
        return result;
    }

    public User getCashierView(int cashierID) {
        return getUserByID(cashierID);
    }

    public int addUser(String fullName, String nic, String role, String hashedPassword) {
        int newUserID = -1;
        String sql = "{CALL spAddUser(?,?,?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setString(1, fullName);
            cstmt.setString(2, nic);
            cstmt.setString(3, role);
            cstmt.setString(4, hashedPassword);

            try (ResultSet rs = cstmt.executeQuery()) {
                if (rs.next()) {
                    newUserID = rs.getInt("NewUserID");
                }
            }
        } catch (SQLException e) {
        }
        return newUserID;
    }

    public void updateUser(int userID, String fullName, String nic, String role) {
        String sql = "{CALL spUpdateUser(?,?,?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {

            cstmt.setInt(1, userID);
            cstmt.setString(2, fullName);
            cstmt.setString(3, nic);
            cstmt.setString(4, role);
            cstmt.execute();
        } catch (SQLException e) {
        }
    }

    public void deleteUser(int userID) {
        String sql = "{CALL spDeleteUser(?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            cstmt.setInt(1, userID);
            cstmt.execute();
        } catch (SQLException e) {
        }
    }
    
    public boolean changePassword(int userID, String oldHashed, String newHashed) {
        String sql = "{CALL spChangePassword(?,?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            cstmt.setInt(1, userID);
            cstmt.setString(2, oldHashed);
            cstmt.setString(3, newHashed);

            try (ResultSet rs = cstmt.executeQuery()) {
                if (rs.next()) {
                    int returnCode = rs.getInt("ReturnCode");
                    return (returnCode == 1);
                }
            }
        } catch (SQLException e) {
        }
        return false;
    }
    
    public User authenticateUser(String fullName, String hashedPassword) {
        String sql = "SELECT UserID, FullName, NIC, Role, Password "
                   + "FROM Users "
                   + "WHERE FullName = ? AND Password = ?";

        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, fullName);
            stmt.setString(2, hashedPassword);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserID(rs.getInt("UserID"));
                    user.setFullName(rs.getString("FullName"));
                    user.setNic(rs.getString("NIC"));
                    user.setRole(rs.getString("Role"));
                    user.setPassword(rs.getString("Password"));
                    return user;
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
