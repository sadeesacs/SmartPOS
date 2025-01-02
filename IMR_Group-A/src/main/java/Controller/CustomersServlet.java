package Controller;

import DAO.CustomerDAO;
import Model.Customer;
import DAO.UserDAO;
import Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomersServlet", urlPatterns = {"/CustomersServlet"})
public class CustomersServlet extends HttpServlet {

    private CustomerDAO customerDAO = new CustomerDAO();
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
        String currentRole = (currentUser != null) ? currentUser.getRole() : "Unknown";
        String fullName = (currentUser != null) ? currentUser.getFullName() : "UnknownUser";

        request.setAttribute("currentRole", currentRole);
        request.setAttribute("fullname", fullName);

        List<Customer> customerList = customerDAO.getAllCustomers();
        request.setAttribute("customerList", customerList);

        request.getRequestDispatcher("Customers.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int userID = (int) session.getAttribute("userID");
        User currentUser = userDAO.getUserByID(userID);
        String currentRole = (currentUser != null) ? currentUser.getRole() : "Unknown";

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("CustomersServlet");
            return;
        }

        if ("Cashier".equalsIgnoreCase(currentRole)) {
            if ("add".equalsIgnoreCase(action)) {
                handleAdd(request, response);
            } else {
                response.sendRedirect("CustomersServlet");
            }
        } else {
            switch (action.toLowerCase()) {
                case "add":
                    handleAdd(request, response);
                    break;
                case "update":
                    handleUpdate(request, response);
                    break;
                case "delete":
                    handleDelete(request, response);
                    break;
                default:
                    response.sendRedirect("CustomersServlet");
                    break;
            }
        }
    }
    
    private void handleAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fName  = request.getParameter("firstName");
        String lName  = request.getParameter("lastName");
        String nic    = request.getParameter("nic");
        String phone  = request.getParameter("phone");
        String email  = request.getParameter("email");

        Customer c = new Customer();
        c.setFirstName(fName);
        c.setLastName(lName);
        c.setNic(nic);
        c.setPhoneNumber(phone);
        c.setEmail(email);

        try {
            customerDAO.addCustomer(c);
        } catch (SQLException e) {
            request.setAttribute("errorMsg", "Error adding customer: " + e.getMessage());
        }
        response.sendRedirect("CustomersServlet");
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));

        String fName  = request.getParameter("firstName");
        String lName  = request.getParameter("lastName");
        String nic    = request.getParameter("nic");
        String phone  = request.getParameter("phone");
        String email  = request.getParameter("email");

        Customer c = new Customer();
        c.setCustomerID(customerID);
        c.setFirstName(fName);
        c.setLastName(lName);
        c.setNic(nic);
        c.setPhoneNumber(phone);
        c.setEmail(email);

        try {
            customerDAO.updateCustomer(c);
        } catch (SQLException e) {
            request.setAttribute("errorMsg", "Error updating customer: " + e.getMessage());
        }
        response.sendRedirect("CustomersServlet");
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        try {
            customerDAO.deleteCustomer(customerID);
        } catch (SQLException e) {
            request.setAttribute("errorMsg", "Error deleting customer: " + e.getMessage());
        }
        response.sendRedirect("CustomersServlet");
    }
}