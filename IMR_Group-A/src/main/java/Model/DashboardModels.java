package Model;

public class DashboardModels {
    public static class DashboardStats {
        private int totalCustomers;
        private int criticalStock;
        private double totalSales;
        private double totalItems; 

        public int getTotalCustomers() { return totalCustomers; }
        public void setTotalCustomers(int totalCustomers) { this.totalCustomers = totalCustomers; }

        public int getCriticalStock() { return criticalStock; }
        public void setCriticalStock(int criticalStock) { this.criticalStock = criticalStock; }

        public double getTotalSales() { return totalSales; }
        public void setTotalSales(double totalSales) { this.totalSales = totalSales; }

        public double getTotalItems() { return totalItems; }
        public void setTotalItems(double totalItems) { this.totalItems = totalItems; }
    }

    // Bar Chart
    public static class DailySalesItem {
        private java.sql.Date day;
        private double total;

        public java.sql.Date getDay() { return day; }
        public void setDay(java.sql.Date day) { this.day = day; }

        public double getTotal() { return total; }
        public void setTotal(double total) { this.total = total; }
    }
    
    // Pie Chart
    public static class CategorySalesItem {
        private String category;
        private double total;

        public String getCategory() { return category; }
        public void setCategory(String category) { this.category = category; }

        public double getTotal() { return total; }
        public void setTotal(double total) { this.total = total; }
    }
}
