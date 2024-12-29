<%@page import="DAO.CustomersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.Customers" %>
<%@ page import="DAO.CustomersDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers</title>
        <link rel="stylesheet" href="StyleSheet3.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <!-- Navigation section remains the same -->
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png" /></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>

            <ul class="nav-menu">
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Dashboard-B.png"></img>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/POS-B.png"></img>
                        <span>POS</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Products-B.png"></img>
                        <span>Products</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Stock-B.png"></img>
                        <span>Stock</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item ">
                        <img src="images/icons/Discount-B.png"></img>
                        <span>Discounts</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item ">
                        <img src="images/icons/Bills-B.png"></img>
                        <span>Bills</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item active">
                        <img src="images/icons/Customers-W.png"></img>
                        <span>Customers</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item ">
                        <img src="images/icons/Reports-B.png"></img>
                        <span>Reports</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item ">
                        <img src="images/icons/Admin-B.png"></img>
                        <span>Users</span>
                    </li>
                </a>
            </ul>
            <button class="logout">
                <img src="images/icons/Logout.png"/>
                <span>Logout</span>
            </button>
        </div>

        <!--Notification Icon of the header-->
        <div class="notfication-icon">
            <img src="images/icons/notify-icon.png">
        </div>

        <!--User Profile View of the header-->
        <div class="user-profile">
            <div class="user-avatar">
                <img src="images/icons/usericon.png">
            </div>
            <div class="user-info">
                <span class="user-name">Leo Perera</span>
                <span class="user-role">Admin</span>
            </div>
        </div>

        <!--Main Header-->
        <div class="main-header">
            Customer Management
        </div>

        <!--Middle Container-->
        <div class="middle-container">
            <button class="add-button" style="font-size: 15px" onclick="showSlider()">
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

            <div class="content-container" style="margin-top:150px;height: 70%">
                <%
                    CustomersDAO dao = new CustomersDAO();
                    List<Customers> customerList = dao.getAllCustomers();

                    for (Customers customer : customerList) {
                %>
                <div class="customer">
                    <p class="cus-fname"><%=customer.getFirstName()%></p>
                    <p class="cus-lname"><%=customer.getLastName()%></p>
                    <p class="cus-email"><%=customer.getEmail()%></p>
                    <p class="cus-phone"><%=customer.getPhone()%></p>

                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider(<%=customer.getId()%>, '<%=customer.getFirstName()%>', '<%=customer.getLastName()%>', '<%=customer.getEmail()%>', '<%=customer.getPhone()%>', '<%=customer.getNic()%>')">
                            <i class="bi bi-pencil-fill"></i>
                        </div>

                        <div class="delete" onclick="deleteCustomer(<%=customer.getId()%>)">
                            <i class="bi bi-trash3-fill"></i>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>

        <!--Add Item Slider-->
        <div class="Customer-slider" id="addCusSlider">
            <div class="customer-slider-container">
                <div class="customer-slider-header">
                    <div class="Customer-slider-title">Add New Customer</div>
                    <img class="close-customer-slider" src="images/icons/Cancelslide.png" onclick="hideSlider()" />
                    <div class="customer-slider-hline">
                        <hr size="2" color="#5F4AE7" />
                    </div>
                </div>

                <div class="customer-slider-form">
                    <form action="CustomerServlet" method="POST">
                        <input type="hidden" name="action" value="add">
                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label for="customer-fname" class="cus-form-label">First Name</label>
                                <input class="form-c-text" type="text" id="customer-fname" name="firstName" required/>
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-lname" class="cus-form-label">Last Name</label>
                                <input class="form-c-text" type="text" id="customer-lname" name="lastName" required/>
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-phone" class="cus-form-label">Phone Number</label>
                                <input class="form-c-text" type="text" id="phone-no" name="phone" required/>
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-email" class="cus-form-label">Email Address</label>
                                <input class="form-c-text" type="email" id="email" name="email" required/>
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-nic" class="cus-form-label">NIC</label>
                                <input class="form-c-text" type="text" id="nic" name="nic" required/>
                            </div>
                            <button class="form-save-but" type="submit">Save</button>
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
                    <div style="text-align: center; margin: 10px 0;">
                        <strong>Customer ID: <span id="display-customer-id"></span></strong>
                    </div>
                    <img class="close-customer-slider" src="images/icons/Cancelslide.png" onclick="hideEditSlider()" />
                    <div class="customer-slider-hline">
                        <hr size="2" color="#5F4AE7" />
                    </div>
                </div>

                <div class="customer-slider-form">
                    <form action="CustomerServlet" method="POST">
                        <input type="hidden" name="action" value="edit" />
                        <input type="hidden" name="customerId" id="edit-customer-id" />

                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label for="edit-customer-fname" class="cus-form-label">First Name</label>
                                <input class="form-c-text" type="text" name="firstName" id="edit-customer-fname" required />
                            </div>
                            <div class="cus-form-row">
                                <label for="edit-customer-lname" class="cus-form-label">Last Name</label>
                                <input class="form-c-text" type="text" name="lastName" id="edit-customer-lname" required />
                            </div>
                            <div class="cus-form-row">
                                <label for="edit-customer-phone" class="cus-form-label">Phone Number</label>
                                <input class="form-c-text" type="text" name="phone" id="edit-customer-phone" required />
                            </div>
                            <div class="cus-form-row">
                                <label for="edit-customer-email" class="cus-form-label">Email Address</label>
                                <input class="form-c-text" type="text" name="email" id="edit-customer-email" required />
                            </div>
                            <div class="cus-form-row">
                                <label for="edit-customer-nic" class="cus-form-label">NIC</label>
                                <input class="form-c-text" type="text" name="nic" id="edit-customer-nic" required />
                            </div>
                            <button class="form-save-but" type="submit">Update</button>
                        </div>
                    </form>
                </div>  
            </div>
        </div>


        <script>
            function showSlider() {
                document.getElementById('addCusSlider').classList.add('active');
            }

            function hideSlider() {
                document.getElementById('addCusSlider').classList.remove('active');
            }

            function showEditSlider(id, firstName, lastName, email, phone, nic) {
                // Show the slider
                document.getElementById('editCusSlider').classList.add('active');

                // Set the customer ID in both display and hidden input
                document.getElementById('display-customer-id').textContent = id;
                document.getElementById('edit-customer-id').value = id;

                // Set form field values
                document.getElementById('edit-customer-fname').value = firstName;
                document.getElementById('edit-customer-lname').value = lastName;
                document.getElementById('edit-customer-email').value = email;
                document.getElementById('edit-customer-phone').value = phone;
                document.getElementById('edit-customer-nic').value = nic;
            }

            function hideEditSlider() {
                document.getElementById('editCusSlider').classList.remove('active');
            }


            function hideEditSlider() {
                document.getElementById('editCusSlider').classList.remove('active');

            }
            function deleteCustomer(customerId) {
                if (confirm("Are you sure you want to delete this customer?")) {
                    var form = document.createElement('form');
                    form.method = 'POST';
                    form.action = 'CustomerServlet';

                    var actionInput = document.createElement('input');
                    actionInput.type = 'hidden';
                    actionInput.name = 'action';
                    actionInput.value = 'delete';

                    var idInput = document.createElement('input');
                    idInput.type = 'hidden';
                    idInput.name = 'customerId';
                    idInput.value = customerId;

                    form.appendChild(actionInput);
                    form.appendChild(idInput);
                    document.body.appendChild(form);
                    form.submit();
                }
            }
        </script>
    </body>
</html>