<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        
        <link rel="stylesheet" href="StyleSheet9.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        
    </head>
    <body>
        
        <!-- Navigational Panel of the Smart POS System -->
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png" /></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>
        
            <ul class="nav-menu">
                <a href="">
                    <li class="nav-item active">
                        <img src="images/icons/Dashboard-W.png"></img>
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
            Today's Store Statistics
        </div>
        
        
        <!--Middle Container-->
        <div class="middle-container">
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon1.png" alt="Items Icon">
                    </div>
                    <p>Total Items Sold</p>
                    <h3>12500</h3>
                    <span style="left: 185px;">Items</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon2.png" alt="Items Icon">
                    </div>
                    <p>Total Customers</p>
                    <h3>700</h3>
                    <span style="left: 145px;">Customers</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon3.png" alt="Items Icon">
                    </div>
                    <p>Total Sales</p>
                    <h3>755000</h3>
                    <span style="left: 190px;">LKR</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon4.png" alt="Items Icon">
                    </div>
                    <p>Critical Stock</p>
                    <h3>10</h3>
                    <span style="left: 160px;">Products</span>
                </div>
            </div>


            <div class="charts-container">
                <div class="chart-card-1">
                    <h3>Daily Sales</h3>
                    <canvas id="dailySalesChart"></canvas>
                </div>
                <div class="chart-card-2">
                    <h3>Total Income</h3>
                    <canvas id="totalIncomeChart"></canvas>
                </div>
            </div>
        </div>
            
        
            

        <script>
            const dailySalesCtx = document.getElementById('dailySalesChart').getContext('2d');
            new Chart(dailySalesCtx, {
                type: 'line',
                data: {
                    labels: ['9 AM', '11 AM', '1 PM', '3 PM', '5 PM', '7 PM', '9 PM'],
                    datasets: [{
                        label: 'Sales',
                        data: [2000, 1500, 3000, 1200, 2000, 1800, 1500],
                        borderColor: '#6c63ff',
                        backgroundColor: 'rgba(108, 99, 255, 0.2)',
                        fill: true,
                        tension: 0.4,
                        pointBackgroundColor: '#6c63ff',
                    }],
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: { display: false }
                    }
                }
            });

            const totalIncomeCtx = document.getElementById('totalIncomeChart').getContext('2d');
            new Chart(totalIncomeCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Dairy', 'Meat', 'Others', 'Fresh Produce'],
                    datasets: [{
                        data: [40, 25, 20, 15],
                        backgroundColor: ['#FFD700', '#FF6347', '#4682B4', '#32CD32'],
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false, 
                    plugins: {
                        legend: {
                            position: 'right', 
                            labels: {
                                boxWidth: 15, 
                                font: {
                                    size: 14 
                                }
                            }
                        }
                    },
                    layout: {
                        padding: {
                            top: 0, 
                            bottom: 0 
                        }
                    }
                }
            });
        </script>
    </body>
</html