<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.ReportModels.DailyStockItem"%>
<%@page import="Model.ReportModels.MonthlyRevenueItem"%>
<%@page import="Model.ReportModels.ProductPerformance"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reports</title>
        <link rel="stylesheet" href="StyleSheet6.css"/>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        
        <!-- Navigational Panel -->
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png" /></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>
            
            <%
                String role = (String) request.getAttribute("currentRole");
                if (role == null) role = "Unknown";
            %>
            
            <ul class="nav-menu">
                <a <%= "Cashier".equalsIgnoreCase(role) ? "" : "href='DashboardServlet'" %>>
                    <li class="nav-item">
                        <img src="images/icons/Dashboard-B.png" />
                        <span>Dashboard</span>
                    </li>
                </a>
                <a href="POSServlet">
                    <li class="nav-item">
                        <img src="images/icons/POS-B.png" />
                        <span>POS</span>
                    </li>
                </a>
                <a href="ProductCatalogServlet">
                    <li class="nav-item">
                        <img src="images/icons/Products-B.png" />
                        <span>Products</span>
                    </li>
                </a>
                <a <%= "Cashier".equalsIgnoreCase(role) ? "" : "href='StockServlet'" %>>
                    <li class="nav-item">
                        <img src="images/icons/Stock-B.png" />
                        <span>Stock</span>
                    </li>
                </a>
                <a href="DiscountServlet">
                    <li class="nav-item">
                        <img src="images/icons/Discount-B.png" />
                        <span>Discounts</span>
                    </li>
                </a>
                <a href="BillManagementServlet">
                    <li class="nav-item">
                        <img src="images/icons/Bills-B.png" />
                        <span>Bills</span>
                    </li>
                </a>
                <a href="CustomersServlet">
                    <li class="nav-item">
                        <img src="images/icons/Customers-B.png" />
                        <span>Customers</span>
                    </li>
                </a>
                <a <%= "Cashier".equalsIgnoreCase(role) ? "" : "href='ReportsServlet'" %>>
                    <li class="nav-item active">
                        <img src="images/icons/Reports-W.png" />
                        <span>Reports</span>
                    </li>
                </a>
                <a href="SystemUsersServlet">
                    <li class="nav-item ">
                        <img src="images/icons/Admin-B.png"></img>
                        <span>Users</span>
                    </li>
                </a>
            </ul>
            <form action="ProductCatalogServlet" method="post" style="display:inline;">
                <input type="hidden" name="action" value="logout"/>
                <button class="logout" type="submit">
                    <img src="images/icons/Logout.png"/>
                    <span>Logout</span>
                </button>
            </form>
        </div>
        
        <!--Notification Icon-->
        <div class="notfication-icon">
            <img src="images/icons/notify-icon.png">
        </div>

        <!--User Profile View-->
        <div class="user-profile">
            <div class="user-avatar">
                <img src="images/icons/usericon.png">
            </div>
            <div class="user-info">
                <%
                    String currentRole = (String) request.getAttribute("currentRole");
                    String fullname = (String) request.getAttribute("fullname");
                %>
                <span class="user-name"><%= fullname %></span>
                <span class="user-role"><%= currentRole %></span>
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
                    <form id="stockReportForm" method="GET" action="ReportsServlet">
                        <div class="date-picker-container">
                            <label for="reportDate" class="date-label">Select the Date</label>
                            <input type="date" id="reportDate" name="reportDate" class="custom-date-picker"
                                   value="<%= request.getAttribute("reportDate") != null ? request.getAttribute("reportDate") : "" %>">
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

                    <div class="content-container" style="margin-top:150px; height:70%;">
                        <%
                            List<DailyStockItem> dailyStockList = (List<DailyStockItem>) request.getAttribute("dailyStockList");
                            boolean hasData = false;
                            if (dailyStockList != null && !dailyStockList.isEmpty()) {
                                hasData = true;
                                for (DailyStockItem item : dailyStockList) {
                        %>
                        <div class="pro-stock" data-status="<%= item.getStockStatus().toLowerCase().replace(" ", "-") %>">
                            <p class="pro-stock-id"><%= item.getProductID() %></p>
                            <p class="pro-stock-name"><%= item.getProductName() %></p>
                            <p class="pro-stock-quantity"><%= item.getStockQuantity() %></p>
                            <p class="pro-stock-sold"><%= item.getQuantitySold() %></p>
                            <p class="pro-stock-status"><%= item.getStockStatus() %></p>
                        </div>
                        <%
                                }
                            }
                            if (!hasData) {
                        %>
                        <p style="text-align:center; margin-top:50px; color:gray;">No values for the selected date.</p>
                        <%
                            }
                        %>
                    </div>
                </div>

                <!--Monthly Revenue Report-->
                <div id="Monthly Revenue Report" class="report-slide">
                    <%
                        String reportMonth = (String) request.getAttribute("reportMonth");
                        String year = (String) request.getAttribute("year");
                        if (reportMonth == null) reportMonth = "01";
                        if (year == null) year = "2025";
                        List<MonthlyRevenueItem> monthlyRevenueData = (List<MonthlyRevenueItem>) request.getAttribute("monthlyRevenueData");
                    %>
                    <div class="month-picker-container">
                        <label for="reportMonth" class="month-label">Select the Month</label>
                        <form method="GET" action="ReportsServlet" style="display:inline;">
                            <select id="reportMonth" name="reportMonth" class="custom-month-picker">
                                <option value="" disabled>Select Month</option>
                                <%
                                    String[] months = {"January","February","March","April","May","June",
                                        "July","August","September","October","November","December"};
                                    for (int i = 0; i < months.length; i++) {
                                        String value = String.format("%02d", i+1);
                                        String selected = (value.equals(reportMonth)) ? "selected" : "";
                                        out.println(String.format("<option value='%s' %s>%s</option>", value, selected, months[i]));
                                    }
                                %>
                            </select>
                            <button type="submit" class="month-search-button">Search</button>
                        </form>
                    </div>
                    <div class="chart-container">
                        <h2>Monthly Revenue</h2>
                        <div id="chart-content">
                            <%
                                StringBuilder labels = new StringBuilder("labels: [");
                                StringBuilder data   = new StringBuilder("data: [");
                                double totalRevenue = 0.0;
                                boolean first = true;
                                if (monthlyRevenueData != null) {
                                    for (MonthlyRevenueItem mri : monthlyRevenueData) {
                                        if (!first) {
                                            labels.append(",");
                                            data.append(",");
                                        }
                                        labels.append("'Day ").append(mri.getDay()).append("'");
                                        data.append(String.format("%.2f", mri.getTotalRevenue()));
                                        totalRevenue += mri.getTotalRevenue();
                                        first = false;
                                    }
                                }
                                labels.append("]");
                                data.append("]");

                                String chartData = "const chartData = { " + labels + "," + data + "};";
                            %>
                            <div style="width:100%; height:400px;">
                                <canvas id="revenueChart"></canvas>
                            </div>
                            <script>
                                let revenueChart = null;
                                <%= chartData %>
                                function initializeChart() {
                                    const ctx = document.getElementById('revenueChart').getContext('2d');
                                    const monthNames = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                                    const selectedMonthIndex = parseInt("<%= reportMonth %>") - 1;
                                    const selectedMonth = monthNames[selectedMonthIndex] || "January";
                                    const totalRevenue = chartData.data.reduce((acc, curr) => acc + parseFloat(curr), 0);
                                    const formattedTotalRevenue = new Intl.NumberFormat('en-LK', {
                                        style: 'currency',
                                        currency: 'LKR'
                                    }).format(totalRevenue);

                                    if (revenueChart) {
                                        revenueChart.destroy();
                                    }
                                    revenueChart = new Chart(ctx, {
                                        type: 'bar',
                                        data: {
                                            labels: chartData.labels,
                                            datasets: [{
                                                label: 'Daily Revenue (LKR)',
                                                data: chartData.data,
                                                backgroundColor: 'rgba(54,162,235,0.5)',
                                                borderColor: 'rgba(54,162,235,1)',
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
                                                        callback: function(value) {
                                                            return 'LKR ' + value.toLocaleString();
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
                                                    text: [
                                                        'Daily Revenue for ' + selectedMonth + ' <%= year %>',
                                                        'Total Monthly Revenue: ' + formattedTotalRevenue
                                                    ],
                                                    font: {
                                                        size: 16
                                                    },
                                                    padding: {
                                                        bottom: 20
                                                    }
                                                }
                                            }
                                        }
                                    });
                                }
                                document.addEventListener('DOMContentLoaded', initializeChart);
                            </script>
                        </div>
                    </div>
                </div>

                <!--Top Performing Products-->
                <div id="Top Performing Products" class="report-slide">
                    <%
                        String topPerformMonth = (String) request.getAttribute("topPerformMonth");
                        if (topPerformMonth == null) topPerformMonth = "01";
                        List<ProductPerformance> topPerformingList = (List<ProductPerformance>) request.getAttribute("topPerformingList");
                    %>
                    <div class="month-picker-container">
                        <label for="topPerformMonth" class="month-label">Select the Month</label>
                        <form method="GET" action="ReportsServlet" style="display:inline;">
                            <select id="topPerformMonth" name="topPerformMonth" class="custom-month-picker">
                                <%
                                    for (int i=0; i<months.length; i++) {
                                        String val = String.format("%02d", i+1);
                                        String sel = val.equals(topPerformMonth) ? "selected" : "";
                                        out.println("<option value='"+val+"' "+sel+">"+months[i]+"</option>");
                                    }
                                %>
                            </select>
                            <button type="submit" class="month-search-button">Search</button>
                        </form>
                    </div>
                    <div class="header-container">
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:220px">Description</span>
                        <div class="header-top" style="margin-left:680px">Revenue</div>
                        <div class="header-top" style="margin-left:910px">Units Sold</div>
                    </div>
                    <div class="content-container" style="margin-top:175px; height:70%;">
                        <%
                            boolean hasData1 = false;
                            if (topPerformingList != null && !topPerformingList.isEmpty()) {
                                hasData1 = true;
                                for (ProductPerformance pp : topPerformingList) {
                        %>
                        <div class="pro-stock" data-status="in-stock">
                            <p class="pro-stock-id"><%= pp.getProductID() %></p>
                            <p class="pro-stock-name"><%= pp.getProductName() %></p>
                            <p class="pro-high-revenue">LKR <%= String.format("%.2f", pp.getRevenue()) %></p>
                            <p class="pro-high-unitsold"><%= pp.getUnitsSold() %></p>
                        </div>
                        <%
                                }
                            }
                            if (!hasData1) {
                        %>
                        <p style="text-align:center; margin-top:50px; color:gray;">No values yet for the selected month.</p>
                        <%
                            }
                        %>
                    </div>
                </div>

                <!--Low Performing Products-->
                <div id="Low Performing Products" class="report-slide">
                    <%
                        String lowPerformMonth = (String) request.getAttribute("lowPerformMonth");
                        if (lowPerformMonth == null) lowPerformMonth = "01";
                        List<ProductPerformance> lowPerformingList = (List<ProductPerformance>) request.getAttribute("lowPerformingList");
                    %>
                    <div class="month-picker-container">
                        <label for="lowPerformMonth" class="month-label">Select the Month</label>
                        <form method="GET" action="ReportsServlet" style="display:inline;">
                            <select id="lowPerformMonth" name="lowPerformMonth" class="custom-month-picker">
                                <%
                                    for (int i=0; i<months.length; i++) {
                                        String val = String.format("%02d", i+1);
                                        String sel = val.equals(lowPerformMonth) ? "selected" : "";
                                        out.println("<option value='"+val+"' "+sel+">"+months[i]+"</option>");
                                    }
                                %>
                            </select>
                            <button type="submit" class="month-search-button">Search</button>
                        </form>
                    </div>
                    <div class="header-container">
                        <span class="header-top" style="margin-left:20px">Product ID</span>
                        <span class="header-top" style="margin-left:220px">Description</span>
                        <div class="header-top" style="margin-left:680px">Revenue</div>
                        <div class="header-top" style="margin-left:910px">Units Sold</div>
                    </div>
                    <div class="content-container" style="margin-top:175px;height:70%;">
                        <%
                            boolean hasData2 = false;
                            if (lowPerformingList != null && !lowPerformingList.isEmpty()) {
                                hasData2 = true;
                                for (ProductPerformance pp : lowPerformingList) {
                        %>
                        <div class="pro-stock" data-status="in-stock">
                            <p class="pro-stock-id"><%= pp.getProductID() %></p>
                            <p class="pro-stock-name"><%= pp.getProductName() %></p>
                            <p class="pro-high-revenue">LKR <%= String.format("%.2f", pp.getRevenue()) %></p>
                            <p class="pro-high-unitsold"><%= pp.getUnitsSold() %></p>
                        </div>
                        <%
                                }
                            }
                            if (!hasData2) {
                        %>
                        <p style="text-align:center; margin-top:50px; color:gray;">No values yet for the selected month.</p>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const navButtons = document.querySelectorAll(".report-nav button");
                const slides = document.querySelectorAll(".report-slide");

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

                const stockCards = document.querySelectorAll(".pro-stock");
                stockCards.forEach((card) => {
                    const statusElem = card.querySelector(".pro-stock-status");
                    if (statusElem) {
                        const status = statusElem.textContent.toLowerCase().replace(" ", "-");
                        if (status === "in-stock") {
                            statusElem.classList.add("in-stock");
                        } else if (status === "out-of-stock") {
                            statusElem.classList.add("out-of-stock");
                        } else if (status === "low-stock") {
                            statusElem.classList.add("low-stock");
                        }
                    }
                });
            });
        </script>
    </body>
</html>
