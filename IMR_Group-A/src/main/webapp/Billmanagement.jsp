<%-- 
    Document   : Billmanagement
    Created on : Dec 25, 2024, 11:00:46 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bills</title>
        <link rel="stylesheet" href="StyleSheet1.css" />
        <link rel="stylesheet" href="StyleSheetbill.css" />

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
                    <li class="nav-item active ">
                        <img src="images/icons/Bills-W.png"></img>
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
            Bill Management
        </div>
    <!--Middle Container for content-->
        <div class="middle-container">
            <!-- Search Bar Container -->
        <div class="add-search-container">
          <h2 required style="margin-left: 40px;">Search Bill Details</h2>
            <div class="form-group">
                <label for="Recieptnumber" required style="margin-left: 40px;">Enter Receipt Number</label>
                <input type="text" id="Recieptnumber" name="Recieptnumber" required style="margin-left: 30px;" >
                <button class="search-button">Search</button>
            </div>
        </div>
    

    <div class="header-container" style="top:100px;">
                <span class="header-top" style="margin-left:20px">Receipt Number</span>
                <span class="header-top" style="margin-left:240px">No of Items</span>
                <div class="header-top" style="margin-left:420px">Date</div>
                <div class="header-top" style="margin-left:570px">Time</div>
                <div class="header-top" style="margin-left:700px">Total amount</div>
                <div class="header-top" style="margin-left:900px">Action</div>                  
            </div>
                <div class="content-container" style="margin-top:80px;height: 70%">
                <div class="Receipt">
                    <p class="Rec-no">#12500</p>
                    <p class="Rec-iteam">20</p>
                    <p class="Rec-date">2024-12-20</p>
                    <p class="Rec-time">16.00PM</p>
                    <p class="Rec-totalamount">12,500</p>
                    
                    <div class="Rec-action">
                        <div class="view"><i class="bi bi-eye-fill"></i></div>
                    </div> 
                </div>
                   
                <div class="Receipt">
                    <p class="Rec-no">#12500</p>
                    <p class="Rec-iteam">20</p>
                    <p class="Rec-date">2024-12-20</p>
                    <p class="Rec-time">16.00PM</p>
                    <p class="Rec-totalamount">12,500</p>
                    
                    <div class="Rec-action">
                        <div class="view"><i class="bi bi-eye-fill"></i></div>
                    </div> 
                </div>
        </div>
        </div>
        
    </body>
</html>
