<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
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
        .login-box {
            background-color: #fff;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }
        .login-box h1 {
            margin-bottom: 25px;
            color: #2c3e50;
        }
        label {
            margin-top: 10px;
            font-weight: 500;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="col-md-6 login-box">
        <form method="post" action="UserloginServlet">
            <h1 class="text-center">🔐 User Login</h1>

            <div class="mb-3">
                <label for="name" class="form-label">User Name</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" id="password" class="form-control" required>
            </div>

            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <div class="alert alert-danger text-center">
                    <%= error %>
                </div>
            <% } %>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>

            <div class="text-center mt-3">
                <a href="userregister.jsp">Don't have an account? Register here</a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
