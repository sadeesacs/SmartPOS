package Controller;

import DAO.UserDAO;
import Model.User;
import util.PasswordUtil;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    private UserDAO userDAO = new UserDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Read form parameters
        String username = request.getParameter("username"); // FullName
        String password = request.getParameter("password"); // Plain text

        // Hash the entered password (SHA-512)
        String hashedPassword = PasswordUtil.hashPasswordSHA512(password);

        // Attempt to authenticate
        User user = userDAO.authenticateUser(username, hashedPassword);

        if (user == null) {
            // Authentication failed
            request.setAttribute("loginError", "Invalid username or password");
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("userID", user.getUserID());

            String role = user.getRole();
            //Cashier
            if ("Cashier".equalsIgnoreCase(role)) {
                response.sendRedirect("POSServlet");
            } else {
                // Manager or Admin => Dashboard
                response.sendRedirect("DashboardServlet");
            }
        }
    }
}
