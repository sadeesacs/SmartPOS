package DAO;

import DB.dbconn;
import java.sql.*;

public class TransactionDAO {
    public int addTransactionHeader(String paymentMethod, int cashierID) {
        int newID = -1;
        String sql = "{CALL spAddTransactionHeader(?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            cstmt.setString(1, paymentMethod);
            cstmt.setInt(2, cashierID);

            try (ResultSet rs = cstmt.executeQuery()) {
                if (rs.next()) {
                    newID = rs.getInt("NewTransactionID");
                }
            }
        } catch (SQLException e) {
        }
        return newID;
    }

    public void addTransactionLine(int transactionID, int lineNumber, int stockID, double quantitySold, double discountPercentage) {
        String sql = "{CALL spAddTransactionLine(?,?,?,?,?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            cstmt.setInt(1, transactionID);
            cstmt.setInt(2, lineNumber);
            cstmt.setInt(3, stockID);
            cstmt.setDouble(4, quantitySold);
            cstmt.setDouble(5, discountPercentage);
            cstmt.execute();
        } catch (SQLException e) {
        }
    }
}