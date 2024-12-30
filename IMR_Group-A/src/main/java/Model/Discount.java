package Model;
import java.sql.Date;


public class Discount {

    private int discountId;
    private int productId;
    private double discountPercentage;
    private Date startDate; 

    // Default Constructor
    public Discount() {
    }

    // Parameterized Constructor
    public Discount(int discountId, int productId, double discountPercentage, Date startDate) {
        this.discountId = discountId;
        this.productId = productId;
        this.discountPercentage = discountPercentage;
        this.startDate = startDate;
    }

    // Getters and Setters
    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public double getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(double discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    // Overridden toString() method for debugging and logging
    @Override
    public String toString() {
        return "Discount{" +
                "discountId=" + discountId +
                ", productId=" + productId +
                ", discountPercentage=" + discountPercentage +
                ", startDate=" + startDate +
                '}';
    }
}