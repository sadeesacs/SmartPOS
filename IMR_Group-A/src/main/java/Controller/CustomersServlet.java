package Controller;

import DAO.CustomersDAO;
import Model.Customers;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/CustomerServlet"})
public class CustomersServlet extends HttpServlet {
    private CustomersDAO customerDAO = new CustomersDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        boolean success = false;

        try {
            if ("add".equalsIgnoreCase(action)) {
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String nic = request.getParameter("nic");

                Customers customer = new Customers();
                customer.setFirstName(firstName);
                customer.setLastName(lastName);
                customer.setEmail(email);
                customer.setPhone(phone);
                customer.setNic(nic);

                success = customerDAO.addCustomer(customer);
            } 
            else if ("delete".equalsIgnoreCase(action)) {
                int customerId = Integer.parseInt(request.getParameter("customerId"));
                success = customerDAO.deleteCustomer(customerId);
            } 
            else if ("edit".equalsIgnoreCase(action)) {
                int customerId = Integer.parseInt(request.getParameter("customerId"));
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String nic = request.getParameter("nic");

                Customers customer = new Customers();
                customer.setId(customerId);
                customer.setFirstName(firstName);
                customer.setLastName(lastName);
                customer.setEmail(email);
                customer.setPhone(phone);
                customer.setNic(nic);

                success = customerDAO.updateCustomer(customer);
            }

            if (success) {
                response.sendRedirect("Customers.jsp");
            } else {
                response.sendRedirect("Customers.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Customers.jsp?error=true");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("getCustomer".equalsIgnoreCase(action)) {
            try {
                int customerId = Integer.parseInt(request.getParameter("id"));
                Customers customer = customerDAO.getCustomerById(customerId);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Create JSON response
                String jsonResponse = String.format(
                    "{\"id\": %d, \"firstName\": \"%s\", \"lastName\": \"%s\", \"email\": \"%s\", \"phone\": \"%s\", \"nic\": \"%s\"}",
                    customer.getId(),
                    customer.getFirstName(),
                    customer.getLastName(),
                    customer.getEmail(),
                    customer.getPhone(),
                    customer.getNic()
                );

                response.getWriter().write(jsonResponse);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid customer ID");
            }
        }
    }
}
