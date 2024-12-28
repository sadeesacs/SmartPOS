<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports</title>
        <link rel="stylesheet" href="StyleSheet6.css" />
        
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        
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
                    <li class="nav-item active">
                        <img src="images/icons/Reports-W.png"></img>
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
            Reports
        </div>

        <!--Middle Container for content-->
        <div class="middle-container">
            <nav class="report-nav">
                <button data-target="Daily Stock Report" class="active">Daily Stock Report</button>
                <button data-target="Monthly Revenue Report">Monthly Revenue Report</button>
                <button data-target="Top Performing Products">Top Performing Products</button>
                <button data-target="Low Performing Products">Low Performing Products</button>
            </nav>
            <div class="report-slides">
                
                <!--Daily Stock Report-->
                <div id="Daily Stock Report" class="report-slide active">
                    <div class="date-picker-container">
                        <label for="reportDate" class="date-label">Select the Date</label>
                        <input type="date" id="reportDate" name="reportDate" class="custom-date-picker">
                        <button type="button" class="search-button">Search</button>
                    </div>
                    <div class="header-container" >
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:220px">Description</span>
                        <div class="header-top" style="margin-left:680px">Stock Quantity</div>
                        <div class="header-top" style="margin-left:910px">Status</div>
                    </div>
                    <div class="content-container" style="margin-top:150px;height: 70%">
                        <div class="pro-stock" data-status="in-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Prima Kottu Mee</p>
                            <p class="pro-stock-quantity">50</p>
                            <p class="pro-stock-status">In Stock</p>
                        </div>
                        <div class="pro-stock" data-status="out-of-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Prima Kottu Mee</p>
                            <p class="pro-stock-quantity">50</p>
                            <p class="pro-stock-status">In Stock</p>
                        </div>
                        <div class="pro-stock" data-status="low-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Prima Kottu Mee</p>
                            <p class="pro-stock-quantity">50</p>
                            <p class="pro-stock-status">In Stock</p>
                        </div>
                        <div class="pro-stock" data-status="in-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Prima Kottu Mee</p>
                            <p class="pro-stock-quantity">50</p>
                            <p class="pro-stock-status">In Stock</p>
                        </div>
                    </div>
                </div>
                
                
                
                
                <!--Monthly Revenue Report-->
                <div id="Monthly Revenue Report" class="report-slide ">
                    <div class="month-picker-container">
                        <label for="reportMonth" class="month-label">Select the Month</label>
                        <select id="reportMonth" name="reportMonth" class="custom-month-picker">
                          <option value="" disabled selected>Select Month</option>
                          <option value="01">January</option>
                          <option value="02">February</option>
                          <option value="03">March</option>
                          <option value="04">April</option>
                          <option value="05">May</option>
                          <option value="06">June</option>
                          <option value="07">July</option>
                          <option value="08">August</option>
                          <option value="09">September</option>
                          <option value="10">October</option>
                          <option value="11">November</option>
                          <option value="12">December</option>
                        </select>
                        <button type="button" class="month-search-button">Search</button>
                    </div>
                    <div class="chart-container">
                        <h2>Monthly Revenue</h2>
                        <div class="monthly-revenue">LKR 250000.00</div>
                        <canvas id="monthlyRevenueChart"></canvas>
                    </div>

                </div>
                
                
                
                
                <!--Top Performing Products-->
                <div id="Top Performing Products" class="report-slide ">
                    <div class="month-picker-container">
                        <label for="reportMonth" class="month-label">Select the Month</label>
                        <select id="reportMonth" name="reportMonth" class="custom-month-picker">
                          <option value="" disabled selected>Select Month</option>
                          <option value="01">January</option>
                          <option value="02">February</option>
                          <option value="03">March</option>
                          <option value="04">April</option>
                          <option value="05">May</option>
                          <option value="06">June</option>
                          <option value="07">July</option>
                          <option value="08">August</option>
                          <option value="09">September</option>
                          <option value="10">October</option>
                          <option value="11">November</option>
                          <option value="12">December</option>
                        </select>
                        <button type="button" class="month-search-button">Search</button>
                    </div>
                    <div class="header-container" >
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:220px">Description</span>
                        <div class="header-top" style="margin-left:680px">Revenue</div>
                        <div class="header-top" style="margin-left:910px">Units Sold</div>
                    </div>
                    <div class="content-container" style="margin-top:150px;height: 70%">
                        <div class="pro-stock" data-status="in-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Prima Kottu Mee</p>
                            <p class="pro-high-revenue">LKR 50000.00</p>
                            <p class="pro-high-unitsold">220</p>
                        </div>
                    </div>
                </div>
                
                
                
                
                <!--Low Performing Products-->
                <div id="Low Performing Products" class="report-slide ">
                    <div class="month-picker-container">
                        <label for="reportMonth" class="month-label">Select the Month</label>
                        <select id="reportMonth" name="reportMonth" class="custom-month-picker">
                          <option value="" disabled selected>Select Month</option>
                          <option value="01">January</option>
                          <option value="02">February</option>
                          <option value="03">March</option>
                          <option value="04">April</option>
                          <option value="05">May</option>
                          <option value="06">June</option>
                          <option value="07">July</option>
                          <option value="08">August</option>
                          <option value="09">September</option>
                          <option value="10">October</option>
                          <option value="11">November</option>
                          <option value="12">December</option>
                        </select>
                        <button type="button" class="month-search-button">Search</button>
                    </div>
                    <div class="header-container" >
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:220px">Description</span>
                        <div class="header-top" style="margin-left:680px">Revenue</div>
                        <div class="header-top" style="margin-left:910px">Units Sold</div>
                    </div>
                    <div class="content-container" style="margin-top:150px;height: 70%">
                        <div class="pro-stock" data-status="in-stock">
                            <p class="pro-stock-id">#13236</p>
                            <p class="pro-stock-name">Dog Food 850g</p>
                            <p class="pro-high-revenue">LKR 7000.00</p>
                            <p class="pro-high-unitsold">20</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const navButtons = document.querySelectorAll(".report-nav button");
                const slides = document.querySelectorAll(".report-slide"); // Corrected selector

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
            
            
            document.addEventListener("DOMContentLoaded", () => {
              const stockCards = document.querySelectorAll(".pro-stock");

              stockCards.forEach((card) => {
                const status = card.getAttribute("data-status"); 

                const statusElement = card.querySelector(".pro-stock-status");

                if (status === "in-stock") {
                  statusElement.classList.add("in-stock");
                  statusElement.textContent = "In Stock"; 
                } else if (status === "out-of-stock") {
                  statusElement.classList.add("out-of-stock");
                  statusElement.textContent = "Out of Stock"; 
                } else if (status === "low-stock") {
                  statusElement.classList.add("low-stock");
                  statusElement.textContent = "Low Stock"; 
                }
              });
            });
            
            
            document.addEventListener("DOMContentLoaded", () => {
            const monthlyRevenueChartCtx = document
              .getElementById("monthlyRevenueChart")
              .getContext("2d");

            // Demo values for daily revenue
            const demoDailyRevenue = [
              10000, 12000, 8000, 15000, 14000, 18000, 20000, 17000, 15000, 22000, 24000,
              23000, 19000, 21000, 20000, 25000, 26000, 27000, 29000, 28000, 31000, 30000,
              32000, 35000, 34000, 33000, 31000, 30000, 29000, 31000, 32000,
            ];

            // Days of the month as labels
            const daysOfMonth = Array.from({ length: 31 }, (_, i) => i + 1); // 1 to 31

            // Create the chart
            new Chart(monthlyRevenueChartCtx, {
              type: "bar",
              data: {
                labels: daysOfMonth, // Days of the month
                datasets: [
                  {
                    label: "Daily Revenue (LKR)",
                    data: demoDailyRevenue, // Demo values for each day
                    backgroundColor: "#0E80BF",
                    borderColor: "#0E80BF",
                    borderWidth: 1,
                  },
                ],
              },
              options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                  x: {
                    title: {
                      display: true,
                      text: "Days of the Month",
                      font: { size: 14 },
                    },
                  },
                  y: {
                    beginAtZero: true,
                    title: {
                      display: true,
                      text: "Revenue (LKR)",
                      font: { size: 14 },
                    },
                  },
                },
                plugins: {
                  legend: {
                    position: "top",
                  },
                },
              },
            });
          });

        </script>

    </body>
</html>
