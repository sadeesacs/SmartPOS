package DAO;
import Model.Discount;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class DiscountDAO {
    private Connection connection;

    // Constructor to establish a database connection
    public DiscountDAO() {
        try {
            // Load the JDBC driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
            
            // Replace with your actual database credentials
            String url = "jdbc:sqlserver://localhost:1433;databaseName=POSSystemDB2;encrypt=false";
            String user = "root";
            String password = "root";
            connection = DriverManager.getConnection(url, user, password); 
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to add a new discount
    public void addDiscount(Discount discount) throws SQLException {
        if (discount.getProductId() == 0 || discount.getDiscountPercentage() <= 0) {
            throw new SQLException("Product ID and Discount Percentage cannot be null or zero.");
        }

        String sql = "INSERT INTO Discounts (ProductID, DiscountPercentage, StartDate) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, discount.getProductId());
            statement.setDouble(2, discount.getDiscountPercentage());
            statement.setDate(3, new java.sql.Date(System.currentTimeMillis()));
            statement.executeUpdate();
        }
    }

    // Method to get all discounts
    public List<Discount> getAllDiscounts() {
        List<Discount> discounts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Discounts";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Discount discount = new Discount();
                discount.setDiscountId(resultSet.getInt("DiscountID"));
                discount.setProductId(resultSet.getInt("ProductID"));
                discount.setDiscountPercentage(resultSet.getDouble("DiscountPercentage"));
                discount.setStartDate(resultSet.getDate("StartDate"));
                discounts.add(discount);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return discounts;
    }

    // Method to delete a discount by ID
    public void deleteDiscount(int discountId) throws SQLException {
        String sql = "DELETE FROM Discounts WHERE DiscountID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, discountId);
            statement.executeUpdate();
        }
    }

    // Method to close the database connection
    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}