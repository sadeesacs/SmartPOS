<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock</title>
        <link rel="stylesheet" href="StyleSheet4.css" />
        
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
                    <li class="nav-item active">
                        <img src="images/icons/Stock-W.png"></img>
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
            Stock Level Management
        </div>

        <!--Middle Container for content-->
        <div class="middle-container">
            <nav class="stock-nav">
                <button data-target="Stock" class="active">Stock</button>
                <button data-target="Critical Stock">Critical Stock</button>
                <button data-target="Low Stock">Low Stock</button>
                <button data-target="Out of Stock">Out of Stock</button>
            </nav>
            <div class="stock-slides">
                
                
                <!--Stock Report-->
                <div id="Stock" class="stock-slide active">
                    <button class="add-button" onclick="showSlider()">
                        <div>+</div>
                        <p>Add Stock</p>
                    </button>
                    <div class="header-container" >
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:150px">Description</span>
                        <div class="header-top" style="margin-left:590px">Quantity</div>
                        <div class="header-top" style="margin-left:700px">Manufacture Date</div>
                        <div class="header-top" style="margin-left:870px">Expiry Date</div>
                        <div class="header-top" style="margin-left:1020px">Action</div>
                    </div>
                    <div class="content-container" style="height:76%;">
                        <div class="pro-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Prima Kottu Mee</p>
                            <p class="pro-stock-quantity">10</p>
                            <p class="pro-stock-mandate">2024-01-03</p>
                            <p class="pro-stock-expirydate">2025-01-23</p>
                            <div class="stock-actions">
                                <div class="edit" onclick="showEditSlider()"><i class="bi bi-pencil-fill"></i></div>
                                <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <!--Critical Stock Report-->
                <div id="Critical Stock" class="stock-slide ">
                    <div class="header-container" style="margin-top:30px;">
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:150px">Description</span>
                        <div class="header-top" style="margin-left:590px">Quantity</div>
                        <div class="header-top" style="margin-left:720px">Manufacture Date</div>
                        <div class="header-top" style="margin-left:920px">Expiry Date</div>
                    </div>
                    <div class="content-container" style="height:85%;margin-top:70px;">
                        <div class="pro-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Prima Kottu Mee</p>
                            <p class="pro-stock-quantity">10</p>
                            <p class="pro-C-stock-mandate">2024-01-03</p>
                            <p class="pro-C-stock-expirydate">2025-01-23</p>
                        </div>
                    </div>
                </div>
                
                
                <!--Low Stock Products-->
                <div id="Low Stock" class="stock-slide ">
                    <div class="header-container" style="margin-top:30px;">
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:150px">Description</span>
                        <div class="header-top" style="margin-left:590px">Quantity</div>
                        <div class="header-top" style="margin-left:720px">Manufacture Date</div>
                        <div class="header-top" style="margin-left:920px">Expiry Date</div>
                    </div>
                    <div class="content-container" style="height:85%;margin-top:70px;">
                        <div class="pro-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Prima Kottu Mee</p>
                            <p class="pro-stock-quantity">10</p>
                            <p class="pro-C-stock-mandate">2024-01-03</p>
                            <p class="pro-C-stock-expirydate">2025-01-23</p>
                        </div>
                    </div>
                </div>
                
                
                <!--Out of Stock-->
                <div id="Out of Stock" class="stock-slide">
                    <div class="header-container" style="margin-top:30px;">
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:150px">Description</span>
                        <div class="header-top" style="margin-left:590px">Quantity</div>
                        <div class="header-top" style="margin-left:720px">Manufacture Date</div>
                        <div class="header-top" style="margin-left:920px">Expiry Date</div>
                    </div>
                    <div class="content-container" style="height:85%;margin-top:70px;">
                        <div class="pro-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Prima Kottu Mee</p>
                            <p class="pro-stock-quantity">10</p>
                            <p class="pro-C-stock-mandate">2024-01-03</p>
                            <p class="pro-C-stock-expirydate">2025-01-23</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
        
        <!--ADD Item Slider-->
         <div class="product-slider" id="addproductSlider">
            <div class="product-slider-container">
                <div class="product-slider-header">
                    <div class="product-slider-title">Add New Stock</div>
                    <img class="close-product-slider" src="images/icons/Cancelslide.png" onclick="hideSlider()" />
                    <div class="product-slider-hline">
                        <hr size="2" color="#5F4AE7" />
                    </div>
                </div>
                <div class="product-slider-form">
                    <form>
                        <div class="product-form">
                            <div class="product-form-row">
                                <label class="product-form-label">Product Name</label>
                                <input class="form-product-text" type="text" id="customer-fname" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Quantity</label>
                                <input class="form-product-text" type="text" id="customer-lname" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Manufacture Date</label>
                                <input class="form-product-text" type="date" id="manufacture-date" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Expiry Date</label>
                                <input class="form-product-text" type="date" id="expiry-date" />
                            </div>
                            <button class="form-save-but" type="submit" onclick="hideSlider()">Save</button>
                        </div>
                    </form>
                </div>  
            </div>
        </div>
        
        
        <!--EDIT Item Slider-->
         <div class="product-slider" id="editproductSlider">
            <div class="product-slider-container">
                <div class="product-slider-header">
                    <div class="product-slider-title">Edit Stock Details</div>
                    <img class="close-product-slider" src="images/icons/Cancelslide.png" onclick="hideEditSlider()" />
                    <div class="product-slider-hline">
                        <hr size="2" color="#5F4AE7" />
                    </div>
                </div>
                <div class="product-slider-form">
                    <form>
                        <div class="product-form">
                            <div class="product-form-row">
                                <label class="product-form-label">Product Name</label>
                                <input class="form-product-text" type="text" id="customer-fname" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Quantity</label>
                                <input class="form-product-text" type="text" id="customer-lname" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Manufacture Date</label>
                                <input class="form-product-text" type="date" id="manufacture-date" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Expiry Date</label>
                                <input class="form-product-text" type="date" id="expiry-date" />
                            </div>
                            <button class="form-save-but" type="submit" onclick="hideEditSlider()">Update</button>
                        </div>
                    </form>
                </div>  
            </div>
        </div>
        
        
        
        
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const navButtons = document.querySelectorAll(".stock-nav button");
                const slides = document.querySelectorAll(".stock-slide"); // Corrected selector

                // Add click event to each navigation button
                navButtons.forEach((button) => {
                    button.addEventListener("click", () => {
                        // Get the target ID
                        const targetId = button.getAttribute("data-target");

                        // Update the active navigation button
                        navButtons.forEach((btn) => btn.classList.remove("active"));
                        button.classList.add("active");

                        // Update the active slide
                        slides.forEach((slide) => {
                            slide.classList.remove("active");
                            if (slide.id === targetId) {
                                slide.classList.add("active");
                            }
                        });
                    });
                });
            });
            
            
            function showSlider() {
                document.getElementById('addproductSlider').classList.add('active');
            }

            function hideSlider() {
                document.getElementById('addproductSlider').classList.remove('active');
            }

            function showEditSlider() {
                document.getElementById('editproductSlider').classList.add('active');
            }

            function hideEditSlider() {
                document.getElementById('editproductSlider').classList.remove('active');
            }
        </script>

    </body>
</html>
