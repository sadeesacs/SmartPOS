package Model;

public class Product {
    private int productID;
    private String productName;
    private String productCategory;  
    private boolean isWeighted;
    private double pricePerUnit;    
    private double pricePer100g;     
    private String productImageURL;  

    public Product() {}

    public Product(int productID, String productName, String productCategory, boolean isWeighted, double pricePerUnit, double pricePer100g, String productImageURL) {
        this.productID = productID;
        this.productName = productName;
        this.productCategory = productCategory;
        this.isWeighted = isWeighted;
        this.pricePerUnit = pricePerUnit;
        this.pricePer100g = pricePer100g;
        this.productImageURL = productImageURL;
    }

    public int getProductID() {return productID;}
    public void setProductID(int productID) {this.productID = productID;}

    public String getProductName() {return productName;}
    public void setProductName(String productName) {this.productName = productName;}

    public String getProductCategory() {return productCategory;}
    public void setProductCategory(String productCategory) {this.productCategory = productCategory;}

    public boolean isWeighted() {return isWeighted;}
    public void setWeighted(boolean isWeighted) {this.isWeighted = isWeighted;}

    public double getPricePerUnit() {return pricePerUnit;}
    public void setPricePerUnit(double pricePerUnit) {this.pricePerUnit = pricePerUnit;}

    public double getPricePer100g() {return pricePer100g;}
    public void setPricePer100g(double pricePer100g) {this.pricePer100g = pricePer100g;}

    public String getProductImageURL() {return productImageURL;}
    public void setProductImageURL(String productImageURL) {this.productImageURL = productImageURL;}
}
