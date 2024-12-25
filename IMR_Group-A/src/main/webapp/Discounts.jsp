<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <li class="nav-item active">
                        <img src="images/icons/Discount-W.png"></img>
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
            Discount Management
        </div>
        
        
        <!--Middle Container-->
        <div class="middle-container">
            <div class="add-discount-container">
                <h2>Add Discount</h2>
                <form action="/addDiscount" method="POST" class="discount-form">
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

            <div class="header-container" style="top:60px;">
                <span class="header-top" style="margin-left:20px">Product ID</span>
                <span class="header-top" style="margin-left:140px">Description</span>
                <div class="header-top" style="margin-left:520px">Unit Price</div>
                <div class="header-top" style="margin-left:660px">Discount %</div>
                <div class="header-top" style="margin-left:800px">Started Date</div>
                <div class="header-top" style="margin-left:945px">Action</div>                
            </div>
                
            <div class="content-container" style="margin-top:150px;">
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
                <div class="discount">
                    <p class="dis-product-id">#12500</p>
                    <p class="dis-product-name">Prima Kottu Mee</p>
                    <p class="dis-unit-price">460.00</p>
                    <p class="dis-discount">15</p>
                    <p class="dis-date">2024-12-20</p>
                    <div class="dis-actions">
                        <div class="delete"><i class="bi bi-trash3-fill"></i></div>
                    </div> 
                </div>
            </div>
        </div>
        
    </body>
</html>
