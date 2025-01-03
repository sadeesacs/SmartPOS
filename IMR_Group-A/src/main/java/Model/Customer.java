package Model;

public class Customer {
    private int customerID;
    private String firstName;
    private String lastName;
    private String nic;
    private String phoneNumber;
    private String email;

    public Customer() {}

    public Customer(int customerID, String firstName, String lastName, String nic, String phoneNumber, String email) {
        this.customerID = customerID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.nic = nic;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public int getCustomerID() {return customerID;}
    public void setCustomerID(int customerID) {this.customerID = customerID;}

    public String getFirstName() {return firstName;}
    public void setFirstName(String firstName) {this.firstName = firstName;}

    public String getLastName() {return lastName;}
    public void setLastName(String lastName) {this.lastName = lastName;}

    public String getNic() {return nic;}
    public void setNic(String nic) {this.nic = nic;}

    public String getPhoneNumber() {return phoneNumber;}
    public void setPhoneNumber(String phoneNumber) {this.phoneNumber = phoneNumber;}

    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}
}
