package com.example;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/BookProductServlet")
public class BookProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("user_id") : null;

        if (userId == null) {
            response.sendRedirect("userregister.jsp?msg=Please login first to book the product.");
            return;
        }

        double totalPrice = price * quantity;

        try {
            Connection conn = DBUtil.getConnection();

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO cart (user_id, product_id, quantity, price) VALUES (?, ?, ?, ?)"
            );
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);
            ps.setDouble(4, totalPrice);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                request.setAttribute("msg", "Product added to cart successfully");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }else {
                response.sendRedirect("index.jsp?error=Could not add to cart");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
