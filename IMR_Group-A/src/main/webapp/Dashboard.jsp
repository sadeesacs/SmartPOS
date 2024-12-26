<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="StyleSheet1.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F1F5FE;
            display: flex;
        }

        .navigation {
            width: 300px;
            height: 100vh;
            flex-shrink: 0;
            background-color: #fff;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-size: 24px;
            font-weight: bold;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .notification-icon {
            font-size: 24px;
            color: #6c63ff;
            cursor: pointer;
            position: relative;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: #fff;
            border: 1px solid #6c63ff;
            border-radius: 50px;
            padding: 5px 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .user-avatar {
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }

        .user-name {
            font-size: 16px;
            font-weight: bold;
            color: #000;
        }

        .user-role {
            font-size: 12px;
            color: #888;
        }

        .stats-container {
            display: flex;
            gap: 20px;
            justify-content: space-between;
        }

        .stat-card {
            background: white;
            flex: 1;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .stat-card h3 {
            margin: 0;
            font-size: 18px;
            color: #6c63ff;
        }

        .stat-card p {
            font-size: 24px;
            font-weight: bold;
            margin: 5px 0;
        }

        .charts-container {
            display: flex;
            gap: 20px;
            justify-content: space-between;
        }

        .chart-card {
            flex: 1;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .chart-card canvas {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="navigation">
        <div class="Logo"><img src="images/icons/logo.png" alt="Logo"></div>
        <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>
        <ul class="nav-menu">
            <a href="Dashboard.jsp">
                <li class="nav-item active">
                    <img src="images/icons/Dashboard-B.png" alt="Dashboard Icon">
                    <span>Dashboard</span>
                </li>
            </a>
            <a href="#">
                <li class="nav-item">
                    <img src="images/icons/POS-B.png" alt="POS Icon">
                    <span>POS</span>
                </li>
            </a>
            <a href="#">
                <li class="nav-item">
                    <img src="images/icons/Products-B.png" alt="Products Icon">
                    <span>Products</span>
                </li>
            </a>
            <a href="#">
                <li class="nav-item">
                    <img src="images/icons/Stock-B.png" alt="Stock Icon">
                    <span>Stock</span>
                </li>
            </a>
            <a href="#">
                <li class="nav-item">
                    <img src="images/icons/Discount-B.png" alt="Discounts Icon">
                    <span>Discounts</span>
                </li>
            </a>
            <a href="#">
                <li class="nav-item">
                    <img src="images/icons/Bills-B.png" alt="Bills Icon">
                    <span>Bills</span>
                </li>
            </a>
            <a href="#">
                <li class="nav-item">
                    <img src="images/icons/Customers-W.png" alt="Customers Icon">
                    <span>Customers</span>
                </li>
            </a>
            <a href="#">
                <li class="nav-item">
                    <img src="images/icons/Reports-B.png" alt="Reports Icon">
                    <span>Reports</span>
                </li>
            </a>
            <a href="#">
                <li class="nav-item">
                    <img src="images/icons/Admin-B.png" alt="Admin Icon">
                    <span>Users</span>
                </li>
            </a>
        </ul>
        <button class="logout">
            <img src="images/icons/Logout.png" alt="Logout Icon">
            <span>Logout</span>
        </button>
    </div>

    <div class="main-content">
        <div class="dashboard-header">
            Today's Store Statistics
            <div class="user-info">
                <i class="bi bi-bell notification-icon"></i>
                <div class="user-profile">
                    <img src="images/icons/usericon.png" alt="User Avatar" class="user-avatar">
                    <div>
                        <span class="user-name">Leo Perera</span>
                        <span class="user-role">Admin</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="stats-container">
            <div class="stat-card">
                <h3>Total Items Sold</h3>
                <p>12500</p>
                <span>Items</span>
            </div>
            <div class="stat-card">
                <h3>Total Customers</h3>
                <p>700</p>
                <span>Customers</span>
            </div>
            <div class="stat-card">
                <h3>Total Sales</h3>
                <p>755000</p>
                <span>LKR</span>
            </div>
            <div class="stat-card">
                <h3>Critical Stock</h3>
                <p>10</p>
                <span>Products</span>
            </div>
        </div>

        <div class="charts-container">
            <div class="chart-card">
                <h3>Daily Sales</h3>
                <canvas id="dailySalesChart"></canvas>
            </div>
            <div class="chart-card">
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
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });
    </script>
</body>
</html