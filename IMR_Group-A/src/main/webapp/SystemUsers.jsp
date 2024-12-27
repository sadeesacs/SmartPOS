<%@ page import="java.util.List" %>
<%@ page import="Model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>System Users</title>
        <link rel="stylesheet" href="StyleSheet3.css" />
    </head>
    <body>
        
        <!-- Navigational Panel of the Smart POS System -->
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png" /></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>
        
            <ul class="nav-menu">
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Dashboard-B.png" />
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/POS-B.png" />
                        <span>POS</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Products-B.png" />
                        <span>Products</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Stock-B.png" />
                        <span>Stock</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Discount-B.png" />
                        <span>Discounts</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Bills-B.png" />
                        <span>Bills</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Customers-B.png" />
                        <span>Customers</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Reports-B.png" />
                        <span>Reports</span>
                    </li>
                </a>
                <a href="SystemUsersServlet">
                    <li class="nav-item active">
                        <img src="images/icons/Admin-W.png" />
                        <span>Users</span>
                    </li>
                </a>
            </ul>
            
            <form method="post" action="SystemUsersServlet">
                <input type="hidden" name="action" value="logout" />
                <button class="logout">
                    <img src="images/icons/Logout.png"/>
                    <span>Logout</span>
                </button>
            </form>
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
              <%
                  User loggedUser = (User) request.getAttribute("loggedUser");
                  if (loggedUser != null) {
              %>
                  <span class="user-name"><%= loggedUser.getFullName() %></span>
                  <span class="user-role"><%= loggedUser.getRole() %></span>
              <%
                  }
              %>
            </div>
        </div>
        
        <!--Main Header-->
        <div class="main-header">
            System User Management
        </div>
        
        <!--Middle Container-->
        <div class="middle-container">
            <%
                String currentRole = (String) request.getAttribute("currentRole");
                if ("Manager".equalsIgnoreCase(currentRole) || "Admin".equalsIgnoreCase(currentRole)) {
            %>
                <button class="add-button" style="font-size: 15px;width:125px;margin-left:930px;" onclick="showSlider()">
                    <div>+</div>
                    <p>Add User</p>
                </button>
            <%
                }
            %>

            <div class="header-container" style="top:60px;">
                <span class="header-top" style="margin-left:20px">User ID</span>
                <span class="header-top" style="margin-left:200px">Full Name</span>
                <div class="header-top" style="margin-left:480px">NIC</div>
                <div class="header-top" style="margin-left:720px">Role</div>
                <div class="header-top" style="margin-left:910px">Action</div>                
            </div>
                
            <div class="content-container" style="margin-top:150px;height: 70%">
                <%
                    List<User> userList = (List<User>) request.getAttribute("userList");
                    if (userList != null) {
                        for (User u : userList) {
                %>
                    <div class="user">
                        <p class="user-id"><%= u.getUserID() %></p>
                        <p class="user-s-name"><%= u.getFullName() %></p>
                        <p class="user-NIC"><%= u.getNic() %></p>
                        <p class="user-s-role"><%= u.getRole() %></p>
                        <div class="cus-actions">
                            <!-- EDIT button -->
                            <div class="edit" 
                                 onclick="showEditSlider(<%= u.getUserID() %>, 
                                                         '<%= u.getFullName() %>', 
                                                         '<%= u.getNic() %>', 
                                                         '<%= u.getRole() %>')">
                                <i class="bi bi-pencil-fill"></i>
                            </div>
                            <!-- DELETE button -->
                            <div class="delete" onclick="confirmDelete(<%= u.getUserID() %>)">
                                <i class="bi bi-trash3-fill"></i>
                            </div>
                        </div> 
                    </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        
        
        <!--Add Item Slider-->
        <div class="Customer-slider" id="adduserSlider">
            <div class="customer-slider-container">
                <div class="customer-slider-header">
                    <div class="Customer-slider-title">Add New System User</div>
                    <img class="close-customer-slider" src="images/icons/Cancelslide.png" onclick="hideSlider()" />
                    <div class="customer-slider-hline">
                        <hr size="2" color="#5F4AE7" />
                    </div>
                </div>

                <div class="customer-slider-form" style="margin-top:10px;">
                    <form action="SystemUsersServlet" method="post">
                        <input type="hidden" name="action" value="add" />

                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label class="cus-form-label">Full Name</label>
                                <input class="form-c-text" type="text" name="fullName" required />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">NIC</label>
                                <input class="form-c-text" type="text" name="nic" required />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Role</label>
                                <div class="user-role-select">
                                    <select name="role">
                                        <%
                                            if ("Manager".equalsIgnoreCase(currentRole)) {
                                        %>
                                            <option value="Cashier">Cashier</option>
                                            <option value="Manager">Manager</option>
                                        <%
                                            } else if ("Admin".equalsIgnoreCase(currentRole)) {
                                        %>
                                            <option value="Cashier">Cashier</option>
                                            <option value="Manager">Manager</option>
                                            <option value="Admin">Admin</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Enter Password</label>
                                <input class="form-c-text" type="password" name="password" required />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Re-Enter Password</label>
                                <input class="form-c-text" type="password" name="repassword" required />
                            </div>
                            <button class="form-save-but" style="margin-top:0px;" type="submit" onclick="hideSlider()">Save</button>
                        </div>
                    </form>
                </div>  
            </div>
        </div>

        <!--Edit Item Slider-->
        <div class="Customer-slider" id="edituserSlider">
            <div class="customer-slider-container">
                <div class="customer-slider-header">
                    <div class="Customer-slider-title">Edit User Details</div>
                    <img class="close-customer-slider" src="images/icons/Cancelslide.png" onclick="hideEditSlider()" />
                    <div class="customer-slider-hline">
                        <hr size="2" color="#5F4AE7" />
                    </div>
                </div>

                <div class="customer-slider-form">
                    <form action="SystemUsersServlet" method="post">
                        <input type="hidden" name="action" value="update" />
                        <input type="hidden" id="edit-userID" name="userID" />

                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label class="cus-form-label">Full Name</label>
                                <input class="form-c-text" type="text" id="edit-fullName" name="fullName" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">NIC</label>
                                <input class="form-c-text" type="text" id="edit-nic" name="nic" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Role</label>
                                <div class="user-role-select">
                                    <select id="edit-role" name="role">
                                    </select>
                                </div>
                            </div>
                            <div class="button-wrapper">
                                <button class="change-password-but" type="button" onclick="openModal()">Change Password</button>
                                <button class="form-update-but" type="submit" onclick="hideEditSlider()">Update</button>
                            </div>
                        </div>
                    </form>
                </div>  
            </div>
        </div>
        
        <!-- Update Password Modal -->
        <div class="modal" id="updatePasswordModal">
            <div class="modal-content">
                <div class="customer-slider-header">
                    <div class="Customer-slider-title">Change Password</div>
                    <img class="close-customer-slider" src="images/icons/Cancelslide.png" onclick="closeModal()" />
                    <div class="customer-slider-hline">
                        <hr size="2" color="#5F4AE7" />
                    </div>
                </div>
                <div class="modal-body">
                    <%
                        String pwdError = (String) request.getAttribute("pwdError");
                        if (pwdError != null) {
                    %>
                        <div style="color:red; margin-bottom:10px;"><%= pwdError %></div>
                    <%
                        }
                    %>
                    <form action="SystemUsersServlet" method="post">
                        <input type="hidden" name="action" value="changePassword" />
                        <input type="hidden" name="userID" id="changePwd-userID" />

                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label class="cus-form-label">Enter Your Old Password</label>
                                <input class="form-c-text" type="password" name="oldPassword" required />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Enter New Password</label>
                                <input class="form-c-text" type="password" name="newPassword" required />
                            </div>
                        </div>
                        <button class="modal-but" type="submit" style="margin-bottom: 20px">Change Password</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Hidden form for delete action (with JS confirm) -->
        <form id="deleteForm" method="post" action="SystemUsersServlet" style="display:none;">
            <input type="hidden" name="action" value="delete" />
            <input type="hidden" name="userID" id="delete-userID" />
        </form>

        <script>
            function showSlider() {
                document.getElementById('adduserSlider').classList.add('active');
            }
            function hideSlider() {
                document.getElementById('adduserSlider').classList.remove('active');
            }

            function showEditSlider(userID, fullName, nic, role) {
                document.getElementById('edit-userID').value = userID;
                document.getElementById('edit-fullName').value = fullName;
                document.getElementById('edit-nic').value = nic;

                let currentRole = '<%= currentRole %>';
                let currentUserID = '<%= request.getAttribute("currentUserID") %>';
                let editRoleSelect = document.getElementById('edit-role');
                editRoleSelect.innerHTML = "";

                let isSelf = (currentUserID == userID);
                
                if (currentRole.toLowerCase() === 'admin') {
                    editRoleSelect.add(new Option("Cashier", "Cashier"));
                    editRoleSelect.add(new Option("Manager", "Manager"));
                    editRoleSelect.add(new Option("Admin", "Admin"));
                    editRoleSelect.disabled = false;
                }
                else if (currentRole.toLowerCase() === 'manager') {
                    if (isSelf) {
                        let opt = new Option(role, role);
                        editRoleSelect.add(opt);
                        editRoleSelect.disabled = true;
                    } else {
                        editRoleSelect.add(new Option("Cashier", "Cashier"));
                        editRoleSelect.add(new Option("Manager", "Manager"));
                        editRoleSelect.disabled = false;
                    }
                }
                else if (currentRole.toLowerCase() === 'cashier') {
                    let opt = new Option(role, role);
                    editRoleSelect.add(opt);
                    editRoleSelect.disabled = true;
                }
                
                editRoleSelect.value = role; 

                let editFullName = document.getElementById('edit-fullName');
                let editNic = document.getElementById('edit-nic');

                if (currentRole.toLowerCase() === 'admin') {
                    editFullName.disabled = false;
                    editNic.disabled = false;
                }
                else if (currentRole.toLowerCase() === 'manager') {
                    if (isSelf) {
                        editFullName.disabled = true;
                        editNic.disabled = true;
                    } else {
                        editFullName.disabled = false;
                        editNic.disabled = false;
                    }
                }
                else if (currentRole.toLowerCase() === 'cashier') {
                    if (isSelf) {
                        editFullName.disabled = true;
                        editNic.disabled = true;
                    }
                }

                document.getElementById('edituserSlider').classList.add('active');
            }

            function hideEditSlider() {
                document.getElementById('edituserSlider').classList.remove('active');
            }
            
            // Password Modal
            function openModal() {
                let currentUserID = '<%= request.getAttribute("currentUserID") %>';
                document.getElementById('changePwd-userID').value = currentUserID;
                document.getElementById("updatePasswordModal").style.display = "flex";
            }
            function closeModal() {
                document.getElementById("updatePasswordModal").style.display = "none";
            }

            function confirmDelete(userID) {
                if (confirm("Are you sure you want to delete this user?")) {
                    document.getElementById('delete-userID').value = userID;
                    document.getElementById('deleteForm').submit();
                }
            }
            <%
                String showPwdModal = (String) request.getAttribute("showPwdModal");
                if ("true".equalsIgnoreCase(showPwdModal)) {
            %>
                document.addEventListener("DOMContentLoaded", function() {
                    document.getElementById("updatePasswordModal").style.display = "flex";
                });
            <%
                }
            %>
        </script>
    </body>
</html>
