<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Integer userId = (Integer) session.getAttribute("user_id");
    if (userId == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }
%>
<html>
<head>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/images/icon.png" type="image/png">
    <link rel="stylesheet" href="css/style.css">
    <title>Cart</title>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .table thead {
            background-color: #198754;
            color: white;
        }

        .btn-danger {
            padding: 6px 12px;
        }

        .total-section {
            text-align: right;
            margin-top: 20px;
            font-size: 1.25rem;
            font-weight: bold;
        }

        .confirm-btn {
            text-align: right;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center text-success mb-4">🛒 Your Cart</h2>

    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Added At</th>
            <th>Remove</th>
        </tr>
        </thead>
        <tbody>
        <%
            double totalPrice = 0;
            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmkart", "root", "123456");
                PreparedStatement ps = con.prepareStatement(
                    "SELECT p.id AS product_id, p.name, c.quantity, c.price, c.added_at FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?");
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    Timestamp addedAt = rs.getTimestamp("added_at");
                    totalPrice += price;
        %>
        <tr>
            <td><%= name %></td>
            <td><%= quantity %></td>
            <td>₹<%= price %></td>
            <td><%= addedAt %></td>
            <td>
                <form method="post" action="RemoveFromCartServlet">
                    <input type="hidden" name="product_id" value="<%= productId %>">
                    <button class="btn btn-danger btn-sm" type="submit">Remove</button>
                </form>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='5' class='text-danger text-center'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>

    <div class="total-section">
        Total Amount: ₹<%= totalPrice %>
    </div>

    <div class="confirm-btn">
        <form method="post" action="ConfirmBooking.jsp">
            <input type="hidden" name="user_id" value="<%= userId %>">
            <input type="hidden" name="total_price" value="<%= totalPrice %>">
            <button type="submit" class="btn btn-success">✅ Confirm Booking</button><br>
        </form>
        <a href="index.jsp" class="btn btn-warning">Go Back To Home Page</a>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
