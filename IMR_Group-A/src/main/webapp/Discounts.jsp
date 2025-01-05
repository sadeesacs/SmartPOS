<%@ page import="java.util.List" %>
<%@ page import="DAO.DiscountDAO.DiscountViewItem" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Discounts</title>
        <link rel="stylesheet" href="StyleSheet7.css" />
    </head>
    <body>
        
        <!-- Navigation -->
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png" /></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>
            
            <%
                String role = (String) request.getAttribute("currentRole");
                if (role == null) role = "Unknown";
            %>
            
            <ul class="nav-menu">
                <a <%= "Cashier".equalsIgnoreCase(role) ? "" : "href='DashboardServlet'" %>>
                    <li class="nav-item">
                        <img src="images/icons/Dashboard-B.png"/>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="POSServlet">
                    <li class="nav-item">
                        <img src="images/icons/POS-B.png"/>
                        <span>POS</span>
                    </li>
                </a>
                <a href="ProductCatalogServlet">
                    <li class="nav-item">
                        <img src="images/icons/Products-B.png"/>
                        <span>Products</span>
                    </li>
                </a>
                <a <%= "Cashier".equalsIgnoreCase(role) ? "" : "href='StockServlet'" %>>
                    <li class="nav-item">
                        <img src="images/icons/Stock-B.png"/>
                        <span>Stock</span>
                    </li>
                </a>
                <a href="DiscountServlet">
                    <li class="nav-item active">
                        <img src="images/icons/Discount-W.png"/>
                        <span>Discounts</span>
                    </li>
                </a>
                <a href="BillManagementServlet">
                    <li class="nav-item ">
                        <img src="images/icons/Bills-B.png"></img>
                        <span>Bills</span>
                    </li>
                </a>
                <a href="CustomersServlet">
                    <li class="nav-item ">
                        <img src="images/icons/Customers-B.png"></img>
                        <span>Customers</span>
                    </li>
                </a>
                <a <%= "Cashier".equalsIgnoreCase(role) ? "" : "href='ReportsServlet'" %>>
                    <li class="nav-item ">
                        <img src="images/icons/Reports-B.png"></img>
                        <span>Reports</span>
                    </li>
                </a>
                <a href="SystemUsersServlet">
                    <li class="nav-item ">
                        <img src="images/icons/Admin-B.png"></img>
                        <span>Users</span>
                    </li>
                </a>
            </ul>
            <!-- Logout form -->
            <form action="StockServlet" method="post" style="display:inline;">
                <input type="hidden" name="action" value="logout"/>
                <button class="logout" type="submit">
                    <img src="images/icons/Logout.png"/>
                    <span>Logout</span>
                </button>
            </form>
        </div>
        
        <!-- Notification Icon -->
        <div class="notfication-icon">
            <img src="images/icons/notify-icon.png">
        </div>
        
        <!-- User Profile -->
        <div class="user-profile">
            <div class="user-avatar">
              <img src="images/icons/usericon.png">
            </div>
            <div class="user-info">
              <%
                  String currentRole = (String) request.getAttribute("currentRole");
                  String fullname = (String) request.getAttribute("fullname");
                  if (currentRole == null) currentRole = "UnknownRole";
                  if (fullname == null) fullname = "UnknownUser";
              %>
              <span class="user-name"><%= fullname %></span>
              <span class="user-role"><%= currentRole %></span>
            </div>
        </div>
        
        <!-- Main Header -->
        <div class="main-header">
            Discount Management
        </div>
        
        <!-- Middle Container -->
        <div class="middle-container">
            <%
                if (!"Cashier".equalsIgnoreCase(currentRole)) {
            %>
            <div class="add-discount-container">
                <h2>Add Discount</h2>
                <form action="DiscountServlet" method="POST" class="discount-form">
                    <input type="hidden" name="action" value="addDiscount"/>
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
            <%
                }
            %>
            <div class="header-container" style="top:60px;">
                <span class="header-top" style="margin-left:20px">Product ID</span>
                <span class="header-top" style="margin-left:140px">Description</span>
                <div class="header-top" style="margin-left:520px">Unit Price</div>
                <div class="header-top" style="margin-left:660px">Discount %</div>
                <div class="header-top" style="margin-left:800px">Started Date</div>
                <div class="header-top" style="margin-left:945px">Action</div>                
            </div>
                
            <div class="content-container" style="margin-top:150px;">
                <%
                    List<DiscountViewItem> discountList = (List<DiscountViewItem>) request.getAttribute("discountList");
                    if (discountList != null) {
                        for (DiscountViewItem di : discountList) {
                %>
                <div class="discount">
                    <p class="dis-product-id">#<%= di.getProductID() %></p>
                    <p class="dis-product-name"><%= di.getProductName() %></p>
                    <p class="dis-unit-price">
                        <%= String.format("%.2f", di.getPrice()) %>
                    </p>
                    <p class="dis-discount">
                        <%= String.format("%.2f", di.getDiscountPercentage()) %>%
                    </p>
                    <p class="dis-date">
                        <%
                           java.sql.Date sd = di.getStartDate();
                           if (sd != null) {
                               out.print(sd.toString());
                           } else {
                               out.print("");
                           }
                        %>
                    </p>
                    <div class="dis-actions">
                        <%
                            if (!"Cashier".equalsIgnoreCase(currentRole)) {
                        %>
                        <!-- Delete form -->
                        <form method="post" action="DiscountServlet" style="display:inline;">
                            <input type="hidden" name="action" value="deleteDiscount"/>
                            <input type="hidden" name="productID" value="<%= di.getProductID() %>"/>
                            <button class="delete" type="submit" 
                                    onclick="return confirm('Are you sure you want to delete this discount?');">
                                <i class="bi bi-trash3-fill"></i>
                            </button>
                        </form>
                        <%
                            }
                        %>
                    </div> 
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>