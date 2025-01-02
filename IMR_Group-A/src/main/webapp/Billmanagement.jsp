<%@ page import="java.util.List" %>
<%@ page import= "Model.BillManagementModels.BillSummary" %>
<%@ page import="Model.BillManagementModels.BillLine" %>
<%@ page import="Model.BillManagementModels.TransactionHeaderInfo" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bills</title>
        <link rel="stylesheet" href="StyleSheet8.css" />
    </head>
    <body>
        
        <div class="navigation">
            <div class="Logo"><img src="images/icons/logo.png"/></div>
            <div class="logoname"><a href="Dashboard.jsp">Smart <span style="color:#5F4AE7">POS</span></a></div>
            <ul class="nav-menu">
                <a href="">
                    <li class="nav-item">
                        <img src="images/icons/Dashboard-B.png" />
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
                    <li class="nav-item active">
                        <img src="images/icons/Bills-W.png"/>
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
            <form action="StockServlet" method="post" style="display:inline;">
                <input type="hidden" name="action" value="logout"/>
                <button class="logout" type="submit">
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
            Bill Management
        </div>
        
        <div class="middle-container">
            <div class="add-search-container">
                <h2 required style="margin-left: 40px;">Search Bill Details</h2>
                <form method="get" action="BillManagementServlet" class="form-group" style="margin-left:40px;">
                    <label for="Recieptnumber">Enter Receipt Number</label>
                    <input type="text" id="Recieptnumber" name="searchReceiptNumber" style="margin-left:50px;" />
                    <button class="search-button" type="submit">Search</button>
                </form>
                <%
                    Boolean noMatch = (Boolean) request.getAttribute("noMatch");
                    if (noMatch != null && noMatch) {
                %>
                <p style="color:red; margin-left:40px;">No matching IDs found.</p>
                <%
                    }
                %>
            </div>
            <div class="header-container" style="top:100px;">
                <span class="header-top" style="margin-left:20px">Receipt Number</span>
                <span class="header-top" style="margin-left:240px">No of Items</span>
                <div class="header-top" style="margin-left:410px">Date</div>
                <div class="header-top" style="margin-left:570px">Time</div>
                <div class="header-top" style="margin-left:720px">Total amount</div>
                <div class="header-top" style="margin-left:920px">Action</div>                  
            </div>
            <div class="content-container" style="margin-top:80px;">
                <%
                    BillSummary singleTx = (BillSummary) request.getAttribute("singleTransaction");
                    List<BillSummary> allTx = (List<BillSummary>) request.getAttribute("allTransactions");
                    if (singleTx != null) {
                        out.println(displayTransactionRow(singleTx));
                    } else if (allTx != null) {
                        for (BillSummary bs : allTx) {
                            out.println(displayTransactionRow(bs));
                        }
                    }
                %>
            </div>
        </div>
        
        <div id="receiptModal" class="modal">
            <div class="modal-content">
                <img class="close-product-slider" src="images/icons/Cancelslide.png" onclick="closeReceiptModal()" />
                <div class="modal-body">
                    <div class="receipt-header">
                        <div class="rec-Logo" style="left:115px;"><img src="images/icons/logo.png"/></div>
                        <div class="rec-logoname" style="left:180px;">Smart <span style="color:#5F4AE7">POS</span></div>
                    </div>

                    <div class="bill-details">
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Bill No:&nbsp;&nbsp;</b></span>
                            <span class="detail-value" id="billNo">
                                <%
                                    TransactionHeaderInfo headerInfo = (TransactionHeaderInfo) request.getAttribute("headerInfo");
                                    if (headerInfo != null) {
                                        Object showModalObj = request.getAttribute("showModal");
                                        if (showModalObj != null) out.print(showModalObj.toString());
                                    }
                                %>
                            </span>
                        </div>
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Bill Date:&nbsp;&nbsp;</b></span>
                            <span class="detail-value" id="billDate">
                                <%
                                    if (headerInfo != null) {
                                        Timestamp ts = headerInfo.getTransactionDate();
                                        if (ts != null) {
                                            java.text.SimpleDateFormat sdfD = new java.text.SimpleDateFormat("yyyy-MM-dd");
                                            out.print(sdfD.format(ts));
                                        }
                                    }
                                %>
                            </span>
                        </div>
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Billed Time:&nbsp;&nbsp;</b></span>
                            <span class="detail-value" id="billedTime">
                                <%
                                    if (headerInfo != null) {
                                        Timestamp ts = headerInfo.getTransactionDate();
                                        if (ts != null) {
                                            java.text.SimpleDateFormat sdfT = new java.text.SimpleDateFormat("HH:mm:ss");
                                            out.print(sdfT.format(ts));
                                        }
                                    }
                                %>
                            </span>
                        </div>
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Cashier ID:&nbsp;</b></span>
                            <span class="detail-value" id="cashierId">
                                <%
                                    if (headerInfo != null) {
                                        out.print(headerInfo.getCashierID());
                                    }
                                %>
                            </span>
                        </div>
                    </div>

                    <div class="billDetails-header-container">
                        <span class="bill-header-top header-id">#</span>
                        <span class="bill-header-top header-description">Description</span>
                        <span class="bill-header-top header-qty">Qty</span>
                        <span class="bill-header-top header-unit-price">Unit Price</span>
                        <span class="bill-header-top header-subtotal">Sub Total</span>
                    </div>
                    <%
                        List<BillLine> lineItems = (List<BillLine>) request.getAttribute("lineItems");
                        if (lineItems != null) {
                            for (BillLine bl : lineItems) {
                    %>
                    <div class="item">
                        <p class="item-id"><%= bl.getStockID() %></p>
                        <p class="item-desc"><%= bl.getProductName() %></p>
                        <p class="item-qty"><%= bl.getQuantitySold() %></p>
                        <p class="item-price"><%= String.format("%.2f", bl.getUnitPrice()) %></p>
                        <p class="item-total"><%= String.format("%.2f", bl.getLineTotal()) %></p>
                    </div>
                    <%
                            }
                        }
                        Double receiptTotal = (Double) request.getAttribute("receiptTotal");
                        Double receiptDiscount = (Double) request.getAttribute("receiptDiscount");
                        Double receiptNet = (Double) request.getAttribute("receiptNet");
                    %>
                    <div class="bill-summary">
                        <p>
                            <b>Total:</b>
                            <span class="bill-summary-value" id="total-value">
                                <%= (receiptTotal != null) ? String.format("%.2f", receiptTotal) : "0.00" %>
                            </span>
                        </p>
                        <p>
                            <b>Discount:</b>
                            <span class="bill-summary-value" id="discount-value">
                                <%= (receiptDiscount != null) ? String.format("%.2f", receiptDiscount) : "0.00" %>
                            </span>
                        </p>
                        <p>
                            <b>Net Amount:</b>
                            <span class="bill-summary-value" id="net-amount-value" style="font-size: 18px; font-weight: bold;">
                                <%= (receiptNet != null) ? String.format("%.2f", receiptNet) : "0.00" %>
                            </span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const modal = document.getElementById("receiptModal");
            function closeReceiptModal() {
                modal.style.display = "none";
            }
            <% 
               Object showModalObj = request.getAttribute("showModal");
               if (showModalObj != null) {
            %>
            document.addEventListener("DOMContentLoaded", function() {
                modal.style.display = "block";
            });
            <% } %>
        </script>
        <%! 
            public String displayTransactionRow(BillSummary bs) {
                StringBuilder sb = new StringBuilder();
                java.sql.Timestamp ts = bs.getTransactionDate();
                String dateStr = "";
                String timeStr = "";
                if (ts != null) {
                    java.text.SimpleDateFormat sdfD = new java.text.SimpleDateFormat("yyyy-MM-dd");
                    java.text.SimpleDateFormat sdfT = new java.text.SimpleDateFormat("HH:mm:ss");
                    dateStr = sdfD.format(ts);
                    timeStr = sdfT.format(ts);
                }
                double totalNoDisc = bs.getTotalNoDiscount();
                double net = bs.getNetAmount();
                double disc = totalNoDisc - net;

                sb.append("<div class=\"Receipt\">");
                sb.append("<p class=\"Rec-no\">#").append(bs.getTransactionID()).append("</p>");
                sb.append("<p class=\"Rec-iteam\">").append(bs.getItemCount()).append("</p>");
                sb.append("<p class=\"Rec-date\">").append(dateStr).append("</p>");
                sb.append("<p class=\"Rec-time\">").append(timeStr).append("</p>");
                sb.append("<p class=\"Rec-totalamount\">").append(String.format("%.2f", net)).append("</p>");
                sb.append("<div class=\"Rec-action\">");
                sb.append("<form method=\"get\" action=\"BillManagementServlet\" style=\"display:inline;\">");
                sb.append("<input type=\"hidden\" name=\"viewTxID\" value=\"").append(bs.getTransactionID()).append("\"/>");
                sb.append("<button class=\"view\" style=\"background:none;border:none;\" type=\"submit\" title=\"View Receipt\">");
                sb.append("<i class=\"bi bi-eye-fill\"></i>");
                sb.append("</button>");
                sb.append("</form>");
                sb.append("</div>");
                sb.append("</div>");
                return sb.toString();
            }
        %>
    </body>
</html>
