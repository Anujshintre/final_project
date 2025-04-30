<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin View Orders</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/images/icon.png" type="image/png">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #343a40;
        }
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container mt-5 table-container">
    <a href="admindashboard.jsp" class="back-link text-primary">&larr; Back to Admin Dashboard</a>
    <h2 class="text-center mb-4">🛒 All Orders - Admin Panel</h2>

    <%-- Ensure that the admin is logged in --%>
    <%
        Integer adminId = (Integer) session.getAttribute("admin_id");

        if (adminId == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }
    %>

    <table class="table table-hover table-bordered text-center align-middle">
        <thead class="table-dark">
            <tr>
                <th>User</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Ordered At</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmkart", "root", "123456");

                String sql = "SELECT u.name AS user_name, p.name AS product_name, c.quantity, c.price, c.added_at FROM cart c JOIN user u ON c.user_id = u.id JOIN products p ON c.product_id = p.id WHERE p.admin_id = ? ORDER BY c.added_at DESC";

                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, adminId);
                ResultSet rs = ps.executeQuery();

                boolean hasData = false;
                while (rs.next()) {
                    hasData = true;
        %>
            <tr>
                <td><%= rs.getString("user_name") %></td>
                <td><%= rs.getString("product_name") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td>₹<%= rs.getDouble("price") %></td>
                <td><%= rs.getTimestamp("added_at") %></td>
            </tr>
        <%
                }
                if (!hasData) {
        %>
            <tr>
                <td colspan="5">No orders found.</td>
            </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
        %>
            <tr>
                <td colspan="5">Error: <%= e.getMessage() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
