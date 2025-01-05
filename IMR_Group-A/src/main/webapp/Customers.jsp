<%@ page import="java.util.List" %>
<%@ page import="Model.Customer" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customers</title>
        <link rel="stylesheet" href="StyleSheet3.css" />
    </head>
    <body>
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
                        <img src="images/icons/Dashboard-B.png" />
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="POSServlet">
                    <li class="nav-item">
                        <img src="images/icons/POS-B.png" />
                        <span>POS</span>
                    </li>
                </a>
                <a href="ProductCatalogServlet">
                    <li class="nav-item">
                        <img src="images/icons/Products-B.png" />
                        <span>Products</span>
                    </li>
                </a>
                <a <%= "Cashier".equalsIgnoreCase(role) ? "" : "href='StockServlet'" %>>
                    <li class="nav-item">
                        <img src="images/icons/Stock-B.png" />
                        <span>Stock</span>
                    </li>
                </a>
                <a href="DiscountServlet">
                    <li class="nav-item">
                        <img src="images/icons/Discount-B.png" />
                        <span>Discounts</span>
                    </li>
                </a>
                <a href="BillManagementServlet">
                    <li class="nav-item">
                        <img src="images/icons/Bills-B.png" />
                        <span>Bills</span>
                    </li>
                </a>
                <a href="CustomersServlet">
                    <li class="nav-item active">
                        <img src="images/icons/Customers-W.png"/>
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
            <form action="StockServlet" method="post" style="display:inline;">
                <input type="hidden" name="action" value="logout"/>
                <button class="logout" type="submit">
                    <img src="images/icons/Logout.png"/>
                    <span>Logout</span>
                </button>
            </form>
        </div>
        
        <div class="notfication-icon">
            <img src="images/icons/notify-icon.png">
        </div>
        
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
        
        <div class="main-header">
            Customer Management
        </div>
        
        <div class="middle-container">
            <button class="add-button" style="font-size:15px" onclick="showSlider()">
                <div>+</div>
                <p>Add Customer</p>
            </button>

            <div class="header-container" style="top:60px;">
                <span class="header-top" style="margin-left:20px">First Name</span>
                <span class="header-top" style="margin-left:220px">Second Name</span>
                <div class="header-top" style="margin-left:420px">Email Address</div>
                <div class="header-top" style="margin-left:720px">Phone Number</div>
                <div class="header-top" style="margin-left:910px">Action</div>
            </div>
            
            <div class="content-container" style="margin-top:150px;height:70%;">
                <%
                    List<Customer> customerList = (List<Customer>) request.getAttribute("customerList");
                    if (customerList != null) {
                        for (Customer c : customerList) {
                %>
                <div class="customer">
                    <p class="cus-fname"><%= c.getFirstName() %></p>
                    <p class="cus-lname"><%= c.getLastName() %></p>
                    <p class="cus-email"><%= c.getEmail() %></p>
                    <p class="cus-phone"><%= c.getPhoneNumber() %></p>
                    <div class="cus-actions">
                        <%
                            if (!"Cashier".equalsIgnoreCase(currentRole)) {
                        %>
                        <div class="edit" 
                             onclick="showEditSlider('<%= c.getCustomerID() %>','<%= c.getFirstName() %>','<%= c.getLastName() %>','<%= c.getNic() %>','<%= c.getPhoneNumber() %>','<%= c.getEmail() %>')">
                            <i class="bi bi-pencil-fill"></i>
                        </div>
                        <div class="delete" 
                             onclick="confirmDelete(<%= c.getCustomerID() %>)">
                            <i class="bi bi-trash3-fill"></i>
                        </div>
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

        <!--Add Item Slider-->
        <div class="Customer-slider" id="addCusSlider">
            <div class="customer-slider-container">
                <div class="customer-slider-header">
                    <div class="Customer-slider-title">Add New Customer</div>
                    <img class="close-customer-slider" src="images/icons/Cancelslide.png" onclick="hideSlider()"/>
                    <div class="customer-slider-hline">
                        <hr size="2" color="#5F4AE7"/>
                    </div>
                </div>
                <div class="customer-slider-form">
                    <form action="CustomersServlet" method="post">
                        <input type="hidden" name="action" value="add"/>
                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label class="cus-form-label">First Name</label>
                                <input class="form-c-text" type="text" name="firstName" required/>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Last Name</label>
                                <input class="form-c-text" type="text" name="lastName" required/>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">NIC</label>
                                <input class="form-c-text" type="text" name="nic" required/>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Phone Number</label>
                                <input class="form-c-text" type="text" name="phone"/>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Email Address</label>
                                <input class="form-c-text" type="text" name="email"/>
                            </div>
                            <button class="form-save-but" type="submit" onclick="hideSlider()">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--Edit Item Slider-->
        <div class="Customer-slider" id="editCusSlider">
            <div class="customer-slider-container">
                <div class="customer-slider-header">
                    <div class="Customer-slider-title">Edit Customer Details</div>
                    <img class="close-customer-slider" src="images/icons/Cancelslide.png" onclick="hideEditSlider()"/>
                    <div class="customer-slider-hline">
                        <hr size="2" color="#5F4AE7"/>
                    </div>
                </div>
                <div class="customer-slider-form">
                    <form action="CustomersServlet" method="post">
                        <input type="hidden" name="action" value="update"/>
                        <input type="hidden" name="customerID" id="edit-customerID"/>
                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label class="cus-form-label">First Name</label>
                                <input class="form-c-text" type="text" name="firstName" id="edit-fname" required/>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Last Name</label>
                                <input class="form-c-text" type="text" name="lastName" id="edit-lname" required/>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">NIC</label>
                                <input class="form-c-text" type="text" name="nic" id="edit-nic" required/>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Phone Number</label>
                                <input class="form-c-text" type="text" name="phone" id="edit-phone"/>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Email Address</label>
                                <input class="form-c-text" type="text" name="email" id="edit-email"/>
                            </div>
                            <button class="form-save-but" type="submit" onclick="hideEditSlider()">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Hidden form for delete -->
        <form id="deleteForm" method="post" action="CustomersServlet" style="display:none;">
            <input type="hidden" name="action" value="delete"/>
            <input type="hidden" name="customerID" id="delete-customerID"/>
        </form>

        <script>
            function showSlider() {
                document.getElementById('addCusSlider').classList.add('active');
            }
            function hideSlider() {
                document.getElementById('addCusSlider').classList.remove('active');
            }
            function showEditSlider(cID, fName, lName, nic, phone, email) {
                document.getElementById('edit-customerID').value = cID;
                document.getElementById('edit-fname').value = fName;
                document.getElementById('edit-lname').value = lName;
                document.getElementById('edit-nic').value = nic;
                document.getElementById('edit-phone').value = phone;
                document.getElementById('edit-email').value = email;
                document.getElementById('editCusSlider').classList.add('active');
            }
            function hideEditSlider() {
                document.getElementById('editCusSlider').classList.remove('active');
            }
            function confirmDelete(cID) {
                if (confirm("Are you sure you want to delete this customer?")) {
                    document.getElementById('delete-customerID').value = cID;
                    document.getElementById('deleteForm').submit();
                }
            }
        </script>
    </body>
</html>
