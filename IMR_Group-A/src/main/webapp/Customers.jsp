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
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="customer">
                    <p class="cus-fname">Laura</p>
                    <p class="cus-lname">Ayala</p>
                    <p class="cus-email">laura.ayala@gmail.com</p>
                    <p class="cus-phone">07605439833</p>
                    <div class="cus-actions">
                        <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
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
                    <form>
                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label for="customer-fname" class="cus-form-label">First Name</label>
                                <input class="form-c-text" type="text" id="customer-fname" />
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-lname" class="cus-form-label">Last Name</label>
                                <input class="form-c-text" type="text" id="customer-lname" />
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-phone" class="cus-form-label">Phone Number</label>
                                <input class="form-c-text" type="text" id="phone-no" />
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-email" class="cus-form-label">Email Address</label>
                                <input class="form-c-text" type="text" id="email" />
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
                    <img class="close-customer-slider" src="images/icons/Cancelslide.png" onclick="hideEditSlider()" />
                    <div class="customer-slider-hline">
                        <hr size="2" color="#5F4AE7" />
                    </div>
                </div>

                <div class="customer-slider-form">
                    <form>
                        <div class="cus-form">
                            <div class="cus-form-row">
                                <label for="customer-fname" class="cus-form-label">First Name</label>
                                <input class="form-c-text" type="text" id="customer-fname" />
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-lname" class="cus-form-label">Last Name</label>
                                <input class="form-c-text" type="text" id="customer-lname" />
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-phone" class="cus-form-label">Phone Number</label>
                                <input class="form-c-text" type="text" id="phone-no" />
                            </div>
                            <div class="cus-form-row">
                                <label for="customer-email" class="cus-form-label">Email Address</label>
                                <input class="form-c-text" type="text" id="email" />
                            </div>
                            <button class="form-save-but" type="submit" onclick="hideEditSlider()">Update</button>
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

            function showEditSlider() {
                document.getElementById('editCusSlider').classList.add('active');
            }

            function hideEditSlider() {
                document.getElementById('editCusSlider').classList.remove('active');
            }
        </script>
        
        
    </body>
</html>
