<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Farmkart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    #home {
    color: white;
    padding: 80px 20px;
    font-family: 'Josefin Sans', sans-serif;
    text-align: center;
    text-shadow: 1px 1px 4px rgba(0,0,0,0.2);
}

#home h1 {
    font-size: 52px;
    font-weight: 700;
    margin-bottom: 20px;
}

#home p {
    font-size: 22px;
    font-weight: 300;
    color: #f1f1f1;
}
    
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            justify-content: center;
        }
        .card {
            border: 1px solid #ccc;
            border-radius: 10px;
            width: 250px;
            padding: 15px;
            box-shadow: 2px 2px 10px #aaa;
        }
        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }
        section {
            padding: 50px 20px;
        }
        .navbar-nav .nav-link {
            color: black !important;
        }
        .badge {
    background-color: #e8f5e9;
    color: #2e7d32;
    font-size: 12px;
    padding: 5px 10px;
}
        <!-- Add a little CSS to make cards pop on hover -->
 .card-hover-zoom {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card-hover-zoom:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        z-index: 1;
    }
    .card:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    }

    </style>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/images/icon.png" type="image/png">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    Integer userId = (Integer) session.getAttribute("user_id");
%>
<div class="container-fluid mainback">
    
        <div class="row d-flex ">
           <!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg  fixed-top navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
        <img alt="" src="${pageContext.request.contextPath}/images/logo.png" height="70px">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse  navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link text-dark" href="#home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#product">Product</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                <li>
                        <span class="text-center mt-2">
                       <% if (username != null) { %>
                     <span class="text-dark">Welcome, <strong ><%= username %></strong>!</span>
                   <form action="LogoutServlet" method="post" style="display:inline;">
                 <input type="submit" value="Logout" class="btn btn-danger">
            </form>
            <a href="cart.jsp" class="btn btn-warning"> <i class="bi bi-cart"></i> Cart</a>
        <% } else { %>
            <a href="adminregister.jsp" class="btn btn-primary"><i class="bi bi-person-gear"></i>Admin Login</a>
            <a href="userregister.jsp" class="btn btn-success"><i class="bi bi-box-arrow-in-right"></i>User Login</a>
        <% } %>
    </span>
                </li>
            </ul>
        </div>
    </div>
</nav>
        
    </div>
    
    <!-- Home Section -->
<section id="home">
    <h1 class="text-center py-5">Welcome to Farmkart </h1>
    <p class="text-center text-light">Connecting Farmers Directly to Your Doorstep</p>

</section>
</div>
<section id="product" class="container-fluid bg-light py-5">    
    <div class="row">
        <h2 class="text-center mb-4">Available Products</h2>

        <!-- Search and Filter Form -->
        <div class="container mb-5">
            <form method="get" action="#product" class="row g-3 bg-white p-4 rounded shadow-sm">
                <div class="col-md-5">
                    <div class="input-group">
                        <span class="input-group-text bg-primary text-white"><i class="bi bi-search"></i></span>
                        <input type="text" name="search" class="form-control" placeholder="Search products..." 
                            value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-text bg-success text-white"><i class="bi bi-currency-rupee"></i></span>
                        <input type="number" name="minPrice" class="form-control" placeholder="Min Price" 
                            value="<%= request.getParameter("minPrice") != null ? request.getParameter("minPrice") : "" %>">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-text bg-danger text-white"><i class="bi bi-currency-rupee"></i></span>
                        <input type="number" name="maxPrice" class="form-control" placeholder="Max Price" 
                            value="<%= request.getParameter("maxPrice") != null ? request.getParameter("maxPrice") : "" %>">
                    </div>
                </div>
                <div class="col-md-1 d-grid">
                    <button type="submit" class="btn btn-primary btn-block">Filter</button>
                </div>
                <div class="col-md-2 d-grid">
                    <a href="#product" class="btn btn-outline-secondary btn-block" onclick="window.location.href=window.location.pathname;">Reset</a>
                </div>
            </form>
        </div>

        <!-- Product Cards -->
        <div class="card-container d-flex flex-wrap justify-content-center">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmkart", "root", "123456");
                    
                    String search = request.getParameter("search");
                    String minPrice = request.getParameter("minPrice");
                    String maxPrice = request.getParameter("maxPrice");

                    String sql = "SELECT p.*, a.name AS admin_name FROM products p JOIN admin a ON p.admin_id = a.id WHERE 1=1";

                    if (search != null && !search.trim().isEmpty()) {
                        sql += " AND p.name LIKE ?";
                    }
                    if (minPrice != null && !minPrice.trim().isEmpty()) {
                        sql += " AND p.price >= ?";
                    }
                    if (maxPrice != null && !maxPrice.trim().isEmpty()) {
                        sql += " AND p.price <= ?";
                    }

                    PreparedStatement ps = con.prepareStatement(sql);

                    int paramIndex = 1;
                    if (search != null && !search.trim().isEmpty()) {
                        ps.setString(paramIndex++, "%" + search.trim() + "%");
                    }
                    if (minPrice != null && !minPrice.trim().isEmpty()) {
                        ps.setDouble(paramIndex++, Double.parseDouble(minPrice));
                    }
                    if (maxPrice != null && !maxPrice.trim().isEmpty()) {
                        ps.setDouble(paramIndex++, Double.parseDouble(maxPrice));
                    }

                    ResultSet rs = ps.executeQuery();

                    boolean hasProducts = false;
                    while (rs.next()) {
                        hasProducts = true;
            %>
            <div class="card m-3 shadow card-hover-zoom" style="width: 18rem; border-radius: 20px; overflow: hidden; background: linear-gradient(to bottom, #fff6e0, #ffb84d); border: none;">
    <div style="background: linear-gradient(to bottom, #ffe8b3, #ffa726); padding: 20px; text-align: center;">
        <h6 class="text-uppercase mb-1" style="font-weight: bold; font-size: 12px;">Farm Kart</h6>
        <h3 style="color: #2e7d32; font-weight: 800; margin-bottom: -10px;"> <%= rs.getString("name").toUpperCase() %> </h3>
        <img src="<%= rs.getString("image") %>" alt="Product Image" style="height: 120px; object-fit: cover; border-radius: 12px; margin-top: 10px;">
        <div class="mt-3">
            <a href="#" class="btn btn-dark btn-sm rounded-pill px-4" style="pointer-events: none;">₹<%= rs.getDouble("price") %></a>
        </div>
    </div>
    <div class="p-3">
        <div class="d-flex flex-wrap gap-2 justify-content-center mb-2">
            <span class="badge rounded-pill text-bg-light border"><i class="bi bi-check-circle-fill text-success"></i> Organic</span>
            <span class="badge rounded-pill text-bg-light border"><i class="bi bi-check-circle-fill text-success"></i> Residue-free</span>
            <span class="badge rounded-pill text-bg-light border"><i class="bi bi-check-circle-fill text-success"></i> Direct</span>
            <span class="badge rounded-pill text-bg-light border"><i class="bi bi-check-circle-fill text-success"></i> Premium</span>
        </div>
        <form method="post" action="BookProductServlet">
            <input type="hidden" name="productId" value="<%= rs.getInt("id") %>">
            <input type="hidden" name="name" value="<%= rs.getString("name") %>">
            <input type="hidden" name="price" value="<%= rs.getDouble("price") %>">
            <div class="input-group mb-2">
                <button type="button" class="btn btn-outline-secondary" onclick="decreaseQty(<%= rs.getInt("id") %>)">-</button>
                <input type="number" name="quantity" id="quantity_<%= rs.getInt("id") %>" value="1" min="1" class="form-control text-center" required>
                <button type="button" class="btn btn-outline-secondary" onclick="increaseQty(<%= rs.getInt("id") %>)">+</button>
            </div>
            <input type="submit" value="Add To Cart" class="btn btn-success w-100 rounded-pill" onclick="return checkLogin();">
        </form>
    </div>
</div>
            <%
                    }

                    if (!hasProducts) {
                        out.println("<div class='alert alert-info text-center'>No products found matching your search/filter criteria.</div>");
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                }
            %>
        </div>
    </div>
</section>







<!-- About Section -->
<section id="about" class="bg-light py-5">
  <div class="container">
    <h2 class="text-center text-success mb-4">About Farmkart</h2>
    <div class="row align-items-center">
      <!-- Image Column -->
      <div class="col-md-6 mb-4 mb-md-0">
        <img src="images/about.jpg" class="img-fluid rounded shadow" alt="Farmers working in the field">
      </div>
      
      <!-- Text Column -->
      <div class="col-md-6">
        <p class="lead">
          Farmkart bridges the gap between hardworking farmers and health-conscious consumers. By eliminating middlemen, we help farmers get fair prices and ensure customers receive fresh, organic produce straight from the source.
        </p>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">✅ 100% Organic Fruits and Vegetables</li>
          <li class="list-group-item">✅ Transparent Farmer-to-Consumer Pricing</li>
          <li class="list-group-item">✅ Empowering Local Communities</li>
          <li class="list-group-item">✅ Fresh Delivery, Straight from Farms</li>
        </ul>
      </div>
    </div>

   
    <div class="row text-center mt-5">
      <div class="col-md-4">
        <h3 class="text-primary">500+</h3>
        <p>Happy Farmers</p>
      </div>
      <div class="col-md-4">
        <h3 class="text-primary">10,000+</h3>
        <p>Healthy Deliveries</p>
      </div>
      <div class="col-md-4">
        <h3 class="text-primary">100%</h3>
        <p>Organic Guaranteed</p>
      </div>
    </div>
  </div>
</section>






<script>
function increaseQty(id) {
    const input = document.getElementById("quantity_" + id);
    input.value = parseInt(input.value) + 1;
}

function decreaseQty(id) {
    const input = document.getElementById("quantity_" + id);
    if (parseInt(input.value) > 1) {
        input.value = parseInt(input.value) - 1;
    }
}

function checkLogin() {
    const isLoggedIn = "<%= session.getAttribute("user_id") != null %>";
    if (isLoggedIn === "true") {
        return true;
    } else {
        alert("Please login to book this product.");
        window.location.href = "userregister.jsp";
        return false;
    }
}
</script>
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
          <li><a href="#home" class="text-white text-decoration-none">Home</a></li>
          <li><a href="#about" class="text-white text-decoration-none">About</a></li>
          <li><a href="#product" class="text-white text-decoration-none">Products</a></li>
          <li><a href="#contact" class="text-white text-decoration-none">Contact</a></li>
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
      <p class="mb-0">&copy; Created By Anuj Shintre | 2025 All rights reserved ®.</p>
    </div>

</footer>
</body>
</html>
