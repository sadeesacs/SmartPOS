<%@ page import="java.util.List" %>
<%@ page import="Model.Product" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Product Catalog</title>
        <link rel="stylesheet" href="StyleSheet5.css" />
    </head>
    <body>

        <!-- Navigation Panel -->
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png"/></div>
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
                    <li class="nav-item active">
                        <img src="images/icons/Products-W.png"/>
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
                    <li class="nav-item ">
                        <img src="images/icons/Admin-B.png"></img>
                        <span>Users</span>
                    </li>
                </a>
            </ul>

            <!-- Logout form -->
            <form action="ProductCatalogServlet" method="post" style="display:inline;">
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
            Product Catalog
        </div>

        <!-- Middle Container -->
        <div class="middle-container">
            <nav class="product-nav">
                <button data-target="Vegetables" class="active">Vegetables</button>
                <button data-target="Fruits">Fruits</button>
                <button data-target="Meat">Meat</button>
                <button data-target="HouseHold">HouseHold</button>
                <button data-target="Grocery">Grocery</button>
                <button data-target="Bakery">Bakery</button>
                <button data-target="Beverages">Beverages</button>
            </nav>

            <div class="product-slides">
                <%
                    List<Product> productList = (List<Product>) request.getAttribute("productList");
                    if (productList == null) {
                        productList = java.util.Collections.emptyList();
                    }
                    // define categories
                    String[] categories = {"Vegetables","Fruits","Meat","HouseHold","Grocery","Bakery","Beverages"};
                    boolean first = true;
                    for (String cat : categories) {
                %>
                <div id="<%= cat %>" class="product-slide <%= first ? "active" : "" %>">
                    <div class="product-cards-container">
                        <%
                            for (Product p : productList) {
                                if (cat.equalsIgnoreCase(p.getProductCategory())) {
                                    // figure out the correct price
                                    double priceVal = p.isWeighted() ? p.getPricePer100g() : p.getPricePerUnit();
                        %>
                        <div class="product-card">
                            <img src="<%= p.getProductImageURL() %>" alt="<%= p.getProductName() %>" class="product-image">
                            <div class="product-header">
                                <span class="product-id">#<%= p.getProductID() %></span>
                                <div class="product-actions">
                                    <%
                                        if (!"Cashier".equalsIgnoreCase(currentRole)) {
                                    %>
                                    <button class="edit-button"
                                            onclick="showEditSlider(
                                                '<%= p.getProductID() %>',
                                                '<%= p.getProductName() %>',
                                                '<%= p.isWeighted() ? "100g" : "1" %>',
                                                '<%= priceVal %>',
                                                '<%= p.getProductCategory() %>',
                                                '<%= p.getProductImageURL() %>')"
                                            title="Edit">
                                        <i class="bi bi-pencil-fill"></i>
                                    </button>

                                    <!-- Delete form -->
                                    <form method="post" action="ProductCatalogServlet" style="display:inline;">
                                        <input type="hidden" name="action" value="delete"/>
                                        <input type="hidden" name="productID" value="<%= p.getProductID() %>"/>
                                        <button class="delete-button" type="submit" onclick="return confirm('Delete this product?');">
                                            <i class="bi bi-trash3-fill"></i>
                                        </button>
                                    </form>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <h4 class="product-name"><%= p.getProductName() %></h4>
                            <div class="product-price-container">
                                <p class="product-price">LKR <%= String.format("%.2f", priceVal) %></p>
                                <%
                                    if (p.isWeighted()) {
                                %>
                                <p class="product-weight">100g</p>
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
                <%
                        first = false;
                    }
                %>
            </div> <!-- product-slides -->
        </div> <!-- middle-container -->

        <!-- If Manager/Admin, show Add button -->
        <%
            if (!"Cashier".equalsIgnoreCase(currentRole)) {
        %>
        <button class="add-button" style="font-size:15px" onclick="showSlider()">
            <div>+</div>
            <p>Add Product</p>
        </button>
        <%
            }
        %>

        <!-- EDIT Product Slider -->
        <div class="product-slider" id="editproductSlider">
            <div class="product-slider-container">
                <div class="product-slider-header">
                    <div class="product-slider-title">Edit Product Details</div>
                    <img class="close-product-slider" src="images/icons/Cancelslide.png" onclick="hideEditSlider()"/>
                    <div class="product-slider-hline">
                        <hr size="2" color="#5F4AE7"/>
                    </div>
                </div>
                <div class="product-slider-form">
                    <form method="post" action="ProductCatalogServlet" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="update"/>
                        <input type="hidden" name="productID" id="edit-productID"/>

                        <div class="product-form">
                            <div class="product-form-row">
                                <label class="product-form-label">Product Name</label>
                                <input class="form-product-text" type="text" name="customer-fname" id="edit-name"/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Unit Quantity</label>
                                <!-- read-only or not? We'll let them re-specify "1" or "100g" -->
                                <input class="form-product-text" type="text" name="customer-lname" id="edit-quantity"/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Price</label>
                                <input class="form-product-text" type="text" name="phone-no" id="edit-price"/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Category</label>
                                <div class="product-role-select">
                                    <select name="productCategory" id="edit-category">
                                        <option>Vegetables</option>
                                        <option>Fruits</option>
                                        <option>Meat</option>
                                        <option>HouseHold</option>
                                        <option>Grocery</option>
                                        <option>Bakery</option>
                                        <option>Beverages</option>
                                    </select>
                                </div>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Product Image</label>
                                <div class="image-select-banner">
                                    <label class="file-upload-banner">
                                        <img id="edit-image-preview" src="images/products/carrot.png" class="img-preview-banner"/>
                                        <input type="file" name="productImageInput" accept=".jpeg,.png,.webp" style="display:none;"/>
                                    </label>
                                </div>
                            </div>
                            <button class="form-save-but" type="submit" onclick="hideEditSlider()">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- ADD Product Slider -->
        <div class="product-slider" id="addproductSlider">
            <div class="product-slider-container">
                <div class="product-slider-header">
                    <div class="product-slider-title">Add New Product</div>
                    <img class="close-product-slider" src="images/icons/Cancelslide.png" onclick="hideSlider()"/>
                    <div class="product-slider-hline">
                        <hr size="2" color="#5F4AE7"/>
                    </div>
                </div>
                <div class="product-slider-form">
                    <form method="post" action="ProductCatalogServlet" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="add"/>

                        <div class="product-form">
                            <div class="product-form-row">
                                <label class="product-form-label">Product Name</label>
                                <input class="form-product-text" type="text" name="customer-fname" required/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Unit Quantity</label>
                                <input class="form-product-text" type="text" name="customer-lname" placeholder="1 or 100g" required/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Price</label>
                                <input class="form-product-text" type="text" name="phone-no" required/>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Product Category</label>
                                <div class="product-role-select">
                                    <select name="productCategory" required>
                                        <option>Vegetables</option>
                                        <option>Fruits</option>
                                        <option>Meat</option>
                                        <option>HouseHold</option>
                                        <option>Grocery</option>
                                        <option>Bakery</option>
                                        <option>Beverages</option>
                                    </select>
                                </div>
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Product Image</label>
                                <div class="custom-image-upload">
                                    <label class="custom-upload-container">
                                        <img src="images/icons/Uploadimg.png" class="custom-preview-image" id="imagePreview"/>
                                        <input type="file" name="productImageInput" accept=".jpeg,.png,.webp" onchange="previewImage(event)"/>
                                        <span id="dragLabel">Drag your images here</span>
                                    </label>
                                </div>
                            </div>
                            <button class="form-save-but" type="submit" onclick="hideSlider()">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // Tab switching
            document.addEventListener("DOMContentLoaded", () => {
                const navButtons = document.querySelectorAll(".product-nav button");
                const slides = document.querySelectorAll(".product-slide");

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

            function showEditSlider(productID, productName, quantityStr, priceVal, category, imageURL) {
                document.getElementById('edit-productID').value = productID;
                document.getElementById('edit-name').value = productName;
                document.getElementById('edit-quantity').value = quantityStr;
                document.getElementById('edit-price').value = priceVal;
                document.getElementById('edit-category').value = category;
                let editPreview = document.getElementById('edit-image-preview');
                if (editPreview) {
                    editPreview.src = imageURL;
                }
                document.getElementById('editproductSlider').classList.add('active');
            }
            function hideEditSlider() {
                document.getElementById('editproductSlider').classList.remove('active');
            }

            function previewImage(event) {
                const input = event.target;
                const preview = document.getElementById('imagePreview');
                const uploadContainer = document.querySelector('.custom-image-upload');

                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        preview.src = e.target.result;
                        uploadContainer.classList.add('image-selected');
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </body>
</html>
