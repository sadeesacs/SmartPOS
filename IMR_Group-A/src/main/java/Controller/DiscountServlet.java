package Controller;
import DAO.DiscountDAO;
import Model.Discount;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/DiscountServlet")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String errorMessage = null;
        String successMessage = null;

        try {
            int productCode = Integer.parseInt(request.getParameter("productCode"));
            double discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));

            if (productCode <= 0 || discountPercentage <= 0) {
                throw new IllegalArgumentException("Product Code and Discount Percentage must be greater than zero.");
            }

            Discount discount = new Discount();
            discount.setProductId(productCode);
            discount.setDiscountPercentage(discountPercentage);

            DiscountDAO discountDAO = new DiscountDAO();
            discountDAO.addDiscount(discount);
            successMessage = "Discount added successfully!";

        } catch (NumberFormatException e) {
            errorMessage = "Invalid input. Please ensure Product Code and Discount Percentage are valid numbers.";
        } catch (IllegalArgumentException e) {
            errorMessage = e.getMessage();
        } catch (SQLException e) {
            errorMessage = "Database error: " + e.getMessage();
        }

        // Set messages as request attributes
        request.setAttribute("successMessage", successMessage);
        request.setAttribute("errorMessage", errorMessage);

        // Forward to JSP to display messages
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            String discountIdStr = request.getParameter("discountId");
            if (discountIdStr != null) {
                try {
                    int discountId = Integer.parseInt(discountIdStr);
                    DiscountDAO discountDAO = new DiscountDAO();
                    discountDAO.deleteDiscount(discountId);
                    request.setAttribute("successMessage", "Discount deleted successfully!");
                } catch (SQLException e) {
                    request.setAttribute("errorMessage", "Database error: " + e.getMessage());
                } catch (NumberFormatException e) {
                    request.setAttribute("errorMessage", "Invalid discount ID.");
                }
            }
        }

        DiscountDAO discountDAO = new DiscountDAO();
        List<Discount> discountList = discountDAO.getAllDiscounts();  
        request.setAttribute("discounts", discountList);  
        request.getRequestDispatcher("Discounts.jsp").forward(request, response);
    }
}
