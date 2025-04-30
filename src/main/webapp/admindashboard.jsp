<%@ page import="java.util.*" %>
<%@ page import="com.example.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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

        h1, h2 {
            margin-top: 30px;
        }

        .form-section, .product-section {
            background-color: #fff;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .product-table th, .product-table td {
            vertical-align: middle;
        }

        .navbar-custom {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 0 0 10px 10px;
        }

        .navbar-custom a {
            color: #fff;
            margin-left: 15px;
            font-weight: bold;
        }

        .navbar-custom a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%
    String adminName = (String) session.getAttribute("admin_name");
    Integer adminId = (Integer) session.getAttribute("admin_id");

    if (adminName == null || adminId == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>

<div class="container">
    <div class="navbar-custom d-flex justify-content-between align-items-center">
        <div>
            <h4 class="mb-0">Welcome, <%= adminName %> (ID: <%= adminId %>)</h4>
        </div>
        <div>
            <a href="viewbookings.jsp">View Bookings</a>
            <a href="index.jsp">Logout</a>
        </div>
    </div>

    <div class="form-section">
        <h2>Add Product</h2>
        <form method="post" action="ProductsServlet">
            <div class="mb-3">
                <label for="name" class="form-label">Product Name:</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description:</label>
                <input type="text" name="description" id="description" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price:</label>
                <input type="text" name="price" id="price" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Product Image URL:</label>
                <input type="text" name="image" id="image" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Submit</button>
        </form>
    </div>

    <div class="product-section">
        <h2>Your Products</h2>
        <table class="table table-bordered product-table">
            <thead class="table-dark">
                <tr>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product product : products) {
            %>
                <tr>
                    <td><%= product.getName() %></td>
                    <td><%= product.getDescription() %></td>
                    <td>₹<%= product.getPrice() %></td>
                    <td>
                        <img src="<%= product.getImage() %>" alt="Image" class="img-thumbnail" style="max-height: 100px; max-width: 100px;">
                    </td>
                    <td>
                        <form action="UpdateProductServlet" method="post" class="mb-2">
                            <input type="hidden" name="id" value="<%= product.getId() %>">
                            <input type="text" name="name" value="<%= product.getName() %>" class="form-control mb-1">
                            <input type="text" name="description" value="<%= product.getDescription() %>" class="form-control mb-1">
                            <input type="text" name="price" value="<%= product.getPrice() %>" class="form-control mb-1">
                            <input type="text" name="image" value="<%= product.getImage() %>" class="form-control mb-2">
                            <input type="submit" value="Update" class="btn btn-warning btn-sm w-100">
                        </form>
                        <form action="DeleteProductServlet" method="post">
                            <input type="hidden" name="id" value="<%= product.getId() %>">
                            <input type="submit" value="Delete" class="btn btn-danger btn-sm w-100" onclick="return confirm('Are you sure you want to delete this product?');">
                        </form>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr><td colspan="5" class="text-center">No products found.</td></tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
