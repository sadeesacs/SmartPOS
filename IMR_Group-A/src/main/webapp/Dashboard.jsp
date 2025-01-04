<%@page import="java.util.stream.Collectors"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.dbconn" %>
<%@ page import="java.util.*" %>

<%
    HttpSession session1 = request.getSession(false);

    // Check if the session is null 
    if (session1 == null) {
        response.sendRedirect("Login.jsp");
        return; 
    }

    // Get user role from session
    String role = (String) session.getAttribute("Role");

    // Check if the role is admin
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("Login.jsp");
        return; 
    }
%>
<%
    // Initialize variables
    int totalCustomers = 0;
    int criticalStock = 0;
    double totalSales = 0;
    int totalItems = 0;
    List<Map<String, Object>> dailySalesData = new ArrayList<>();
    List<Map<String, Object>> incomeData = new ArrayList<>();

    //database connection
    try (Connection conn = dbconn.getConnection()) {
        // Query to count total customers
        String customerQuery = "SELECT COUNT(*) as customerCount FROM Customers";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(customerQuery)) {
            if (rs.next()) {
                totalCustomers = rs.getInt("customerCount");
            }
        }

        // Query to count critical stock items
        String stockQuery = "SELECT COUNT(*) as criticalCount FROM Stock WHERE Quantity < 30";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(stockQuery)) {
            if (rs.next()) {
                criticalStock = rs.getInt("criticalCount");
            }
        }

        // Query for all-time total sales and items
        String salesQuery = "SELECT SUM(LineTotal) AS totalSales, SUM(QuantitySold) AS totalItems "
                + "FROM dbo.TransactionLine";

        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(salesQuery)) {
            if (rs.next()) {
                totalSales = rs.getDouble("totalSales");
                totalItems = rs.getInt("totalItems");
            }
        }

        // Query for today's daily sales data (summarized per day)
        String dailySalesQuery = "SELECT CAST(th.TransactionDate AS DATE) AS day, "
                + "COALESCE(SUM(tl.LineTotal), 0) AS total "
                + "FROM dbo.TransactionHeader th "
                + "JOIN dbo.TransactionLine tl ON th.TransactionID = tl.TransactionID "
                + "GROUP BY CAST(th.TransactionDate AS DATE) "
                + "ORDER BY day";

        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(dailySalesQuery)) {
            while (rs.next()) {
                Map<String, Object> dataPoint = new HashMap<>();
                dataPoint.put("day", rs.getDate("day")); 
                dataPoint.put("total", rs.getDouble("total"));
                dailySalesData.add(dataPoint);
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }

        String categoryQuery = "SELECT p.ProductCategory AS category, SUM(tl.LineTotal) AS total "
                + "FROM dbo.TransactionLine tl "
                + "JOIN dbo.Stock s ON tl.StockID = s.StockID "
                + "JOIN dbo.Products p ON s.ProductID = p.ProductID "
                + "GROUP BY p.ProductCategory "
                + "ORDER BY total DESC;";

        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(categoryQuery)) {
            while (rs.next()) {
                Map<String, Object> dataPoint = new HashMap<>();
                dataPoint.put("category", rs.getString("category")); 
                dataPoint.put("total", rs.getDouble("total")); 
                incomeData.add(dataPoint);
            }

            // Check if incomeData is empty and log appropriate message
            if (incomeData.isEmpty()) {
                System.out.println("No sales data found for any product categories.");
            } else {
                System.out.println("Records Retrieved: " + incomeData.size());
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    request.setAttribute("incomeData", incomeData);
    request.setAttribute("totalCustomers", totalCustomers);
    request.setAttribute("criticalStock", criticalStock);
    request.setAttribute("totalSales", String.format("%.2f", totalSales));
    request.setAttribute("totalItems", totalItems);
    request.setAttribute("dailySalesData", dailySalesData);

%>


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
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png" /></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>
            <ul class="nav-menu">
                <a href="Dashboard.jsp">
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
            <button class="logout" onclick="location.href = 'LogoutServlet';">
                <img src="images/icons/Logout.png"/>
                <span>Logout</span>
            </button>
        </div>

        <div class="notfication-icon">
            <img src="images/icons/notify-icon.png">
        </div>

        <div class="user-profile">
            <div class="user-avatar">
                <img src="images/icons/usericon.png">
            </div>
            <div class="user-info">
                <span class="user-name">Leo Perera</span>
                <span class="user-role">Admin</span>
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
                    <h3><%= request.getAttribute("totalItems") != null ? request.getAttribute("totalItems") : 0%></h3>
                    <span style="left: 185px;">Items</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon2.png" alt="Customers Icon">
                    </div>
                    <p>Total Customers</p>
                    <h3><%= request.getAttribute("totalCustomers") != null ? request.getAttribute("totalCustomers") : 0%></h3>
                    <span style="left: 145px;">Customers</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon3.png" alt="Sales Icon">
                    </div>
                    <p>All-Time Sales</p>
                    <h3><%= request.getAttribute("totalSales") != null ? request.getAttribute("totalSales") : 0%></h3>
                    <span style="left: 190px;">LKR</span>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="images/icons/Dashboard-icon4.png" alt="Critical Stock Icon">
                    </div>
                    <p>Critical Stock</p>
                    <h3><%= request.getAttribute("criticalStock") != null ? request.getAttribute("criticalStock") : 0%></h3>
                    <span style="left: 160px;">Products</span>
                </div>
            </div>

            <div class="charts-container">
                <div class="chart-card-1">
                    <h3>Daily Sales Bar Graph</h3>
                    <canvas id="dailySalesChart"></canvas>
                </div>
                <div class="chart-card-2">
                    <h3>Total Sales</h3>
                    <canvas id="salesPieChart" ></canvas>
                </div>
            </div>

            <script>
                // Prepare data for the chart
                var labels = [];
                var salesData = [];

                // Loop through dailySalesData to extract labels and sales amounts
                <% for (Map<String, Object> data : dailySalesData) {%>
                labels.push('<%= data.get("day") != null ? data.get("day").toString() : ""%>');
                salesData.push(<%= data.get("total") != null ? String.format("%.2f", data.get("total")) : "0"%>);
                <% }%>

                var ctx = document.getElementById('dailySalesChart').getContext('2d');
                var dailySalesChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'Total Sales (LKR)',
                                data: salesData,
                                backgroundColor: 'rgba(75, 192, 192, 0.6)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
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
                        },
                        responsive: true,
                        plugins: {
                            legend: {
                                display: true,
                                position: 'top',
                            },
                        }
                    }
                });
            </script>

            <script>
                // Prepare data for the pie chart
                var labels = [];
                var salesData = [];

                // Loop through incomeData to extract labels and total sales amounts
                <%

                    if (incomeData != null && !incomeData.isEmpty()) {
                        for (Map<String, Object> data : incomeData) {
                %>
                labels.push('<%= data.get("category") != null ? data.get("category").toString() : ""%>');
                salesData.push(<%= data.get("total") != null ? String.format("%.2f", data.get("total")) : "0"%>);
                <%
                    }
                } else {
                %>
                labels.push('No Data');
                salesData.push(0);
                <%
                    }
                %>

                var ctx = document.getElementById('salesPieChart').getContext('2d');
                var salesPieChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'Total Sales by Category (LKR)',
                                data: salesData,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.6)',
                                    'rgba(54, 162, 235, 0.6)',
                                    'rgba(255, 206, 86, 0.6)',
                                    'rgba(75, 192, 192, 0.6)',
                                    'rgba(153, 102, 255, 0.6)',
                                    'rgba(255, 159, 64, 0.6)',
                                    'rgba(0, 255, 0, 0.6)' // Add more colors if needed
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(0, 255, 0, 1)' // Corresponding border colors
                                ],
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                display: true,
                                position: 'bottom',
                            },
                            title: {
                                display: true,

                            }
                        }
                    }
                });
            </script>
        </div>
    </body>
</html>