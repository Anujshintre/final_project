package com.example;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        double totalPrice = Double.parseDouble(request.getParameter("total_price"));
        int userId = Integer.parseInt(request.getParameter("user_id"));

        try {
            Connection con = DBUtil.getConnection();

            // Insert booking into book table
            String sql = "INSERT INTO book (user_id, address, email, total_price) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, address);
            ps.setString(3, email);
            ps.setDouble(4, totalPrice);
            int row = ps.executeUpdate();

            if (row > 0) {
                // Fetch all products in user's cart along with their admin details (email + upi_id)
                String fetchProducts = "SELECT p.name, p.price, c.quantity, a.email AS admin_email, a.upi_id AS admin_upi " +
                                       "FROM cart c " +
                                       "JOIN products p ON c.product_id = p.id " +
                                       "JOIN admin a ON p.admin_id = a.id " +
                                       "WHERE c.user_id = ?";
                PreparedStatement ps2 = con.prepareStatement(fetchProducts);
                ps2.setInt(1, userId);
                ResultSet rs = ps2.executeQuery();

                // Group products per admin
                Map<String, StringBuilder> adminProducts = new HashMap<>();
                Map<String, String> adminUpis = new HashMap<>(); // New Map to store UPI IDs

                while (rs.next()) {
                    String adminEmail = rs.getString("admin_email");
                    String adminUpi = rs.getString("admin_upi"); // Get UPI ID
                    String productName = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");

                    adminProducts.putIfAbsent(adminEmail, new StringBuilder());
                    adminUpis.putIfAbsent(adminEmail, adminUpi); // Store UPI against admin email

                    adminProducts.get(adminEmail)
                        .append("Product: ").append(productName)
                        .append(", Quantity: ").append(quantity)
                        .append(", Price: ₹").append(price)
                        .append("\n");
                }
                rs.close();
                ps2.close();

                // Send email to each admin separately
                for (Map.Entry<String, StringBuilder> entry : adminProducts.entrySet()) {
                    String adminEmail = entry.getKey();
                    String productDetails = entry.getValue().toString();
                    String adminUpi = adminUpis.get(adminEmail);

                    String subject = "New Order for Your Products!";
                    String body = "Hello Seller,\n\nA new order has been placed for your products.\n\n"
                                + productDetails
                                + "\nShipping Address: " + address
                                + "\nCustomer Email: " + email
                                + "\nYour UPI ID (for Payment): " + adminUpi
                                + "\n\nThank you!";
                    sendEmail(adminEmail, subject, body);
                }

                // Send confirmation email to the user
                StringBuilder userProductDetails = new StringBuilder();
                for (StringBuilder details : adminProducts.values()) {
                    userProductDetails.append(details).append("\n");
                }

                String subjectUser = "Your FarmKart Order Confirmation";
                String bodyUser = "Thank you for your order!\n\nHere are your product details:\n"
                                + userProductDetails.toString()
                                + "\nShipping Address: " + address
                                + "\nTotal Amount Paid: ₹" + totalPrice;

                sendEmail(email, subjectUser, bodyUser);

                // Save session and redirect
                HttpSession session = request.getSession();
                session.setAttribute("total_price", totalPrice);
                session.setAttribute("email", email);
                session.setAttribute("user_id", userId);
                session.setAttribute("admin_upis", adminUpis); // save UPI IDs also
                response.sendRedirect("generateQRCode.jsp");
            } else {
                response.getWriter().println("Failed to save booking. Please try again.");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void sendEmail(String to, String subject, String body) throws MessagingException {
        final String fromEmail = "farmkart69@gmail.com"; // your Gmail
        final String password = "tjxn cges zefw haqy";   // your App Password

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setText(body);

        Transport.send(message);
    }
}
