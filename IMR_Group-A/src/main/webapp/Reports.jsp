<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DB.dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="jakarta.servlet.annotation.WebServlet"%>
<%@page import="jakarta.servlet.http.HttpServlet"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
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
                    <form id="stockReportForm" method="GET">
                        <div class="date-picker-container">
                            <label for="reportDate" class="date-label">Select the Date</label>
                            <input type="date" id="reportDate" name="reportDate" class="custom-date-picker" 
                                   value="<%= request.getParameter("reportDate") != null ? request.getParameter("reportDate") : new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>">
                            <button type="submit" class="search-button">Search</button>
                        </div>
                    </form>

                    <div class="header-container">
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:220px">Description</span>
                        <div class="header-top" style="margin-left:480px">Stock Quantity</div>
                        <div class="header-top" style="margin-left:695px">Quantity Sold</div>
                        <div class="header-top" style="margin-left:910px">Status</div>
                    </div>

                    <div class="content-container" style="margin-top:150px;height: 70%">
                        <%
                            String selectedDate = request.getParameter("reportDate");
                            String sql = "SELECT p.ProductID,p.ProductName,s.Quantity, "
                                    + "CASE WHEN s.Quantity > 50 THEN 'In Stock' "
                                    + "    WHEN s.Quantity > 0 THEN 'Low Stock' "
                                    + "    ELSE 'Out of Stock' "
                                    + "END AS StockStatus, "
                                    + "COALESCE(("
                                    + "    SELECT SUM(tl.QuantitySold) "
                                    + "    FROM TransactionLine tl "
                                    + "    INNER JOIN TransactionHeader th ON tl.TransactionID = th.TransactionID "
                                    + "    WHERE tl.StockID = s.StockID "
                                    + "    AND CONVERT(date, th.TransactionDate) = ?"
                                    + "), 0) as QuantitySold "
                                    + "FROM Products p "
                                    + "INNER JOIN Stock s ON p.ProductID = s.ProductID "
                                    + "ORDER BY p.ProductID";
                            boolean hasData = false;

                            try (Connection conn = dbconn.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

                                // Set the date parameter
                                if (selectedDate != null && !selectedDate.isEmpty()) {
                                    stmt.setDate(1, java.sql.Date.valueOf(selectedDate));
                                } else {
                                    stmt.setDate(1, new java.sql.Date(System.currentTimeMillis()));
                                }

                                try (ResultSet rs = stmt.executeQuery()) {
                                    while (rs.next()) {
                                        int quantitySold = rs.getInt("QuantitySold");

                                        // Skip records where QuantitySold is 0 or NULL
                                        if (quantitySold > 0) {
                                            hasData = true;
                                            String productId = rs.getString("ProductID");
                                            String description = rs.getString("ProductName");
                                            int stockQuantity = rs.getInt("Quantity");
                                            String status = rs.getString("StockStatus");
                        %>
                        <div class="pro-stock" data-status="<%= status.toLowerCase().replace(" ", "-")%>">
                            <p class="pro-stock-id"><%= productId%></p>
                            <p class="pro-stock-name"><%= description%></p>
                            <p class="pro-stock-quantity"><%= stockQuantity%></p>
                            <p class="pro-stock-sold"><%= quantitySold%></p>
                            <p class="pro-stock-status"><%= status%></p>
                        </div>
                        <%
                                }
                            }

                            // Display a message if no data exists
                            if (!hasData) {
                        %>
                        <p style="text-align:center; margin-top:50px; color:gray;">No values for the selected date.</p>
                        <%
                                }
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        %>
                        <p style="color:red;">Error loading stock data. Please try again later.</p>
                        <%
                            }
                        %>
                    </div>
                </div>

                <style>
                    .pro-stock {
                        display: flex;
                        justify-content: space-between;
                        padding: 10px;
                        border-bottom: 1px solid #ddd;
                    }

                    .pro-stock p {
                        margin: 0;
                        padding: 0 10px;
                    }

                    .pro-stock-id {
                        width: 100px;
                    }
                    .pro-stock-name {
                        width: 250px;
                    }
                    .pro-stock-quantity {
                        width: 100px;
                        text-align: center;
                        position: absolute;
                        left: 480px;
                    }
                    .pro-stock-sold {
                        width: 100px;
                        text-align: center;
                        position: absolute;
                        left: 695px;
                    }
                    .pro-stock-status {
                        width: 100px;
                        text-align: center;
                        position: absolute;
                        left: 880px;
                    }
                </style>




                <!--Monthly Revenue Report-->
                <div id="Monthly Revenue Report" class="report-slide">
                    <div class="month-picker-container">
                        <label for="reportMonth" class="month-label">Select the Month</label>
                        <select id="reportMonth" name="reportMonth" class="custom-month-picker">
                            <option value="" disabled>Select Month</option>
                            <option value="01" <%= "01".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>January</option>
                            <option value="02" <%= "02".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>February</option>
                            <option value="03" <%= "03".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>March</option>
                            <option value="04" <%= "04".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>April</option>
                            <option value="05" <%= "05".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>May</option>
                            <option value="06" <%= "06".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>June</option>
                            <option value="07" <%= "07".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>July</option>
                            <option value="08" <%= "08".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>August</option>
                            <option value="09" <%= "09".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>September</option>
                            <option value="10" <%= "10".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>October</option>
                            <option value="11" <%= "11".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>November</option>
                            <option value="12" <%= "12".equals(request.getParameter("reportMonth")) ? "selected" : ""%>>December</option>
                        </select>
                        <button type="button" class="month-search-button" onclick="updateChart()">Search</button>
                    </div>
                    <div class="chart-container">
                        <h2>Monthly Revenue</h2>
                        <div id="chart-content">
                            <%
                                String month = request.getParameter("reportMonth");
                                String year = "2025";

                                if (month == null || month.isEmpty()) {
                                    month = "01";  // Default to January if month is not provided
                                }

                                String query = "WITH Calendar AS ("
                                        + "SELECT DATEADD(DAY, Number - 1, DATEFROMPARTS(?, ?, 1)) AS TransactionDate "
                                        + "FROM master.dbo.spt_values "
                                        + "WHERE Type = 'P' AND Number BETWEEN 1 AND DAY(EOMONTH(DATEFROMPARTS(?, ?, 1))) "
                                        + "), Transactions AS ("
                                        + "SELECT DAY(th.TransactionDate) AS day, "
                                        + "SUM(tl.LineTotal) AS total_revenue "
                                        + "FROM [dbo].[TransactionHeader] th "
                                        + "INNER JOIN [dbo].[TransactionLine] tl ON th.TransactionID = tl.TransactionID "
                                        + "WHERE YEAR(th.TransactionDate) = ? "
                                        + "AND MONTH(th.TransactionDate) = ? "
                                        + "GROUP BY DAY(th.TransactionDate) "
                                        + ") "
                                        + "SELECT DAY(cal.TransactionDate) as day, "
                                        + "COALESCE(trans.total_revenue, 0) AS total_revenue "
                                        + "FROM Calendar cal "
                                        + "LEFT JOIN Transactions trans ON DAY(cal.TransactionDate) = trans.day "
                                        + "ORDER BY cal.TransactionDate;";

                                StringBuilder dates = new StringBuilder();
                                StringBuilder revenues = new StringBuilder();

                                try (Connection conn = dbconn.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

                                    stmt.setString(1, year);    // First year parameter for Calendar CTE
                                    stmt.setString(2, month);   // First month parameter for Calendar CTE
                                    stmt.setString(3, year);    // Second year parameter for Calendar CTE
                                    stmt.setString(4, month);   // Second month parameter for Calendar CTE
                                    stmt.setString(5, year);    // Year parameter for Transactions filtering
                                    stmt.setString(6, month);   // Month parameter for Transactions filtering

                                    try (ResultSet rs = stmt.executeQuery()) {
                                        boolean isFirst = true;
                                        while (rs.next()) {
                                            if (!isFirst) {
                                                dates.append(",");
                                                revenues.append(",");
                                            }
                                            dates.append("'Day ").append(rs.getInt("day")).append("'");
                                            revenues.append(String.format("%.2f", rs.getDouble("total_revenue")));
                                            isFirst = false;
                                        }
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            %>
                            <div style="width: 100%; height: 400px;">
                                <canvas id="revenueChart"></canvas>
                            </div>

                            <script>
                                let revenueChart = null;

                                function updateChart() {
                                    const month = document.getElementById('reportMonth').value;
                                    if (!month) {
                                        alert('Please select a month.');
                                        return;
                                    }

                                    // Store chart data in form and submit
                                    const form = document.createElement('form');
                                    form.method = 'GET';
                                    form.action = ''; // Current page

                                    const monthInput = document.createElement('input');
                                    monthInput.type = 'hidden';
                                    monthInput.name = 'reportMonth';
                                    monthInput.value = month;

                                    form.appendChild(monthInput);
                                    document.body.appendChild(form);
                                    form.submit();
                                }

                                // Initialize chart on page load
                                document.addEventListener('DOMContentLoaded', function () {
                                    const ctx = document.getElementById('revenueChart').getContext('2d');
                                    const monthSelect = document.getElementById('reportMonth');
                                    const selectedMonth = monthSelect.options[monthSelect.selectedIndex].text;

                                    // Destroy existing chart if it exists
                                    if (revenueChart) {
                                        revenueChart.destroy();
                                    }

                                    revenueChart = new Chart(ctx, {
                                        type: 'bar',
                                        data: {
                                            labels: [<%= dates.toString()%>],
                                            datasets: [{
                                                    label: 'Daily Revenue (LKR)',
                                                    data: [<%= revenues.toString()%>],
                                                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                                                    borderColor: 'rgba(54, 162, 235, 1)',
                                                    borderWidth: 1
                                                }]
                                        },
                                        options: {
                                            responsive: true,
                                            maintainAspectRatio: false,
                                            scales: {
                                                y: {
                                                    beginAtZero: true,
                                                    title: {
                                                        display: true,
                                                        text: 'Revenue (LKR)'
                                                    },
                                                    ticks: {
                                                        callback: function (value) {
                                                            return new Intl.NumberFormat('en-LK', {
                                                                style: 'currency',
                                                                currency: 'LKR'
                                                            }).format(value);
                                                        }
                                                    }
                                                },
                                                x: {
                                                    title: {
                                                        display: true,
                                                        text: 'Days'
                                                    }
                                                }
                                            },
                                            plugins: {
                                                title: {
                                                    display: true,
                                                    text: 'Daily Revenue for ' + selectedMonth + ' <%= year%>',
                                                    font: {
                                                        size: 16
                                                    }
                                                },
                                                legend: {
                                                    position: 'top'
                                                },
                                                tooltip: {
                                                    callbacks: {
                                                        label: function (context) {
                                                            return 'Revenue: ' + new Intl.NumberFormat('en-LK', {
                                                                style: 'currency',
                                                                currency: 'LKR'
                                                            }).format(context.raw);
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    });
                                });
                            </script>

                            <style>
                                canvas {
                                    max-width: 100%;
                                    margin: 20px auto;
                                }

                                .month-picker-container {
                                    margin-bottom: 20px;
                                    display: flex;
                                    align-items: center;
                                    gap: 10px;
                                }

                                .custom-month-picker {
                                    padding: 8px;
                                    border-radius: 4px;
                                    border: 1px solid #ddd;
                                    font-size: 14px;
                                }

                                .month-label {
                                    font-weight: bold;
                                    font-size: 14px;
                                }

                                .month-search-button {
                                    padding: 8px 16px;
                                    background-color: #4CAF50;
                                    color: white;
                                    border: none;
                                    border-radius: 4px;
                                    cursor: pointer;
                                }

                                .month-search-button:hover {
                                    background-color: #45a049;
                                }

                                .chart-container {
                                    transition: opacity 0.3s ease;
                                }
                            </style>
                        </div>
                    </div>
                </div>




                <!--Top Performing Products-->
                <div id="Top Performing Products" class="report-slide">
                    <div class="month-picker-container">
                        <label for="topPerformMonth" class="month-label">Select the Month</label>
                        <select id="topPerformMonth" name="topPerformMonth" class="custom-month-picker">
                            <option value="" disabled selected>Select Month</option>
                            <option value="01" <%= "01".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>January</option>
                            <option value="02" <%= "02".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>February</option>
                            <option value="03" <%= "03".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>March</option>
                            <option value="04" <%= "04".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>April</option>
                            <option value="05" <%= "05".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>May</option>
                            <option value="06" <%= "06".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>June</option>
                            <option value="07" <%= "07".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>July</option>
                            <option value="08" <%= "08".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>August</option>
                            <option value="09" <%= "09".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>September</option>
                            <option value="10" <%= "10".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>October</option>
                            <option value="11" <%= "11".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>November</option>
                            <option value="12" <%= "12".equals(request.getParameter("topPerformMonth")) ? "selected" : ""%>>December</option>
                        </select>
                        <button type="button" class="month-search-button" onclick="updateTopProducts()">Search</button>
                    </div>
                    <div class="header-container">
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:220px">Description</span>
                        <div class="header-top" style="margin-left:680px">Revenue</div>
                        <div class="header-top" style="margin-left:910px">Units Sold</div>
                    </div>
                    <div class="content-container" style="margin-top:175px; height: 70%">
                        <%
                            String selectedTopMonth = request.getParameter("topPerformMonth");
                            if (selectedTopMonth == null) {
                        %>
                        <p style="text-align:center; margin-top:50px; color:gray;">Please select a month to view the data.</p>
                        <%
                        } else {
                            String topquery = "SELECT p.ProductID, "
                                    + "p.ProductName, "
                                    + "SUM(tl.QuantitySold) AS UnitsSold, "
                                    + "SUM(tl.LineTotal) AS Revenue "
                                    + "FROM Products p "
                                    + "INNER JOIN TransactionLine tl ON p.ProductID = tl.StockID "
                                    + "INNER JOIN TransactionHeader th ON tl.TransactionID = th.TransactionID "
                                    + "WHERE YEAR(th.TransactionDate) = ? "
                                    + "AND MONTH(th.TransactionDate) = ? "
                                    + "GROUP BY p.ProductID, p.ProductName "
                                    + "ORDER BY Revenue DESC;";
                            boolean hasData1 = false;

                            try (Connection conn = dbconn.getConnection(); PreparedStatement stmt = conn.prepareStatement(topquery)) {
                                stmt.setString(1, year);
                                stmt.setString(2, selectedTopMonth);

                                try (ResultSet rs = stmt.executeQuery()) {
                                    while (rs.next()) {
                                        hasData1 = true;
                        %>
                        <div class="pro-stock" data-status="in-stock">
                            <p class="pro-stock-id"><%= rs.getString("ProductID")%></p>
                            <p class="pro-stock-name"><%= rs.getString("ProductName")%></p>
                            <p class="pro-high-revenue">LKR <%= String.format("%.2f", rs.getDouble("Revenue"))%></p>
                            <p class="pro-high-unitsold"><%= rs.getInt("UnitsSold")%></p>
                        </div>
                        <%
                                }
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        %>
                        <p style="color:red;">Error retrieving top-performing products. Please try again later.</p>
                        <%
                            }
                            if (!hasData) {
                        %>
                        <p style="text-align:center; margin-top:50px; color:gray;">No values yet for the selected month.</p>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>





                <!--Low Performing Products-->
                <div id="Low Performing Products" class="report-slide ">
                    <div class="month-picker-container">
                        <label for="lowPerformMonth" class="month-label">Select the Month</label>
                        <select id="lowPerformMonth" name="lowPerformMonth" class="custom-month-picker">
                            <option value="" disabled selected>Select Month</option>
                            <option value="01" <%= "01".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>January</option>
                            <option value="02" <%= "02".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>February</option>
                            <option value="03" <%= "03".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>March</option>
                            <option value="04" <%= "04".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>April</option>
                            <option value="05" <%= "05".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>May</option>
                            <option value="06" <%= "06".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>June</option>
                            <option value="07" <%= "07".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>July</option>
                            <option value="08" <%= "08".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>August</option>
                            <option value="09" <%= "09".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>September</option>
                            <option value="10" <%= "10".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>October</option>
                            <option value="11" <%= "11".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>November</option>
                            <option value="12" <%= "12".equals(request.getParameter("lowPerformMonth")) ? "selected" : ""%>>December</option>
                        </select>
                        <button type="button" class="month-search-button" onclick="updateLowProducts()">Search</button>
                    </div>
                    <div class="header-container">
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:220px">Description</span>
                        <div class="header-top" style="margin-left:680px">Revenue</div>
                        <div class="header-top" style="margin-left:910px">Units Sold</div>
                    </div>
                    <div class="content-container" style="margin-top:175px;height: 70%">
                        <%
                            String selectedlowMonth = request.getParameter("lowPerformMonth");
                            if (selectedlowMonth == null) {
                        %>
                        <p style="text-align:center; margin-top:50px; color:gray;">Please select a month to view the data.</p>
                        <%
                        } else {
                            String lowquery = "SELECT p.ProductID, "
                                    + "p.ProductName, "
                                    + "SUM(tl.QuantitySold) AS UnitsSold, "
                                    + "SUM(tl.LineTotal) AS Revenue "
                                    + "FROM Products p "
                                    + "INNER JOIN TransactionLine tl ON p.ProductID = tl.StockID "
                                    + "INNER JOIN TransactionHeader th ON tl.TransactionID = th.TransactionID "
                                    + "WHERE YEAR(th.TransactionDate) = ? "
                                    + (selectedlowMonth != null ? "AND MONTH(th.TransactionDate) = ? " : "")
                                    + "GROUP BY p.ProductID, p.ProductName "
                                    + "ORDER BY Revenue ASC;";
                            boolean hasData2 = false;

                            try (Connection conn = dbconn.getConnection(); PreparedStatement stmt = conn.prepareStatement(lowquery)) {
                                stmt.setString(1, year);
                                stmt.setString(2, selectedlowMonth);

                                try (ResultSet rs = stmt.executeQuery()) {
                                    while (rs.next()) {
                                        hasData2 = true;
                        %>
                        <div class="pro-stock" data-status="in-stock">
                            <p class="pro-stock-id"><%= rs.getString("ProductID")%></p>
                            <p class="pro-stock-name"><%= rs.getString("ProductName")%></p>
                            <p class="pro-high-revenue">LKR <%= String.format("%.2f", rs.getDouble("Revenue"))%></p>
                            <p class="pro-high-unitsold"><%= rs.getInt("UnitsSold")%></p>
                        </div>
                        <%
                                }
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        %>
                        <p style="color:red;">Error retrieving low-performing products. Please try again later.</p>
                        <%
                            }
                            if (!hasData) {
                        %>
                        <p style="text-align:center; margin-top:50px; color:gray;">No values yet for the selected month.</p>
                        <%
                                }
                            }
                        %>
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

                    function updateTopProducts() {
                        const month = document.getElementById('topPerformMonth').value;
                        if (!month)
                            return;

                        const form = document.createElement('form');
                        form.method = 'GET';
                        form.action = '';

                        const monthInput = document.createElement('input');
                        monthInput.type = 'hidden';
                        monthInput.name = 'topPerformMonth';
                        monthInput.value = month;

                        form.appendChild(monthInput);
                        document.body.appendChild(form);
                        form.submit();
                    }

                    function updateLowProducts() {
                        const month = document.getElementById('lowPerformMonth').value;
                        if (!month)
                            return;

                        const form = document.createElement('form');
                        form.method = 'GET';
                        form.action = '';

                        const monthInput = document.createElement('input');
                        monthInput.type = 'hidden';
                        monthInput.name = 'lowPerformMonth';
                        monthInput.value = month;

                        form.appendChild(monthInput);
                        document.body.appendChild(form);
                        form.submit();
                    }
                </script>

                </body>
                </html>
