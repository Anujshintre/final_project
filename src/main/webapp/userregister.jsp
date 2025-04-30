<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/images/icon.png" type="image/png">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background: #f1f2f6;
        }
        .register-container {
            background-color: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }
        .register-container h1 {
            margin-bottom: 25px;
            color: #2c3e50;
        }
        label {
            margin-top: 10px;
            font-weight: 500;
        }
        input {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="col-md-6 register-container">
        <form method="post" action="Userregisterservlet">
            <h1 class="text-center">📝 User Registration</h1>

            <div class="mb-3">
                <label for="name" class="form-label">User Name</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="phonenumber" class="form-label">Contact Number</label>
                <input type="text" id="phonenumber" name="phonenumber" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Create Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <div class="d-grid mb-3">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>

            <div class="text-center">
                <a href="userlogin.jsp">Already have an account? Login here</a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
