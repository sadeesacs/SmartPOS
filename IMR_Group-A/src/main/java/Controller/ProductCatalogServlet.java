package Controller;

import DAO.ProductDAO;
import DAO.UserDAO;
import Model.Product;
import Model.User;

import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;
import java.util.List;
import jakarta.servlet.http.*;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "ProductCatalogServlet", urlPatterns = {"/ProductCatalogServlet"})
@MultipartConfig
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
        // get role from DB
        String currentRole = userDAO.getUserRoleByID(currentUserID);

        // If you also want the fullName
        User currentUser = userDAO.getUserByID(currentUserID);
        String fullName = (currentUser != null) ? currentUser.getFullName() : "UnknownUser";

        // Retrieve products
        List<Product> productList = productDAO.getAllProducts();

        request.setAttribute("productList", productList);
        request.setAttribute("currentRole", currentRole);
        request.setAttribute("fullname", fullName);

        // Forward to JSP
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

        // read action
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

        // refresh
        response.sendRedirect("ProductCatalogServlet");
    }
    
    private void handleAddProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // product name
        String productName = request.getParameter("customer-fname");
        // "1" or "100g"
        String unitQuantity = request.getParameter("customer-lname");
        // price
        String priceStr     = request.getParameter("phone-no");
        // category
        String category     = request.getParameter("productCategory");

        // isWeighted logic
        boolean isWeighted = false;
        if ("100g".equalsIgnoreCase(unitQuantity)) {
            isWeighted = true;
        }

        double priceVal = 0.0;
        if (priceStr != null && !priceStr.isEmpty()) {
            priceVal = Double.parseDouble(priceStr);
        }

        double pricePerUnit  = 0.0;
        double pricePer100g  = 0.0;
        if (isWeighted) {
            pricePer100g = priceVal;
        } else {
            pricePerUnit = priceVal;
        }

        // handle image
        Part filePart = request.getPart("productImageInput");
        String imagePath = saveImageFile(filePart, request);

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
        String unitQuantity = request.getParameter("customer-lname"); // "1" or "100g"
        String priceStr     = request.getParameter("phone-no");
        String category     = request.getParameter("productCategory");

        // find old product to keep the old image if none was uploaded
        Product oldProduct = null;
        for (Product p : productDAO.getAllProducts()) {
            if (p.getProductID() == productID) {
                oldProduct = p;
                break;
            }
        }

        boolean isWeighted = false;
        if ("100g".equalsIgnoreCase(unitQuantity)) {
            isWeighted = true;
        }

        double priceVal = 0.0;
        if (priceStr != null && !priceStr.isEmpty()) {
            priceVal = Double.parseDouble(priceStr);
        }
        double pricePerUnit  = 0.0;
        double pricePer100g  = 0.0;
        if (isWeighted) {
            pricePer100g = priceVal;
        } else {
            pricePerUnit = priceVal;
        }

        Part filePart = request.getPart("productImageInput");
        String newImagePath = saveImageFile(filePart, request);

        // if no new image => keep old
        String finalImageURL;
        if (newImagePath != null) {
            finalImageURL = newImagePath;
        } else if (oldProduct != null) {
            finalImageURL = oldProduct.getProductImageURL();
        } else {
            finalImageURL = "images/products/default.png";
        }

        Product product = new Product();
        product.setProductID(productID);
        product.setProductName(productName);
        product.setProductCategory(category);
        product.setWeighted(isWeighted);
        product.setPricePerUnit(pricePerUnit);
        product.setPricePer100g(pricePer100g);
        product.setProductImageURL(finalImageURL);

        productDAO.updateProduct(product);
    }

    private void handleDeleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productID = Integer.parseInt(request.getParameter("productID"));
        productDAO.deleteProduct(productID);
    }
    
    private String saveImageFile(Part filePart, HttpServletRequest request) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }
        // get file name
        String contentDisp = filePart.getHeader("content-disposition");
        String fileName = null;
        if (contentDisp != null) {
            for (String token : contentDisp.split(";")) {
                token = token.trim();
                if (token.startsWith("filename")) {
                    fileName = token.substring(token.indexOf('=') + 1).replace("\"", "");
                }
            }
        }
        if (fileName == null || fileName.trim().isEmpty()) {
            return null;
        }

        // path to images/products
        String appPath = request.getServletContext().getRealPath("");
        File saveDir = new File(appPath, "images/products");
        if (!saveDir.exists()) {
            saveDir.mkdirs();
        }

        File fileToSave = new File(saveDir, fileName);
        filePart.write(fileToSave.getAbsolutePath());

        return "images/products/" + fileName;
    }
}
