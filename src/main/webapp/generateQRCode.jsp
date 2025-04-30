<%@ page import="com.google.zxing.*, com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.common.BitMatrix, com.google.zxing.client.j2se.MatrixToImageWriter" %>
<%@ page import="java.awt.image.BufferedImage, java.io.ByteArrayOutputStream, javax.imageio.ImageIO" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>QR Code Payment - FarmKart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container text-center mt-5">

<%
    Map<String, String> adminUpis = (Map<String, String>) session.getAttribute("admin_upis");
    String totalPriceStr = String.valueOf(session.getAttribute("total_price"));

    if (adminUpis != null && totalPriceStr != null && !totalPriceStr.isEmpty()) {
        double totalPrice = Double.parseDouble(totalPriceStr);

        for (Map.Entry<String, String> entry : adminUpis.entrySet()) {
            String adminEmail = entry.getKey();
            String adminUpi = entry.getValue();
            
            // Check if admin UPI is valid
            if (adminUpi != null && !adminUpi.trim().isEmpty()) {
                try {
                    String payeeName = URLEncoder.encode("FarmKart Seller", "UTF-8");
                    String txnNote = URLEncoder.encode("FarmKart Purchase", "UTF-8");
                    String amount = String.format("%.2f", totalPrice);

                    String upiUrl = "upi://pay?pa=" + adminUpi + "&pn=" + payeeName + "&tn=" + txnNote + "&am=" + amount + "&cu=INR";

                    // Generate QR Code
                    QRCodeWriter qrCodeWriter = new QRCodeWriter();
                    BitMatrix bitMatrix = qrCodeWriter.encode(upiUrl, BarcodeFormat.QR_CODE, 250, 250);
                    BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix);

                    // Convert QR to Base64
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    ImageIO.write(qrImage, "png", baos);
                    byte[] qrBytes = baos.toByteArray();
                    String base64Image = Base64.getEncoder().encodeToString(qrBytes);
%>

    <div class="card mb-5">
        <div class="card-body">
            <h3 class="card-title text-primary">Pay to Seller: <%= adminEmail %></h3>
            <p><strong>UPI ID:</strong> <%= adminUpi %></p>
            <h4 class="text-success">Amount: ₹<%= amount %></h4>

            <img src="data:image/png;base64,<%= base64Image %>" alt="QR Code" class="img-fluid mt-3" style="max-width: 250px;">

            <div class="mt-4">
                <a href="<%= upiUrl %>" class="btn btn-success">Pay Now</a>
            </div>
        </div>
    </div>

<%
                } catch (Exception e) {
%>
    <h3 class="text-danger">Error generating QR: <%= e.getMessage() %></h3>
<%
                }
            } 
        }
    } else {
%>
    <h2 class="text-danger">No Payment Information Available</h2>
<%
    }
%>

<a href="index.jsp" class="btn btn-primary">Back to Home</a>

</div>
</body>
</html>
