<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bills</title>
        <link rel="stylesheet" href="StyleSheet8.css" />

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
                    <input type="text" id="Recieptnumber" name="Recieptnumber" required style="margin-left: 50px;" >
                    <button class="search-button">Search</button>
                </div>
            </div>
            <div class="header-container" style="top:100px;">
                <span class="header-top" style="margin-left:20px">Receipt Number</span>
                <span class="header-top" style="margin-left:240px">No of Items</span>
                <div class="header-top" style="margin-left:410px">Date</div>
                <div class="header-top" style="margin-left:570px">Time</div>
                <div class="header-top" style="margin-left:720px">Total amount</div>
                <div class="header-top" style="margin-left:920px">Action</div>                  
            </div>
            <div class="content-container" style="margin-top:80px;">
                <div class="Receipt">
                    <p class="Rec-no">#12500</p>
                    <p class="Rec-iteam">20</p>
                    <p class="Rec-date">2024-12-20</p>
                    <p class="Rec-time">16.00PM</p>
                    <p class="Rec-totalamount">12,500</p>
                    <div class="Rec-action">
                        <div class="view" onclick="openReceiptModal()"><i class="bi bi-eye-fill"></i></div>
                    </div> 
                </div>
            </div>
        </div>
        
        
        
        
        <!-- Modal for Bill Receipt -->
        <div id="receiptModal" class="modal">
            <div class="modal-content">
                <img class="close-product-slider" src="images/icons/Cancelslide.png" onclick="closeReceiptModal()" />

                <!-- Scrollable Modal Body -->
                <div class="modal-body">
                    <div class="receipt-header">
                        <div class="rec-Logo" style="left:115px;"><img src="images/icons/logo.png" /></div>
                        <div class="rec-logoname" style="left:180px;">Smart <span style="color:#5F4AE7">POS</span></div>
                    </div>

                    <!-- Bill Details -->
                    <div class="bill-details">
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Bill No:&nbsp;&nbsp;</b></span>
                            <span class="detail-value" id="billNo">2510646</span>
                        </div>
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Bill Date:&nbsp;&nbsp;</b></span>
                            <span class="detail-value" id="billDate">2024-05-26</span>
                        </div>
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Billed Time:&nbsp;&nbsp;</b></span>
                            <span class="detail-value" id="billedTime">10:30:17</span>
                        </div>
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Cashier ID:&nbsp;</b></span>
                            <span class="detail-value" id="cashierId">22646566</span>
                        </div>
                    </div>

                    
                    <div class="billDetails-header-container">
                        <span class="bill-header-top header-id">#</span>
                        <span class="bill-header-top header-description">Description</span>
                        <span class="bill-header-top header-qty">Qty</span>
                        <span class="bill-header-top header-unit-price">Unit Price</span>
                        <span class="bill-header-top header-subtotal">Sub Total</span>
                    </div>

                        <div class="item">
                            <p class="item-id">1</p>
                            <p class="item-desc">Tetos-Savoury Cheese 60g</p>
                            <p class="item-qty">10</p>
                            <p class="item-price">290.00</p>
                            <p class="item-total">290.00</p>
                        </div>
                        <div class="item">
                            <p class="item-id">1</p>
                            <p class="item-desc">Tetos-Savoury Cheese 60g</p>
                            <p class="item-qty">10</p>
                            <p class="item-price">290.00</p>
                            <p class="item-total">290.00</p>
                        </div>
                        <div class="item">
                            <p class="item-id">1</p>
                            <p class="item-desc">Tetos-Savoury Cheese 60g</p>
                            <p class="item-qty">10</p>
                            <p class="item-price">290.00</p>
                            <p class="item-total">290.00</p>
                        </div>
                        <div class="item">
                            <p class="item-id">1</p>
                            <p class="item-desc">Tetos-Savoury Cheese 60g</p>
                            <p class="item-qty">10</p>
                            <p class="item-price">290.00</p>
                            <p class="item-total">290.00</p>
                        </div>
                    
                    <!-- Bill Summary -->
                    <div class="bill-summary">
                        <p>
                            <b>Total:</b>
                            <span class="bill-summary-value" id="total-value">12,650.00</span>
                        </p>
                        <p>
                            <b>Discount:</b>
                            <span class="bill-summary-value" id="discount-value">1,100.00</span>
                        </p>
                        <p>
                            <b>Net Amount:</b>
                            <span class="bill-summary-value" id="net-amount-value" style="font-size: 18px; font-weight: bold;">11,550.00</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        
        
        
        
        <script>
            const modal = document.getElementById("receiptModal");

            // Function to open the modal
            function openReceiptModal() {
                modal.style.display = "block";
            }

            // Function to close the modal
            function closeReceiptModal() {
                modal.style.display = "none";
            }

            // Close the modal when clicking outside the content
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };
        </script>
        
    </body>
</html>
