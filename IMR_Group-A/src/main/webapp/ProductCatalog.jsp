<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Catalog</title>
        <link rel="stylesheet" href="StyleSheet5.css" />

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
                    <li class="nav-item active">
                        <img src="images/icons/Products-W.png"></img>
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
            Product Catalog
        </div>

        <!--Middle Container for content-->
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
                <div id="Vegetables" class="product-slide active">
                        <div class="product-cards-container">
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                    </div>
                </div>
                <div id="Fruits" class="product-slide ">
                        <div class="product-cards-container">
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                    </div>
                </div>
                <div id="Grocery" class="product-slide ">
                        <div class="product-cards-container">
                            <div class="product-card">
                                <img src="images/products/carrot.png" alt="Carrot" class="product-image">
                                <div class="product-header">
                                    <span class="product-id">#26545</span>
                                    <div class="product-actions">
                                        <button class="edit-button" onclick="showEditSlider()" title="Edit"><i class="bi bi-pencil-fill"></i></button>
                                        <button class="delete-button" title="Delete"><i class="bi bi-trash3-fill"></i></button>
                                    </div>
                                </div>
                                <h4 class="product-name">Carrot  </h4>
                                <div class="product-price-container">
                                    <p class="product-price">LKR 290.00</p>
                                    <p class="product-weight">100g</p>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <button class="add-button" style="font-size: 15px" onclick="showSlider()">
            <div>+</div>
            <p>Add Product</p>
        </button>

        
        
        
        <!--Edit Item Slider-->
         <div class="product-slider" id="editproductSlider">
            <div class="product-slider-container">
                <div class="product-slider-header">
                    <div class="product-slider-title">Edit Product Details</div>
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
                                <label class="product-form-label">Unit Quantity</label>
                                <input class="form-product-text" type="text" id="customer-lname" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Unit Price</label>
                                <input class="form-product-text" type="text" id="phone-no" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Product Category</label>
                                <div class="product-role-select">
                                    <select>
                                        <option>Vegetables</option>
                                        <option>Fruits</option>
                                        <option>HouseHold</option>
                                        <option>Meat</option>
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
                                        <img src="images/products/carrot.png" class="img-preview-banner" />
                                        <input type="file" id="movie-Banner" accept=".jpeg, .webp, .png" style="display: none;" />
                                    </label>
                                </div>
                            </div>
                            <button class="form-save-but" type="submit" onclick="hideEditSlider()">Update</button>
                        </div>
                    </form>
                </div>  
            </div>
        </div>
        
        
        <!--ADD Item Slider-->
         <div class="product-slider" id="addproductSlider">
            <div class="product-slider-container">
                <div class="product-slider-header">
                    <div class="product-slider-title">Add New Product</div>
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
                                <label class="product-form-label">Unit Quantity</label>
                                <input class="form-product-text" type="text" id="customer-lname" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Unit Price</label>
                                <input class="form-product-text" type="text" id="phone-no" />
                            </div>
                            <div class="product-form-row">
                                <label class="product-form-label">Product Category</label>
                                <div class="product-role-select">
                                    <select>
                                        <option>Vegetables</option>
                                        <option>Fruits</option>
                                        <option>HouseHold</option>
                                        <option>Meat</option>
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
                                        <img src="images/icons/Uploadimg.png" class="custom-preview-image" id="imagePreview" />
                                        <input type="file" id="productImageInput" accept=".jpeg, .webp, .png" onchange="previewImage(event)" />
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
            document.addEventListener("DOMContentLoaded", () => {
                const navButtons = document.querySelectorAll(".product-nav button");
                const slides = document.querySelectorAll(".product-slide"); // Corrected selector

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
            
            function previewImage(event) {
                const input = event.target;
                const preview = document.getElementById('imagePreview');
                const uploadContainer = document.querySelector('.custom-image-upload');

                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        preview.src = e.target.result; // Set image preview
                        uploadContainer.classList.add('image-selected'); // Add class to hide label
                    };
                    reader.readAsDataURL(input.files[0]); // Read the file
                }
            }

        </script>
        
        
    </body>
</html>
