package Model;

public class TransactionLine {
    private int transactionID;
    private int lineNumber;
    private int stockID;
    private double quantitySold;
    private double lineDiscountApplied;  
    private double lineTotal;

    public TransactionLine() {}

    public TransactionLine(int transactionID, int lineNumber, int stockID, double quantitySold, double lineDiscountApplied, double lineTotal) {
        this.transactionID = transactionID;
        this.lineNumber = lineNumber;
        this.stockID = stockID;
        this.quantitySold = quantitySold;
        this.lineDiscountApplied = lineDiscountApplied;
        this.lineTotal = lineTotal;
    }

    public int getTransactionID() {return transactionID;}
    public void setTransactionID(int transactionID) {this.transactionID = transactionID;}

    public int getLineNumber() {return lineNumber;}
    public void setLineNumber(int lineNumber) {this.lineNumber = lineNumber;}

    public int getStockID() {return stockID;}
    public void setStockID(int stockID) {this.stockID = stockID;}

    public double getQuantitySold() {return quantitySold;}
    public void setQuantitySold(double quantitySold) {this.quantitySold = quantitySold;}

    public double getLineDiscountApplied() {return lineDiscountApplied;}
    public void setLineDiscountApplied(double lineDiscountApplied) {this.lineDiscountApplied = lineDiscountApplied;}

    public double getLineTotal() {return lineTotal;}
    public void setLineTotal(double lineTotal) {this.lineTotal = lineTotal;}
}
