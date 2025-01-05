<%@ page import="java.util.List" %>
<%@ page import="Controller.POSServlet.POSItem" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>POS</title>
        <link rel="stylesheet" href="StyleSheet1.css" />
    </head>
    <body>

        <!-- Navigation Panel-->
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
                    <li class="nav-item active">
                        <img src="images/icons/POS-W.png"/>
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

            <!-- Logout form -->
            <form action="POSServlet" method="post" style="display:inline;">
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

        <!--Main Header-->
        <div class="main-header">
            Point of Sale
        </div>

        <!-- Middle Container -->
        <div class="middle-container">
            <div class="POS-display-container">
                <div class="header-container">
                    <span class="header-top" style="margin-left:10px">#</span>
                    <span class="header-top" style="margin-left:85px">Description</span>
                    <div class="header-top" style="margin-left:340px">Qty</div>
                    <div class="header-top" style="margin-left:415px">Unit Price</div>
                    <div class="header-top" style="margin-left:510px">Discount</div>
                    <div class="header-top" style="margin-left:600px">Sub Total</div>
                </div>
                <div class="content-container">
                    <%
                        // Retrieve cart from request
                        List<POSItem> cart = (List<POSItem>) request.getAttribute("cartItems");
                        if (cart != null) {
                            for (POSItem item : cart) {
                                double lineTotal = item.lineTotal; 
                    %>
                    <div class="product">
                        <p class="pro-c"><%= item.stockID %></p>
                        <p class="pro-desc"><%= item.productName %></p>
                        <p class="pro-qty"><%= item.quantity %></p>
                        <p class="pro-price"><%= String.format("%.2f", item.price) %></p>
                        <p class="pro-discount"><%= String.format("%.2f", item.discountPct) %></p>
                        <p class="pro-total"><%= String.format("%.2f", lineTotal) %></p>

                        <form method="post" action="POSServlet" style="display:inline;">
                            <input type="hidden" name="action" value="removeItem"/>
                            <input type="hidden" name="stockID" value="<%= item.stockID %>"/>
                            <button class="delete-button" type="submit">X</button>
                        </form>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>

            <div class="POS-input-container">
                <div class="product-entry">
                    <!-- Enter Product Form -->
                    <form method="post" action="POSServlet">
                        <input type="hidden" name="action" value="enterProduct"/>
                        <label for="product-code" class="entry-label">Product Code</label>
                        <input type="text" id="product-code" name="product-code" class="entry-input"/>
                        <label for="product-quantity" class="entry-label" >Product Quantity</label>
                        <input type="number" id="id="product-quantity-label"" name="product-quantity" class="entry-input" />
                        <button class="entry-button" type="submit">Enter Product</button>
                    </form>
                    
                    <div class="price-summary">
                        <%
                            Double cartTotalObj = (Double) request.getAttribute("cartTotal");
                            Double cartDiscObj  = (Double) request.getAttribute("cartDiscount");
                            Double cartNetObj   = (Double) request.getAttribute("cartNet");
                            double cartTotal = (cartTotalObj != null) ? cartTotalObj : 0.0;
                            double cartDisc  = (cartDiscObj != null)  ? cartDiscObj : 0.0;
                            double cartNet   = (cartNetObj != null)   ? cartNetObj  : 0.0;
                        %>
                        <p>
                            <span>Total</span> 
                            <span class="summary-value"><%= String.format("%.2f", cartTotal) %></span>
                        </p>
                        <p>
                            <span>Discount</span> 
                            <span class="summary-value"><%= String.format("%.2f", cartDisc) %></span>
                        </p>
                        <p>
                            <span class="net-label">Net Amount</span> 
                            <span class="net-value"><%= String.format("%.2f", cartNet) %></span>
                        </p>
                    </div>

                    <!-- Print Bill -->
                    <form method="post" action="POSServlet" style="display:inline;">
                        <input type="hidden" name="action" value="printBill"/>
                        <button class="action-button print-button" type="submit">Print Bill</button>
                    </form>
                    <!-- Clear Cart -->
                    <form method="post" action="POSServlet" style="display:inline;">
                        <input type="hidden" name="action" value="clearCart"/>
                        <button class="action-button clear-button" type="submit">Clear Cart</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Receipt Modal -->
        <div id="receiptModal" class="modal">
            <div class="modal-content">
                <img class="close-product-slider" src="images/icons/Cancelslide.png" onclick="closeReceiptModal()"/>

                <div class="modal-body">
                    <div class="receipt-header">
                        <div class="rec-Logo" style="left:115px;"><img src="images/icons/logo.png"/></div>
                        <div class="rec-logoname" style="left:180px;">Smart <span style="color:#5F4AE7">POS</span></div>
                    </div>

                    <!-- Bill Details -->
                    <div class="bill-details">
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Bill No:&nbsp;&nbsp;</b></span>
                            <span class="detail-value" id="billNo">
                                <%
                                    Integer recTxID = (Integer) request.getAttribute("receiptTransactionID");
                                    if (recTxID != null) out.print(recTxID);
                                %>
                            </span>
                        </div>
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Bill Date:&nbsp;&nbsp;</b></span>
                            <span class="detail-value" id="billDate">
                                <%
                                    java.text.SimpleDateFormat sdfD = new java.text.SimpleDateFormat("yyyy-MM-dd");
                                    out.print(sdfD.format(new java.util.Date()));
                                %>
                            </span>
                        </div>
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Billed Time:&nbsp;&nbsp;</b></span>
                            <span class="detail-value" id="billedTime">
                                <%
                                    java.text.SimpleDateFormat sdfT = new java.text.SimpleDateFormat("HH:mm:ss");
                                    out.print(sdfT.format(new java.util.Date()));
                                %>
                            </span>
                        </div>
                        <div class="bill-detail-row">
                            <span class="detail-label"><b>Cashier ID:&nbsp;</b></span>
                            <span class="detail-value" id="cashierId">
                                <%
                                    out.print(session.getAttribute("userID"));
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

                    <div id="receiptItems">
                        <%
                            List<POSItem> receiptLines = (List<POSItem>) request.getAttribute("receiptLines");
                            if (receiptLines != null) {
                                for (POSItem rLine : receiptLines) {
                                    double lineT = rLine.lineTotal;
                        %>
                        <div class="item">
                            <p class="item-id"><%= rLine.stockID %></p>
                            <p class="item-desc"><%= rLine.productName %></p>
                            <p class="item-qty"><%= rLine.quantity %></p>
                            <p class="item-price"><%= String.format("%.2f", rLine.price) %></p>
                            <p class="item-total"><%= String.format("%.2f", lineT) %></p>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>

                    <!-- Bill Summary in the receipt -->
                    <div class="bill-summary">
                        <p>
                            <b>Total:</b>
                            <span class="bill-summary-value" id="total-value">
                                <%
                                    Double rTot = (Double) request.getAttribute("receiptTotal");
                                    if (rTot != null) out.print(String.format("%.2f", rTot));
                                %>
                            </span>
                        </p>
                        <p>
                            <b>Discount:</b>
                            <span class="bill-summary-value" id="discount-value">
                                <%
                                    Double rDis = (Double) request.getAttribute("receiptDiscount");
                                    if (rDis != null) out.print(String.format("%.2f", rDis));
                                %>
                            </span>
                        </p>
                        <p>
                            <b>Net Amount:</b>
                            <span class="bill-summary-value" id="net-amount-value" style="font-size: 18px; font-weight: bold;">
                                <%
                                    Double rNet = (Double) request.getAttribute("receiptNet");
                                    if (rNet != null) out.print(String.format("%.2f", rNet));
                                %>
                            </span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const modal = document.getElementById("receiptModal");

            function openReceiptModal() {
                modal.style.display = "block";
            }

            function closeReceiptModal() {
                modal.style.display = "none";
            }

            window.onclick = function(event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };

            <% 
               String showReceipt = request.getParameter("showReceipt");
               if ("true".equalsIgnoreCase(showReceipt)) {
            %>
            document.addEventListener("DOMContentLoaded", function() {
                modal.style.display = "block";
            });
            <% } %>
        </script>
    </body>
</html>
