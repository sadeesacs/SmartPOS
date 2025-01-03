package DAO;

import DB.dbconn;
import Model.BillManagementModels.BillSummary;
import Model.BillManagementModels.BillLine;
import Model.BillManagementModels.TransactionHeaderInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillManagementDAO {
    public List<BillSummary> getAllTransactions() {
        List<BillSummary> list = new ArrayList<>();
        String sql = "SELECT TransactionID, TransactionDate, ItemCount, TotalNoDiscount, NetAmount "
                   + "FROM vwBillSummary "
                   + "ORDER BY TransactionID DESC";
        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                BillSummary bs = new BillSummary();
                bs.setTransactionID(rs.getInt("TransactionID"));
                bs.setTransactionDate(rs.getTimestamp("TransactionDate"));
                bs.setItemCount(rs.getInt("ItemCount"));
                bs.setTotalNoDiscount(rs.getDouble("TotalNoDiscount"));
                bs.setNetAmount(rs.getDouble("NetAmount"));
                list.add(bs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public BillSummary getTransactionByID(int txID) {
        BillSummary bs = null;
        String sql = "SELECT TransactionID, TransactionDate, ItemCount, TotalNoDiscount, NetAmount "
                   + "FROM vwBillSummary "
                   + "WHERE TransactionID = ?";
        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, txID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    bs = new BillSummary();
                    bs.setTransactionID(rs.getInt("TransactionID"));
                    bs.setTransactionDate(rs.getTimestamp("TransactionDate"));
                    bs.setItemCount(rs.getInt("ItemCount"));
                    bs.setTotalNoDiscount(rs.getDouble("TotalNoDiscount"));
                    bs.setNetAmount(rs.getDouble("NetAmount"));
                }
            }
        } catch (SQLException e) {
        }
        return bs;
    }

    public TransactionHeaderInfo getTransactionHeader(int txID) {
        TransactionHeaderInfo header = null;
        String sql = "SELECT TransactionDate, PaymentMethod, CashierID "
                   + "FROM TransactionHeader "
                   + "WHERE TransactionID = ?";
        try (Connection conn = dbconn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, txID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    header = new TransactionHeaderInfo();
                    header.setTransactionDate(rs.getTimestamp("TransactionDate"));
                    header.setPaymentMethod(rs.getString("PaymentMethod"));
                    header.setCashierID(rs.getInt("CashierID"));
                }
            }
        } catch (SQLException e) {
        }
        return header;
    }

    public List<BillLine> getTransactionLines(int txID) {
        List<BillLine> lines = new ArrayList<>();
        String sql = "{CALL spGetTransactionLines(?)}";
        try (Connection conn = dbconn.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            cstmt.setInt(1, txID);
            try (ResultSet rs = cstmt.executeQuery()) {
                while (rs.next()) {
                    BillLine bl = new BillLine();
                    bl.setStockID(rs.getInt("StockID"));
                    bl.setProductName(rs.getString("ProductName"));
                    bl.setWeighted(rs.getBoolean("IsWeighted"));
                    bl.setUnitPrice(rs.getDouble("UnitPrice"));
                    bl.setQuantitySold(rs.getDouble("QuantitySold"));
                    bl.setLineTotal(rs.getDouble("LineTotal"));
                    lines.add(bl);
                }
            }
        } catch (SQLException e) {
        }
        return lines;
    }
}