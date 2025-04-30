<%@ page import="java.sql.*, java.util.*, com.google.zxing.*, com.google.zxing.common.BitMatrix, java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Booking</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/images/icon.png" type="image/png">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .bill-container {
            border: 1px solid #ddd;
            padding: 20px;
            margin-top: 20px;
            background: #fff;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        .bill-header, .bill-footer {
            text-align: center;
            margin-bottom: 20px;
        }
        .bill-details {
            margin-bottom: 20px;
        }
        .total-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: #28a745;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .confirm-btn {
            text-align: center;
        }
    </style>
    <script>
        // Function to trigger the print dialog
        function printReceipt() {
            window.print();
        }
    </script>
</head>

<body style="background: #f8f9fa;">
    <div class="container">
        <div class="bill-container mt-4">
            <div class="bill-header">
                <div class="row">
                    <div class="col-1">
                        <img alt="" src="${pageContext.request.contextPath}/images/logo.png" height="70px">
                    </div>
                    <div class="col-11">
                        <h2 class="text-success text-center">FarmKart Invoice</h2>
                    </div>
                </div>
                <p>Thank you for your order! Please review your details below.</p>
            </div>

            <!-- Product Details Section -->
            <div class="bill-details">
                <h4>Products You Are Buying:</h4>
                <ul class="list-unstyled">
                    <%
                        int userId = Integer.parseInt(request.getParameter("user_id"));
                        double totalPrice = Double.parseDouble(request.getParameter("total_price"));
                        double deliveryCharge = 1.00; // Delivery charge (₹40)
                        double gstRate = 0.018; // GST rate 18%

                        double gstAmount = totalPrice * gstRate;
                        double finalPrice = totalPrice + deliveryCharge + gstAmount;

                        Connection con = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmkart", "root", "123456");

                            PreparedStatement ps = con.prepareStatement(
                                "SELECT p.name, c.quantity, c.price FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?");
                            ps.setInt(1, userId);
                            ResultSet rs = ps.executeQuery();

                            while (rs.next()) {
                                String name = rs.getString("name");
                                int quantity = rs.getInt("quantity");
                                double price = rs.getDouble("price");
                    %>
                        <li><strong><%= name %></strong> - Quantity: <%= quantity %> - ₹<%= price %> each</li>
                    <%
                            }
                            rs.close();
                            ps.close();
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        } finally {
                            if (con != null) con.close();
                        }
                    %>
                </ul>
            </div>

            <!-- User Address and Phone Input Form -->
            <div class="bill-details">
                <h4>Enter Your Details:</h4>
                <form method="post" action="PaymentServlet">
                    <div class="form-group">
                        <label for="address">Shipping Address:</label>
                        <textarea name="address" id="address" class="form-control" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="email">Email Address:</label>
                        <input type="email" name="email" id="email" class="form-control" required>
                    </div>

                    <!-- Hidden fields -->
                    <input type="hidden" name="user_id" value="<%= userId %>">
                    <input type="hidden" name="total_price" value="<%= finalPrice %>">

                    <div class="form-group">
                        <label class="total-price">Total Price: ₹<%= finalPrice %></label>
                    </div>

                    <div class="form-group">
                        <label class="total-price">Delivery Charges: ₹<%= deliveryCharge %></label>
                    </div>

                    <div class="form-group">
                        <label class="total-price">GST (18%): ₹<%= gstAmount %></label>
                    </div>

                    <div class="confirm-btn">
                        <button type="submit" class="btn btn-success btn-lg">Submit and Generate QR Code</button>
                    </div>
                </form>
            </div>

            <!-- Print Button -->
            <div class="confirm-btn mt-4">
                <button class="btn btn-primary" onclick="printReceipt()">Print Receipt</button>
            </div>

            <!-- Footer -->
            <div class="bill-footer mt-4">
                <a href="cart.jsp" class="btn btn-warning">Back to Cart</a>
            </div>

        </div>
    </div>
</body>
</html>
