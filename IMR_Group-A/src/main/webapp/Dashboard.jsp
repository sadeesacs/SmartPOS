<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.DashboardModels.DailySalesItem" %>
<%@ page import="Model.DashboardModels.CategorySalesItem" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="StyleSheet9.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png" /></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>
            <ul class="nav-menu">
                <a href="Dashboard.jsp">
                    <li class="nav-item active">
                        <img src="images/icons/Dashboard-W.png" />
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/POS-B.png" />
                        <span>POS</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Products-B.png" />
                        <span>Products</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Stock-B.png" />
                        <span>Stock</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Discount-B.png" />
                        <span>Discounts</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Bills-B.png" />
                        <span>Bills</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Customers-B.png" />
                        <span>Customers</span>
                    </li>
                </a>
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Reports-B.png" />
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
            <form method="post" action="SystemUsersServlet">
                <input type="hidden" name="action" value="logout" />
                <button class="logout">
                    <img src="images/icons/Logout.png"/>
                    <span>Logout</span>
                </button>
            </form>
        </div>

        <div class="notfication-icon">
            <img src="images/icons/notify-icon.png">
        </div>

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

        <div class="main-header">
            Today's Store Statistics
        </div>

        <div class="middle-container">
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon1.png" alt="Items Icon">
                    </div>
                    <p>All-Time Items Sold</p>
                    <h3><%= request.getAttribute("totalItems") != null ? request.getAttribute("totalItems") : 0 %></h3>
                    <span style="left:185px;">Items</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon2.png" alt="Customers Icon">
                    </div>
                    <p>Total Customers</p>
                    <h3><%= request.getAttribute("totalCustomers") != null ? request.getAttribute("totalCustomers") : 0 %></h3>
                    <span style="left:145px;">Customers</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon3.png" alt="Sales Icon">
                    </div>
                    <p>All-Time Sales</p>
                    <h3><%= request.getAttribute("totalSales") != null ? request.getAttribute("totalSales") : 0 %></h3>
                    <span style="left:190px;">LKR</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon4.png" alt="Critical Stock Icon">
                    </div>
                    <p>Critical Stock</p>
                    <h3><%= request.getAttribute("criticalStock") != null ? request.getAttribute("criticalStock") : 0 %></h3>
                    <span style="left:160px;">Products</span>
                </div>
            </div>

            <div class="charts-container">
                <div class="chart-card-1">
                    <h3>Daily Sales Bar Graph</h3>
                    <canvas id="dailySalesChart"></canvas>
                </div>
                <div class="chart-card-2">
                    <h3>Total Sales</h3>
                    <canvas id="salesPieChart"></canvas>
                </div>
            </div>
        </div>

        <!-- Daily Sales Chart -->
        <script>
            var labels = [];
            var salesData = [];

            <%
                List<DailySalesItem> dailySalesData = 
                    (List<DailySalesItem>) request.getAttribute("dailySalesData");
                if (dailySalesData != null && !dailySalesData.isEmpty()) {
                    for (DailySalesItem item : dailySalesData) {
            %>
                        labels.push("<%= item.getDay().toString() %>");
                        salesData.push(<%= item.getTotal() %>);
            <%
                    }
                } else {
            %>
                    labels.push("No Data");
                    salesData.push(0);
            <%
                }
            %>

            const ctx = document.getElementById('dailySalesChart').getContext('2d');
            const dailySalesChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Total Sales (LKR)',
                        data: salesData,
                        backgroundColor: 'rgba(75,192,192,0.6)',
                        borderColor: 'rgba(75,192,192,1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Sales Amount (LKR)'
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Date'
                            }
                        }
                    }
                }
            });
        </script>

        <!-- Pie Chart -->
        <script>
            var catLabels = [];
            var catData = [];

            <%
                List<CategorySalesItem> incomeData = 
                    (List<CategorySalesItem>) request.getAttribute("incomeData");
                if (incomeData != null && !incomeData.isEmpty()) {
                    for (CategorySalesItem csi : incomeData) {
            %>
                        catLabels.push("<%= csi.getCategory() %>");
                        catData.push(<%= csi.getTotal() %>);
            <%
                    }
                } else {
            %>
                    catLabels.push("No Data");
                    catData.push(0);
            <%
                }
            %>

            const ctxPie = document.getElementById('salesPieChart').getContext('2d');
            const salesPieChart = new Chart(ctxPie, {
                type: 'pie',
                data: {
                    labels: catLabels,
                    datasets: [{
                        label: 'Total Sales by Category (LKR)',
                        data: catData,
                        backgroundColor: [
                            'rgba(255,99,132,0.6)',
                            'rgba(54,162,235,0.6)',
                            'rgba(255,206,86,0.6)',
                            'rgba(75,192,192,0.6)',
                            'rgba(153,102,255,0.6)',
                            'rgba(255,159,64,0.6)',
                            'rgba(0,255,0,0.6)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54,162,235,1)',
                            'rgba(255,206,86,1)',
                            'rgba(75,192,192,1)',
                            'rgba(153,102,255,1)',
                            'rgba(255,159,64,1)',
                            'rgba(0,255,0,1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'bottom'
                        },
                        title: {
                            display: true,
                        }
                    }
                }
            });
        </script>
    </body>
</html>
