<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container-fluid admin">
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center py-5">
            <div class="col-5  text-center shadow-lg p-3 mb-5 bg-body rounded loginf">
                <form method="post" action="Adminloginservlet">
                    <h1>Admin Login </h1>
                    <label for="name">	Admin Name:</label><br>
    <input type="text" name="name" id="name" required><br>
    <label for="password">Password:</label><br>
    <input type="text" name="password" id="password" required><br>
    <button type="submit" class="btn btn-primary">Login</button><br>
    <a href="adminregister.jsp">Go back to registration page</a>
    <%
      String error = (String) request.getAttribute("error");
      if(error!=null){
    	  %>
    	  <p style="color:red;"><%= error %></p><% 
      }
    %>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>