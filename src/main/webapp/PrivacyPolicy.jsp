<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy - Farmkart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
        <link rel="icon" href="${pageContext.request.contextPath}/images/icon.png" type="image/png">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding-top: 50px;
        }
        .container {
            margin-top: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .section-title {
            color: #007bff;
            font-size: 1.5rem;
            margin-bottom: 15px;
        }
        .section-content {
            font-size: 1rem;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
         <a class="navbar-brand" href="#">
        <img alt="" src="${pageContext.request.contextPath}/images/logo.png" height="70px">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="PrivacyPolicy.jsp">Privacy Policy</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="SecurityPolicy.jsp">Security Policy</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container" data-aos="fade-up" data-aos-duration="1500">
    <h1>Privacy Policy</h1>
    <div class="section">
        <h2 class="section-title">1. Introduction</h2>
        <p class="section-content">At Farmkart, we value your privacy and are committed to protecting your personal data. This privacy policy explains how we collect, use, and protect your information when you visit our website or use our services.</p>
    </div>

    <div class="section">
        <h2 class="section-title">2. Information Collection</h2>
        <p class="section-content">We collect personal information such as your name, email, shipping address, and payment details to process your orders. We also gather non-personal information like IP addresses to enhance your shopping experience.</p>
    </div>

    <div class="section">
        <h2 class="section-title">3. How Information is Used</h2>
        <p class="section-content">Your personal information is used solely to process your orders, improve our website functionality, and communicate with you about promotions and offers.</p>
    </div>

    <div class="section">
        <h2 class="section-title">4. Data Retention</h2>
        <p class="section-content">We retain your personal data only as long as necessary to complete your order or to comply with legal obligations.</p>
    </div>

    <div class="section">
        <h2 class="section-title">5. Data Sharing and Disclosure</h2>
        <p class="section-content">We do not sell or rent your personal information. However, we may share your data with trusted third-party partners for the sole purpose of processing your orders.</p>
    </div>

    <div class="section">
        <h2 class="section-title">6. Cookies and Tracking Technologies</h2>
        <p class="section-content">We use cookies to improve your experience on our website. You can disable cookies in your browser settings, but this may impact your ability to use some features on our site.</p>
    </div>

    <div class="section">
        <h2 class="section-title">7. Security</h2>
        <p class="section-content">We use SSL encryption to protect your payment information and personal data. However, we also recommend that you choose a strong password and keep your login credentials confidential.</p>
    </div>

    <div class="section">
        <h2 class="section-title">8. User Rights</h2>
        <p class="section-content">You have the right to access, correct, or request the deletion of your personal data. Please contact us at support@farmkart.com if you would like to exercise these rights.</p>
    </div>

    <div class="section">
        <h2 class="section-title">9. Changes to the Privacy Policy</h2>
        <p class="section-content">We may update this privacy policy from time to time. Any changes will be posted on this page with an updated effective date.</p>
    </div>
</div>

<!-- Footer -->
<footer class="text-center mt-5">
    <p>&copy; 2025 Farmkart. All rights reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
