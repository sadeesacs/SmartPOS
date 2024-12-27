package Controller;

import DAO.ProductDAO;
import DAO.UserDAO;
import Model.Product;

import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;
import java.util.List;
import jakarta.servlet.http.*;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

@MultipartConfig
@WebServlet(name = "ProductCatalogServlet", urlPatterns = {"/ProductCatalogServlet"})
public class ProductCatalogServlet extends HttpServlet {
    
    private ProductDAO productDAO = new ProductDAO();
    private UserDAO userDAO = new UserDAO(); 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int currentUserID = (int) session.getAttribute("userID");
        String currentRole = userDAO.getUserRoleByID(currentUserID);

        String fullName = "Unknown User";
        Model.User currentUser = userDAO.getUserByID(currentUserID);
        if (currentUser != null) {
            fullName = currentUser.getFullName();
        }

        List<Product> productList = productDAO.getAllProducts();

        request.setAttribute("currentRole", currentRole);
        request.setAttribute("fullname", fullName);
        request.setAttribute("productList", productList);

        request.getRequestDispatcher("ProductCatalog.jsp").forward(request, response);
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

        String action = request.getParameter("action");
        if ("logout".equalsIgnoreCase(action)) {
            session.invalidate();
            response.sendRedirect("Login.jsp");
            return;
        }

        if ("Cashier".equalsIgnoreCase(currentRole)) {
            response.sendRedirect("ProductCatalogServlet");
            return;
        }

        if (action != null) {
            switch (action.toLowerCase()) {
                case "add":
                    handleAddProduct(request, response);
                    break;
                case "update":
                    handleUpdateProduct(request, response);
                    break;
                case "delete":
                    handleDeleteProduct(request, response);
                    break;
            }
        }

        response.sendRedirect("ProductCatalogServlet");
    }
    
    private void handleAddProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productName = request.getParameter("customer-fname");
        String quantityStr = request.getParameter("customer-lname"); // "1" or "100g"
        String priceStr    = request.getParameter("phone-no");
        String category    = request.getParameter("productCategory");

        boolean isWeighted = "100g".equalsIgnoreCase(quantityStr);
        double priceVal = (priceStr != null && !priceStr.isEmpty()) ? Double.parseDouble(priceStr) : 0.0;

        double pricePerUnit  = 0.0;
        double pricePer100g  = 0.0;
        if (isWeighted) {
            pricePer100g = priceVal;
        } else {
            pricePerUnit = priceVal;
        }

        Part filePart = request.getPart("productImageInput");
        String imagePath = saveUploadedFile(filePart, request);

        Product product = new Product();
        product.setProductName(productName);
        product.setProductCategory(category);
        product.setWeighted(isWeighted);
        product.setPricePerUnit(pricePerUnit);
        product.setPricePer100g(pricePer100g);
        product.setProductImageURL(imagePath != null ? imagePath : "images/products/default.png");

        productDAO.addProduct(product);
    }

    private void handleUpdateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productID = Integer.parseInt(request.getParameter("productID"));
        String productName = request.getParameter("customer-fname");
        String quantityStr = request.getParameter("customer-lname"); // "1" or "100g"
        String priceStr = request.getParameter("phone-no");
        String category = request.getParameter("productCategory");

        boolean isWeighted = "100g".equalsIgnoreCase(quantityStr);
        double priceVal = (priceStr != null && !priceStr.isEmpty()) ? Double.parseDouble(priceStr) : 0.0;

        double pricePerUnit = 0.0;
        double pricePer100g = 0.0;
        if (isWeighted) {
            pricePer100g = priceVal;
        } else {
            pricePerUnit = priceVal;
        }

        Product oldProduct = null;
        for (Product p : productDAO.getAllProducts()) {
            if (p.getProductID() == productID) {
                oldProduct = p;
                break;
            }
        }

        Part filePart = request.getPart("productImageInput");
        String newImagePath = saveUploadedFile(filePart, request);

        String finalImagePath;
        if (newImagePath != null) {
            finalImagePath = newImagePath;
        } else if (oldProduct != null) {
            finalImagePath = oldProduct.getProductImageURL();
        } else {
            finalImagePath = "images/products/default.png";
        }

        Product product = new Product();
        product.setProductID(productID);
        product.setProductName(productName);
        product.setProductCategory(category);
        product.setWeighted(isWeighted);
        product.setPricePerUnit(pricePerUnit);
        product.setPricePer100g(pricePer100g);
        product.setProductImageURL(finalImagePath);

        productDAO.updateProduct(product);
    }

    private void handleDeleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int productID = Integer.parseInt(request.getParameter("productID"));
        productDAO.deleteProduct(productID);
    }

    private String saveUploadedFile(Part filePart, HttpServletRequest request) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }
        String fileName = getFileName(filePart);
        if (fileName == null || fileName.trim().isEmpty()) {
            return null;
        }

        String appPath = request.getServletContext().getRealPath("");
        File saveDir = new File(appPath, "images/products");
        if (!saveDir.exists()) {
            saveDir.mkdirs();
        }

        File fileToSave = new File(saveDir, fileName);
        filePart.write(fileToSave.getAbsolutePath());

        return "images/products/" + fileName;
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp != null) {
            for (String token : contentDisp.split(";")) {
                token = token.trim();
                if (token.startsWith("filename")) {
                    return token.substring(token.indexOf('=') + 1).replace("\"", "");
                }
            }
        }
        return null;
    }
}
