package Controller;

import DAO.BillManagementDAO;
import Model.BillManagementModels.BillSummary;
import Model.BillManagementModels.BillLine;
import Model.BillManagementModels.TransactionHeaderInfo;
import DAO.UserDAO;
import Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "BillManagementServlet", urlPatterns = {"/BillManagementServlet"})
public class BillManagementServlet extends HttpServlet {
    
    private BillManagementDAO billDAO = new BillManagementDAO();
    private UserDAO userDAO = new UserDAO();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int userID = (int) session.getAttribute("userID");
        User currentUser = userDAO.getUserByID(userID);
        String currentRole = (currentUser != null) ? currentUser.getRole() : "UnknownRole";
        String fullName = (currentUser != null) ? currentUser.getFullName() : "UnknownUser";

        request.setAttribute("currentRole", currentRole);
        request.setAttribute("fullname", fullName);

        String searchID = request.getParameter("searchReceiptNumber");
        if (searchID != null && !searchID.isEmpty()) {
            try {
                int txID = Integer.parseInt(searchID);
                BillSummary bs = billDAO.getTransactionByID(txID);
                if (bs == null) {
                    request.setAttribute("noMatch", true);
                } else {
                    request.setAttribute("singleTransaction", bs);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("noMatch", true);
            }
        } else {
            List<BillSummary> allTx = billDAO.getAllTransactions();
            request.setAttribute("allTransactions", allTx);
        }

        String viewTxID = request.getParameter("viewTxID");
        if (viewTxID != null && !viewTxID.isEmpty()) {
            try {
                int txID = Integer.parseInt(viewTxID);
                TransactionHeaderInfo header = billDAO.getTransactionHeader(txID);
                List<BillLine> lines = billDAO.getTransactionLines(txID);
                
                double totalNoDiscount = 0.0;
                double totalLineTotal = 0.0;
                for (BillLine bl : lines) {
                    double base;
                    if (bl.isWeighted()) {
                        base = (bl.getQuantitySold() / 100.0) * bl.getUnitPrice();
                    } else {
                        base = bl.getQuantitySold() * bl.getUnitPrice();
                    }
                    totalNoDiscount += base;
                    totalLineTotal += bl.getLineTotal();
                }
                double discount = totalNoDiscount - totalLineTotal;

                request.setAttribute("headerInfo", header);
                request.setAttribute("lineItems", lines);
                request.setAttribute("receiptTotal", totalNoDiscount);
                request.setAttribute("receiptDiscount", discount);
                request.setAttribute("receiptNet", totalLineTotal);
                request.setAttribute("showModal", txID);
            } catch (NumberFormatException e) {
            }
        }

        request.getRequestDispatcher("Billmanagement.jsp").forward(request, response);
    }
}
