package Model;

import java.util.Date;

public class TransactionHeader {
    private int transactionID;
    private Date transactionDate;
    private String paymentMethod;
    private int cashierID;

    public TransactionHeader() {}

    public TransactionHeader(int transactionID, Date transactionDate, String paymentMethod, int cashierID) {
        this.transactionID = transactionID;
        this.transactionDate = transactionDate;
        this.paymentMethod = paymentMethod;
        this.cashierID = cashierID;
    }

    public int getTransactionID() {return transactionID;}
    public void setTransactionID(int transactionID) {this.transactionID = transactionID;}

    public Date getTransactionDate() {return transactionDate;}
    public void setTransactionDate(Date transactionDate) {this.transactionDate = transactionDate;}

    public String getPaymentMethod() {return paymentMethod;}
    public void setPaymentMethod(String paymentMethod) {this.paymentMethod = paymentMethod;}

    public int getCashierID() {return cashierID;}
    public void setCashierID(int cashierID) {this.cashierID = cashierID;}
}
