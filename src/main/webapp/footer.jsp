<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/images/icon.png" type="image/png">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- Footer Section -->
<footer class="bg-dark text-white p-5 ">
  <div class="container">
    <div class="row">
      <!-- About Column -->
      <div class="col-md-4 mb-3">
        <img alt="" src="${pageContext.request.contextPath}/images/logo.png" height="70px">
        <p>Connecting farmers directly with consumers for fresh, organic produce.</p>
      </div>
      
      <!-- Quick Links -->
<div class="col-md-4 mb-3">
  <h5>Quick Links</h5>
  <ul class="list-unstyled">
    <li><a href="index.jsp#home" class="text-white text-decoration-none">Home</a></li>
    <li><a href="index.jsp#about" class="text-white text-decoration-none">About</a></li>
    <li><a href="index.jsp#product" class="text-white text-decoration-none">Products</a></li>
    <li><a href="index.jsp#contact" class="text-white text-decoration-none">Contact</a></li>
    <li><a href="PrivacyPolicy.jsp" class="text-white text-decoration-none">PrivacyPolicy</a></li>
    <li><a href="SecurityPolicy.jsp" class="text-white text-decoration-none">SecurityPolicy</a></li>
  </ul>
</div>

      
      <!-- Contact Info -->
      <div class="col-md-4 mb-3">
        <h5>Contact Info</h5>
        <p>Email: Farmkart@gmail.com</p>
        <p>Phone: +91 7719831669</p>
        <p>Location: kolhapur, India</p>
      </div>
    </div>
    
    <div class="text-center mt-3">
      <p class="mb-0">&copy; Created By Anuj Shintre | © 2025 All rights reserved ®.</p>
    </div>

</footer>
    
</body>
</html>