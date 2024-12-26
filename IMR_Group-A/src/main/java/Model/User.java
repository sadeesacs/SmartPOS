package Model;


public class User {
    private int userID;
    private String fullName;
    private String nic;
    private String role;      // 'Cashier', 'Manager', or 'Admin'
    private String password;  // hashed password

    public User() {}

    public User(int userID, String fullName, String nic, String role, String password) {
        this.userID = userID;
        this.fullName = fullName;
        this.nic = nic;
        this.role = role;
        this.password = password;
    }

    // Getters and setters
    public int getUserID() {
        return userID;
    }
    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getNic() {
        return nic;
    }
    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
