// ProductsServlet.java
package com.example;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/ProductsServlet")
public class ProductsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProductsServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin_id") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        int adminId = (Integer) session.getAttribute("admin_id");

        try (Connection conn = DBUtil.getConnection()) {
            String insertSql = "INSERT INTO products(name, description, price, image, admin_id) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(insertSql)) {
                stmt.setString(1, name);
                stmt.setString(2, description);
                stmt.setDouble(3, price);
                stmt.setString(4, image);
                stmt.setInt(5, adminId);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("ProductsServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin_id") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        int adminId = (Integer) session.getAttribute("admin_id");

        try (Connection conn = DBUtil.getConnection()) {
            String selectSQL = "SELECT id, name, description, price, image FROM products WHERE admin_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(selectSQL)) {
                ps.setInt(1, adminId);
                ResultSet rs = ps.executeQuery();

                List<Product> products = new ArrayList<>();
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImage(rs.getString("image"));
                    products.add(product);
                }

                request.setAttribute("products", products);
                request.getRequestDispatcher("admindashboard.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error loading products: " + e.getMessage() + "</h3>");
        }
    }
}
