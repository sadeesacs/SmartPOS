package Model;

import java.sql.Timestamp;

public class BillManagementModels {
    public static class BillSummary {
        private int transactionID;
        private Timestamp transactionDate;
        private int itemCount;
        private double totalNoDiscount;
        private double netAmount;

        public int getTransactionID() { return transactionID; }
        public void setTransactionID(int transactionID) { this.transactionID = transactionID; }

        public Timestamp getTransactionDate() { return transactionDate; }
        public void setTransactionDate(Timestamp transactionDate) { this.transactionDate = transactionDate; }

        public int getItemCount() { return itemCount; }
        public void setItemCount(int itemCount) { this.itemCount = itemCount; }

        public double getTotalNoDiscount() { return totalNoDiscount; }
        public void setTotalNoDiscount(double totalNoDiscount) { this.totalNoDiscount = totalNoDiscount; }

        public double getNetAmount() { return netAmount; }
        public void setNetAmount(double netAmount) { this.netAmount = netAmount; }
    }

    public static class BillLine {
        private int stockID;
        private String productName;
        private boolean isWeighted;
        private double unitPrice;
        private double quantitySold;
        private double lineTotal;

        public int getStockID() { return stockID; }
        public void setStockID(int stockID) { this.stockID = stockID; }

        public String getProductName() { return productName; }
        public void setProductName(String productName) { this.productName = productName; }

        public boolean isWeighted() { return isWeighted; }
        public void setWeighted(boolean isWeighted) { this.isWeighted = isWeighted; }

        public double getUnitPrice() { return unitPrice; }
        public void setUnitPrice(double unitPrice) { this.unitPrice = unitPrice; }

        public double getQuantitySold() { return quantitySold; }
        public void setQuantitySold(double quantitySold) { this.quantitySold = quantitySold; }

        public double getLineTotal() { return lineTotal; }
        public void setLineTotal(double lineTotal) { this.lineTotal = lineTotal; }
    }

    public static class TransactionHeaderInfo {
        private Timestamp transactionDate;
        private String paymentMethod;
        private int cashierID;

        public Timestamp getTransactionDate() { return transactionDate; }
        public void setTransactionDate(Timestamp transactionDate) { this.transactionDate = transactionDate; }

        public String getPaymentMethod() { return paymentMethod; }
        public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

        public int getCashierID() { return cashierID; }
        public void setCashierID(int cashierID) { this.cashierID = cashierID; }
    }
}
