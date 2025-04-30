<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Security Policy - Farmkart</title>
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
        </a>        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
    <h1>Security Policy</h1>
    <div class="section">
        <h2 class="section-title">1. Introduction</h2>
        <p class="section-content">Farmkart takes the security of your data very seriously. We have implemented multiple layers of protection to ensure that your personal and payment information is safe with us.</p>
    </div>

    <div class="section">
        <h2 class="section-title">2. Data Encryption</h2>
        <p class="section-content">All sensitive data, such as payment details, is encrypted using SSL/TLS encryption. This ensures that your personal and payment information remains safe during transmission.</p>
    </div>

    <div class="section">
        <h2 class="section-title">3. Secure Payment Processing</h2>
        <p class="section-content">We use trusted payment gateways like Stripe and PayPal to process payments, which follow strict security protocols to ensure the safety of your financial data.</p>
    </div>

    <div class="section">
        <h2 class="section-title">4. Access Controls</h2>
        <p class="section-content">Access to sensitive data is restricted to authorized personnel only. Our employees are trained on the importance of data security and must adhere to strict security protocols.</p>
    </div>

    <div class="section">
        <h2 class="section-title">5. Two-Factor Authentication (2FA)</h2>
        <p class="section-content">We recommend enabling two-factor authentication (2FA) for an extra layer of security on your account. This adds an additional step to the login process and helps protect your account from unauthorized access.</p>
    </div>

    <div class="section">
        <h2 class="section-title">6. Regular Audits and Updates</h2>
        <p class="section-content">We conduct regular security audits and perform vulnerability scans on our website to identify and fix potential security risks.</p>
    </div>

    <div class="section">
        <h2 class="section-title">7. User Responsibilities</h2>
        <p class="section-content">For your protection, we recommend using strong, unique passwords and not sharing your login details with anyone.</p>
    </div>

    <div class="section">
        <h2 class="section-title">8. Data Breach Notification</h2>
        <p class="section-content">In the unlikely event of a data breach, we will notify affected users within 72 hours and provide guidance on how to protect their information.</p>
    </div>

    <div class="section">
        <h2 class="section-title">9. Compliance</h2>
        <p class="section-content">Farmkart is compliant with the General Data Protection Regulation (GDPR) and the California Consumer Privacy Act (CCPA), ensuring your personal data is handled securely and lawfully.</p>
    </div>

    <div class="section">
        <h2 class="section-title">10. Contact Information</h2>
        <p class="section-content">If you have any concerns about the security of your account or personal data, please contact us at security@farmkart.com.</p>
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
