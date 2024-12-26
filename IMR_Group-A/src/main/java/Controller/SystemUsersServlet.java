package Controller;

import DAO.UserDAO;
import Model.User;
import util.PasswordUtil;

import java.util.Collections;
import java.util.List;

import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "SystemUsersServlet", urlPatterns = {"/SystemUsersServlet"})
public class SystemUsersServlet extends HttpServlet {
    
    private UserDAO userDAO = new UserDAO();

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            // If no session, redirect to Login page (or an error page)
            response.sendRedirect("Login.jsp");
            return;
        }

        int currentUserID = (int) session.getAttribute("userID");
        String currentRole = userDAO.getUserRoleByID(currentUserID);

        List<User> userList = null;
        if ("Admin".equalsIgnoreCase(currentRole)) {
            // Admin sees everyone
            userList = userDAO.getAllUsers();
        } else if ("Manager".equalsIgnoreCase(currentRole)) {
            // Manager sees themselves + all Cashiers
            userList = userDAO.getManagerView(currentUserID);
        } else if ("Cashier".equalsIgnoreCase(currentRole)) {
            // Cashier sees only themselves
            User cashier = userDAO.getCashierView(currentUserID);
            if (cashier != null) {
                userList = Collections.singletonList(cashier);
            }
        }

        request.setAttribute("userList", userList);
        request.setAttribute("currentRole", currentRole);
        request.setAttribute("currentUserID", currentUserID);

        // Forward to JSP
        request.getRequestDispatcher("SystemUsers.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int currentUserID = (int) session.getAttribute("userID");
        String currentRole = userDAO.getUserRoleByID(currentUserID);

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            // Only Manager or Admin can add users
            if ("Manager".equalsIgnoreCase(currentRole) || "Admin".equalsIgnoreCase(currentRole)) {
                String fullName = request.getParameter("fullName");
                String nic      = request.getParameter("nic");
                String role     = request.getParameter("role");
                String pwd      = request.getParameter("password");
                String rePwd    = request.getParameter("repassword");

                if (pwd != null && pwd.equals(rePwd)) {
                    String hashedPwd = PasswordUtil.hashPasswordSHA512(pwd);
                    userDAO.addUser(fullName, nic, role, hashedPwd);
                }
            }

        } else if ("update".equalsIgnoreCase(action)) {
            // Update user details (FullName, NIC, Role)
            int userID = Integer.parseInt(request.getParameter("userID"));
            User targetUser = userDAO.getUserByID(userID);

            if (targetUser != null) {
                if (canEditUser(currentRole, currentUserID, targetUser)) {
                    String fullName = request.getParameter("fullName");
                    String nic      = request.getParameter("nic");
                    String role     = request.getParameter("role");
                    userDAO.updateUser(userID, fullName, nic, role);
                }
            }

        } else if ("delete".equalsIgnoreCase(action)) {
            // Delete a user
            int userID = Integer.parseInt(request.getParameter("userID"));
            User targetUser = userDAO.getUserByID(userID);
            if (targetUser != null) {
                if (canDeleteUser(currentRole, currentUserID, targetUser)) {
                    userDAO.deleteUser(userID);
                }
            }

        } else if ("changePassword".equalsIgnoreCase(action)) {
            // The user can change their own password
            int userID = Integer.parseInt(request.getParameter("userID"));
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");

            if (userID == currentUserID) {
                String oldHashed = PasswordUtil.hashPasswordSHA512(oldPassword);
                String newHashed = PasswordUtil.hashPasswordSHA512(newPassword);
                userDAO.changePassword(userID, oldHashed, newHashed);
            }
        }

        // Refresh the list
        response.sendRedirect("SystemUsersServlet");
    }
    
    private boolean canEditUser(String currentRole, int currentUserID, User targetUser) {
        String targetRole = targetUser.getRole();
        int targetID = targetUser.getUserID();

        if ("Admin".equalsIgnoreCase(currentRole)) {
            return true; // Admin can edit everyone
        } else if ("Manager".equalsIgnoreCase(currentRole)) {
            // Manager can edit themselves + any Cashier
            if (targetID == currentUserID) return true;
            if ("Cashier".equalsIgnoreCase(targetRole)) return true;
        } else if ("Cashier".equalsIgnoreCase(currentRole)) {
            // Cashier can only edit themselves (really only the password in your specs)
            if (targetID == currentUserID) return true;
        }
        return false;
    }

    /**
     * Determines if the current user can delete the target user.
     */
    private boolean canDeleteUser(String currentRole, int currentUserID, User targetUser) {
        String targetRole = targetUser.getRole();

        if ("Admin".equalsIgnoreCase(currentRole)) {
            // Admin can delete anyone, including themselves
            return true;
        } else if ("Manager".equalsIgnoreCase(currentRole)) {
            // Manager can delete only Cashiers, not themselves or other managers/admins
            return "Cashier".equalsIgnoreCase(targetRole);
        }
        // Cashiers cannot delete anyone
        return false;
    }
}
