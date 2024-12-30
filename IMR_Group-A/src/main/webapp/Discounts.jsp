<%@page import="Model.Discount"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%!
    // Database connection details
    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=POSSystemDB2;encrypt=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    
    // Method to get product details
    public ResultSet getProductDetails(String productId) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "SELECT ProductName, IsWeighted, PricePerUnit, PricePer100g FROM Products WHERE ProductID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, productId);
            return pstmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Discounts</title>
        <link rel="stylesheet" href="StyleSheet7.css" />
    </head>
    <body>
        
        <!-- Navigational Panel of the Smart POS System -->
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png" /></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>
            <ul class="nav-menu">
                <a href=""><li class="nav-item"><img src="images/icons/Dashboard-B.png"></img><span>Dashboard</span></li></a>
                <a href=""><li class="nav-item"><img src="images/icons/POS-B.png"></img><span>POS</span></li></a>
                <a href=""><li class="nav-item"><img src="images/icons/Products-B.png"></img><span>Products</span></li></a>
                <a href=""><li class="nav-item"><img src="images/icons/Stock-B.png"></img><span>Stock</span></li></a>
                <a href=""><li class="nav-item active"><img src="images/icons/Discount-W.png"></img><span>Discounts</span></li></a>
                <a href=""><li class="nav-item"><img src="images/icons/Bills-B.png"></img><span>Bills</span></li></a>
                <a href=""><li class="nav-item"><img src="images/icons/Customers-B.png"></img><span>Customers</span></li></a>
                <a href=""><li class="nav-item"><img src="images/icons/Reports-B.png"></img><span>Reports</span></li></a>
                <a href=""><li class="nav-item"><img src="images/icons/Admin-B.png"></img><span>Users</span></li></a>
            </ul>
            <button class="logout"><img src="images/icons/Logout.png"/><span>Logout</span></button>
        </div>
        
        <!-- Notification and user profile -->
        <div class="notfication-icon"><img src="images/icons/notify-icon.png"></div>
        <div class="user-profile">
            <div class="user-avatar"><img src="images/icons/usericon.png"></div>
            <div class="user-info">
              <span class="user-name">Leo Perera</span>
              <span class="user-role">Admin</span>
            </div>
        </div>
        
        <!-- Main Header -->
        <div class="main-header">Discount Management</div>
        
        <!-- Add Discount Form -->
        <div class="middle-container">
            <div class="add-discount-container">
                <h2>Add Discount</h2>
                <form action="DiscountServlet" method="POST" class="discount-form">
                    <div class="form-group">
                        <label for="productCode">Enter Product Code</label>
                        <input type="text" id="productCode" name="productCode" required style="margin-left: 100px;">
                    </div>
                    <div class="form-group">
                        <label for="discountPercentage">Enter Discount Percentage</label>
                        <input type="number" id="discountPercentage" name="discountPercentage" required />
                    </div>
                    <button type="submit" class="add-discount-button">Add Discount</button>
                </form>
            </div>
            
            <!-- Success and Error Messages -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <!-- Discount List -->
            <div class="header-container" style="top:60px;">
                <span class="header-top" style="margin-left:20px">Product ID</span>
                <span class="header-top" style="margin-left:140px">Description</span>
                <div class="header-top" style="margin-left:520px"> Price</div>
                <div class="header-top" style="margin-left:660px">Discount %</div>
                <div class="header-top" style="margin-left:800px">Start Date</div>
                <div class="header-top" style="margin-left:945px">Action</div>                
            </div>
                
           <div class="content-container" style="margin-top:150px;">
<% 
    List<Discount> discounts = (List<Discount>)request.getAttribute("discounts");
    if(discounts != null && !discounts.isEmpty()) {
        for(Discount discount : discounts) {
            ResultSet productRS = getProductDetails(String.valueOf(discount.getProductId()));
            String productName = "";
            String price = "";
            
            if(productRS != null && productRS.next()) {
                productName = productRS.getString("ProductName");
                if(productRS.getBoolean("IsWeighted")) {
                    price = String.format("%.2f", productRS.getDouble("PricePer100g")) + "/100g";
                } else {
                    price = String.format("%.2f", productRS.getDouble("PricePerUnit")) + "/unit";
                }
                productRS.close();
            }
%>
            <div class="discount">
                <p class="dis-product-id"><%=discount.getProductId()%></p>
                <p class="dis-product-name"><%=productName%></p>
                <p class="dis-unit-price"><%=price%></p>
                <p class="dis-discount"><%=discount.getDiscountPercentage()%>%</p>
                <p class="dis-date"><%=discount.getStartDate()%></p>
                <div class="dis-actions">
                    <form action="DiscountServlet" method="GET" style="display:inline;">
                        <input type="hidden" name="action" value="delete" />
                        <input type="hidden" name="discountId" value="<%=discount.getDiscountId()%>" />
                        <button type="submit" class="delete-button">
                            <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                        </button>
                    </form>
                </div> 
            </div>
<% 
        }
    } else {
%>
        <div class="no-discounts">
            <p>No discounts available</p>
        </div>
<% 
    }
%>
</div>
            
              
        </div>
    </body>
</html>
