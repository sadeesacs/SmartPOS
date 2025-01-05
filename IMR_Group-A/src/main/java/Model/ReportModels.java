package Model;

public class ReportModels {
    
    public static class DailyStockItem {
        private String productID;
        private String productName;
        private int stockQuantity;
        private int quantitySold;
        private String stockStatus;

        public String getProductID() { return productID; }
        public void setProductID(String productID) { this.productID = productID; }

        public String getProductName() { return productName; }
        public void setProductName(String productName) { this.productName = productName; }

        public int getStockQuantity() { return stockQuantity; }
        public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }

        public int getQuantitySold() { return quantitySold; }
        public void setQuantitySold(int quantitySold) { this.quantitySold = quantitySold; }

        public String getStockStatus() { return stockStatus; }
        public void setStockStatus(String stockStatus) { this.stockStatus = stockStatus; }
    }

    public static class MonthlyRevenueItem {
        private int day;
        private double totalRevenue;

        public int getDay() { return day; }
        public void setDay(int day) { this.day = day; }

        public double getTotalRevenue() { return totalRevenue; }
        public void setTotalRevenue(double totalRevenue) { this.totalRevenue = totalRevenue; }
    }

    public static class ProductPerformance {
        private String productID;
        private String productName;
        private int unitsSold;
        private double revenue;

        public String getProductID() { return productID; }
        public void setProductID(String productID) { this.productID = productID; }

        public String getProductName() { return productName; }
        public void setProductName(String productName) { this.productName = productName; }

        public int getUnitsSold() { return unitsSold; }
        public void setUnitsSold(int unitsSold) { this.unitsSold = unitsSold; }

        public double getRevenue() { return revenue; }
        public void setRevenue(double revenue) { this.revenue = revenue; }
    }
}