<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers</title>
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
                    <li class="nav-item ">
                        <img src="images/icons/Customers-B.png"></img>
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
                    <li class="nav-item active">
                        <img src="images/icons/Admin-W.png"></img>
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
            System User Management
        </div>
        
        
        <!--Middle Container-->
        <div class="middle-container">
            <button class="add-button" style="font-size: 15px;width:125px;margin-left:930px;" onclick="showSlider()">
                <div>+</div>
                <p>Add User</p>
            </button>

            <div class="header-container" style="top:60px;">
                <span class="header-top" style="margin-left:20px">User ID</span>
                <span class="header-top" style="margin-left:200px">Full Name</span>
                <div class="header-top" style="margin-left:480px">NIC</div>
                <div class="header-top" style="margin-left:720px">Role</div>
                <div class="header-top" style="margin-left:910px">Action</div>                
            </div>
                
            <div class="content-container" style="margin-top:150px;height: 70%">
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="user">
                    <p class="user-id">13236</p>
                    <p class="user-s-name">Leo Perera</p>
                    <p class="user-NIC">2546567895v</p>
                    <p class="user-s-role">Manager</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
            
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
                    <form>
                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label class="cus-form-label">Full Name</label>
                                <input class="form-c-text" type="text" id="user-fname" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">NIC</label>
                                <input class="form-c-text" type="text" id="user-NIC" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Role</label>
                                <div class="user-role-select">
                                    <select>
                                        <option>Manager</option>
                                        <option>Cashier</option>
                                        <option>Administrator</option>
                                    </select>
                                </div>
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">User Name</label>
                                <input class="form-c-text" type="text" id="user-username" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Enter Password</label>
                                <input class="form-c-text" type="text" id="password" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Re-Enter Password</label>
                                <input class="form-c-text" type="text" id="password" />
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
                    <form>
                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label class="cus-form-label">Full Name</label>
                                <input class="form-c-text" type="text" id="user-fname" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">NIC</label>
                                <input class="form-c-text" type="text" id="user-NIC" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Role</label>
                                <div class="user-role-select">
                                    <select>
                                        <option>Manager</option>
                                        <option>Cashier</option>
                                        <option>Administrator</option>
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
                    <div class="Customer-slider-title">Edit User Details</div>
                    <img class="close-customer-slider" src="images/icons/Cancelslide.png" onclick="closeModal()" />
                    <div class="customer-slider-hline">
                        <hr size="2" color="#5F4AE7" />
                    </div>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label class="cus-form-label">Enter Username</label>
                                <input class="form-c-text" type="text" id="username" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Enter Your Last Password</label>
                                <input class="form-c-text" type="password" id="old-password" />
                            </div>
                            <div class="cus-form-row">
                                <label class="cus-form-label">Enter New Password</label>
                                <input class="form-c-text" type="password" id="new-password" />
                            </div>
                        </div>
                        <button class="modal-but" type="submit" style="margin-bottom: 20px">Change Password</button>
                    </form>
                </div>
            </div>
        </div>


        
        <script>
            function showSlider() {
                document.getElementById('adduserSlider').classList.add('active');
            }

            function hideSlider() {
                document.getElementById('adduserSlider').classList.remove('active');
            }

            function showEditSlider() {
                document.getElementById('edituserSlider').classList.add('active');
            }

            function hideEditSlider() {
                document.getElementById('edituserSlider').classList.remove('active');
            }
            
            function openModal() {
                document.getElementById("updatePasswordModal").style.display = "flex";
            }

            function closeModal() {
                document.getElementById("updatePasswordModal").style.display = "none";
            }
        </script>
        
        
    </body>
</html>

