package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconn {
    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=POSSystemDB;encrypt=false";
    private static final String DB_USERNAME = "root";        
    private static final String DB_PASSWORD = "root"; 
    
    static {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            System.err.println("Error loading SQL Server JDBC Driver: " + e.getMessage());
        }
    }
    
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    }
    
    public static void main(String[] args) {
        try (Connection conn = dbconn.getConnection()) {
            if (conn != null) {
                System.out.println("Database connection is doneeeee.");
            } else {
                System.out.println("Failed to make connection.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}