<%@ page import="java.util.List" %>
<%@ page import="Model.Stock" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Stock</title>
        <link rel="stylesheet" href="StyleSheet4.css" />
    </head>
    <body>
        
        <!-- Navigational Panel -->
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png" /></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>

            <ul class="nav-menu">
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Dashboard-B.png"/>
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/POS-B.png"/>
                        <span>POS</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Products-B.png"/>
                        <span>Products</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item active">
                        <img src="images/icons/Stock-W.png"/>
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

            <!-- Logout button form -->
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
            Stock Level Management
        </div>

        <!-- Retrieve the 4 lists from request -->
        <%
            List<Stock> normalStock    = (List<Stock>) request.getAttribute("normalStock");
            List<Stock> criticalStock  = (List<Stock>) request.getAttribute("criticalStock");
            List<Stock> lowStock       = (List<Stock>) request.getAttribute("lowStock");
            List<Stock> outOfStock     = (List<Stock>) request.getAttribute("outOfStock");
        %>

        <!-- Middle Container -->
        <div class="middle-container">
            <nav class="stock-nav">
                <button data-target="Stock" class="active">Stock</button>
                <button data-target="Critical Stock">Critical Stock</button>
                <button data-target="Low Stock">Low Stock</button>
                <button data-target="Out of Stock">Out of Stock</button>
            </nav>
            <div class="stock-slides">
                <!-- Stock -->
                <div id="Stock" class="stock-slide active">
                    <button class="add-button" onclick="showSlider()">
                        <div>+</div>
                        <p>Add Stock</p>
                    </button>
                    <div class="header-container">
                        <span class="header-top" style="margin-left:20px">Stock ID</span>
                        <span class="header-top" style="margin-left:150px">Product Name</span>
                        <div class="header-top" style="margin-left:590px">Quantity</div>
                        <div class="header-top" style="margin-left:700px">Manufacture Date</div>
                        <div class="header-top" style="margin-left:870px">Expiry Date</div>
                        <div class="header-top" style="margin-left:1020px">Action</div>
                    </div>
                    <div class="content-container" style="height:76%;">
                        <%
                            for (Stock s : normalStock) {
                        %>
                        <div class="pro-stock">
                            <p class="pro-stock-id">#<%= s.getStockID() %></p>
                            <p class="pro-stock-name"><%= s.getProductName() %></p>
                            <p class="pro-stock-quantity"><%= s.getQuantity() %></p>
                            <p class="pro-stock-mandate"><%= s.getManufactureDate() %></p>
                            <p class="pro-stock-expirydate"><%= s.getExpiryDate() %></p>
                            <div class="stock-actions">
                                <div class="edit" onclick="showEditSlider('<%= s.getStockID() %>', '<%= s.getProductName() %>', '<%= s.getQuantity() %>', '<%= s.getManufactureDate() %>', '<%= s.getExpiryDate() %>')">
                                    <i class="bi bi-pencil-fill"></i>
                                </div>
                                <form method="post" action="StockServlet">
                                    <input type="hidden" name="action" value="delete"/>
                                    <input type="hidden" name="stockID" value="<%= s.getStockID() %>"/>
                                    <button class="delete" type="submit" onclick="return confirm('Delete this stock?');">
                                        <i class="bi bi-trash3-fill"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                
                <!-- Critical Stock -->
                <div id="Critical Stock" class="stock-slide">
                    <div class="header-container" style="margin-top:30px;">
                        <span class="header-top" style="margin-left:20px">Stock ID</span>
                        <span class="header-top" style="margin-left:150px">Product Name</span>
                        <div class="header-top" style="margin-left:590px">Quantity</div>
                        <div class="header-top" style="margin-left:700px">Manufacture Date</div>
                        <div class="header-top" style="margin-left:870px">Expiry Date</div>
                        <div class="header-top" style="margin-left:1020px">Action</div>

                    </div>
                    <div class="content-container" style="height:85%;margin-top:70px;">
                        <%
                            for (Stock s : criticalStock) {
                        %>
                        <div class="pro-stock">
                            <p class="pro-stock-id">#<%= s.getStockID() %></p>
                            <p class="pro-stock-name"><%= s.getProductName() %></p>
                            <p class="pro-stock-quantity"><%= s.getQuantity() %></p>
                            <p class="pro-C-stock-mandate"><%= s.getManufactureDate() %></p>
                            <p class="pro-C-stock-expirydate"><%= s.getExpiryDate() %></p>
                            <div class="stock-actions">
                                <form method="post" action="StockServlet">
                                    <input type="hidden" name="action" value="delete"/>
                                    <input type="hidden" name="stockID" value="<%= s.getStockID() %>"/>
                                    <button class="delete-other" type="submit" onclick="return confirm('Delete this stock?');">
                                        <i class="bi bi-trash3-fill"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                
                <!-- Low Stock -->
                <div id="Low Stock" class="stock-slide">
                    <div class="header-container" style="margin-top:30px;">
                        <span class="header-top" style="margin-left:20px">Stock ID</span>
                        <span class="header-top" style="margin-left:150px">Product Name</span>
                        <div class="header-top" style="margin-left:590px">Quantity</div>
                        <div class="header-top" style="margin-left:700px">Manufacture Date</div>
                        <div class="header-top" style="margin-left:870px">Expiry Date</div>
                        <div class="header-top" style="margin-left:1020px">Action</div>
                    </div>
                    <div class="content-container" style="height:85%;margin-top:70px;">
                        <%
                            for (Stock s : lowStock) {
                        %>
                        <div class="pro-stock">
                            <p class="pro-stock-id">#<%= s.getStockID() %></p>
                            <p class="pro-stock-name"><%= s.getProductName() %></p>
                            <p class="pro-stock-quantity"><%= s.getQuantity() %></p>
                            <p class="pro-C-stock-mandate"><%= s.getManufactureDate() %></p>
                            <p class="pro-C-stock-expirydate"><%= s.getExpiryDate() %></p>
                            <div class="stock-actions">
                                <form method="post" action="StockServlet">
                                    <input type="hidden" name="action" value="delete"/>
                                    <input type="hidden" name="stockID" value="<%= s.getStockID() %>"/>
                                    <button class="delete-other" type="submit" onclick="return confirm('Delete this stock?');">
                                        <i class="bi bi-trash3-fill"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                
                <!-- Out of Stock -->
                <div id="Out of Stock" class="stock-slide">
                    <div class="header-container" style="margin-top:30px;">
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:150px">Product Name</span>
                        <div class="header-top" style="margin-left:590px">Quantity</div>
                        <div class="header-top" style="margin-left:700px">Manufacture Date</div>
                        <div class="header-top" style="margin-left:870px">Expiry Date</div>
                    </div>
                    <div class="content-container" style="height:85%;margin-top:70px;">
                        <%
                            for (Stock s : outOfStock) {
                        %>
                        <div class="pro-stock">
                            <p class="pro-stock-id">#<%= s.getProductID() %></p> 
                            <p class="pro-stock-name"><%= s.getProductName() %></p>
                            <p class="pro-stock-quantity"><%= s.getQuantity() %></p>
                            <p class="pro-C-stock-mandate"> -- </p>
                            <p class="pro-C-stock-expirydate"> -- </p>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- ADD Item Slider -->
        <div class="product-slider" id="addproductSlider">
            <div class="product-slider-container">
                <div class="product-slider-header">
                    <div class="product-slider-title">Add New Stock</div>
                    <img class="close-product-slider" src="images/icons/Cancelslide.png" onclick="hideSlider()"/>
                    <div class="product-slider-hline">
                        <hr size="2" color="#5F4AE7"/>
                    </div>
                </div>
                <div class="product-slider-form">
                    <form method="post" action="StockServlet">
                        <input type="hidden" name="action" value="add"/>
                        <div class="product-form">
                            <div class="product-form-row">
                                <label class="product-form-label">Product ID</label>
                                <input class="form-product-text" type="text" name="productID" required/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Quantity</label>
                                <input class="form-product-text" type="text" name="quantity" required/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Manufacture Date</label>
                                <input class="form-product-text" type="date" name="manufactureDate"/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Expiry Date</label>
                                <input class="form-product-text" type="date" name="expiryDate"/>
                            </div>
                            <button class="form-save-but" type="submit" onclick="hideSlider()">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- EDIT Item Slider -->
        <div class="product-slider" id="editproductSlider">
            <div class="product-slider-container">
                <div class="product-slider-header">
                    <div class="product-slider-title">Edit Stock Details</div>
                    <img class="close-product-slider" src="images/icons/Cancelslide.png" onclick="hideEditSlider()"/>
                    <div class="product-slider-hline">
                        <hr size="2" color="#5F4AE7"/>
                    </div>
                </div>
                <div class="product-slider-form">
                    <form method="post" action="StockServlet">
                        <input type="hidden" name="action" value="update"/>
                        <input type="hidden" name="stockID" id="edit-stockID"/>

                        <div class="product-form">
                            <!-- We'll show Product Name read-only or editable if you want -->
                            <div class="product-form-row">
                                <label class="product-form-label">Product Name</label>
                                <input class="form-product-text" type="text" id="edit-productName" readonly/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Quantity</label>
                                <input class="form-product-text" type="text" name="quantity" id="edit-quantity"/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Manufacture Date</label>
                                <input class="form-product-text" type="date" name="manufactureDate" id="edit-manufactureDate"/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Expiry Date</label>
                                <input class="form-product-text" type="date" name="expiryDate" id="edit-expiryDate"/>
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
                const slides = document.querySelectorAll(".stock-slide");

                navButtons.forEach((button) => {
                    button.addEventListener("click", () => {
                        const targetId = button.getAttribute("data-target");
                        navButtons.forEach((btn) => btn.classList.remove("active"));
                        button.classList.add("active");
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

            function showEditSlider(stockID, productName, quantity, mDate, eDate) {
                document.getElementById('edit-stockID').value = stockID;
                document.getElementById('edit-productName').value = productName;
                document.getElementById('edit-quantity').value = quantity;

                if (mDate && mDate !== 'null') {
                    document.getElementById('edit-manufactureDate').value = mDate;
                } else {
                    document.getElementById('edit-manufactureDate').value = "";
                }
                if (eDate && eDate !== 'null') {
                    document.getElementById('edit-expiryDate').value = eDate;
                } else {
                    document.getElementById('edit-expiryDate').value = "";
                }

                document.getElementById('editproductSlider').classList.add('active');
            }
            function hideEditSlider() {
                document.getElementById('editproductSlider').classList.remove('active');
            }
        </script>
    </body>
</html>