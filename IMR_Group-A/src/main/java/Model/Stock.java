package Model;

import java.sql.Date;

public class Stock {
    private int stockID;
    private int productID;
    private String productName; 
    private double quantity;
    private Date manufactureDate;
    private Date expiryDate;

    public Stock() {}

    public Stock(int stockID, int productID, String productName, double quantity, Date manufactureDate, Date expiryDate) {
        this.stockID = stockID;
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.manufactureDate = manufactureDate;
        this.expiryDate = expiryDate;
    }

    public int getStockID() {return stockID;}
    
    public void setStockID(int stockID) {this.stockID = stockID;}

    public int getProductID() {return productID;}
    
    public void setProductID(int productID) {this.productID = productID;}

    public String getProductName() {return productName;}
    
    public void setProductName(String productName) {this.productName = productName;}

    public double getQuantity() {return quantity;}
    
    public void setQuantity(double quantity) {this.quantity = quantity;}

    public Date getManufactureDate() {return manufactureDate;}
    
    public void setManufactureDate(Date manufactureDate) {this.manufactureDate = manufactureDate;}

    public Date getExpiryDate() {return expiryDate;}
    
    public void setExpiryDate(Date expiryDate) {this.expiryDate = expiryDate;}
}
