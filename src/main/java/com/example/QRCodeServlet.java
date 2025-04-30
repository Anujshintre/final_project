package com.example;

import java.io.IOException;
import java.io.OutputStream;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/QRCodeServlet")
public class QRCodeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentText = request.getParameter("data");

        QRCodeWriter qrWriter = new QRCodeWriter();
        try {
            BitMatrix matrix = qrWriter.encode(paymentText, BarcodeFormat.QR_CODE, 200, 200);
            response.setContentType("image/png");
            OutputStream out = response.getOutputStream();
            MatrixToImageWriter.writeToStream(matrix, "PNG", out); // Corrected method
            out.close();
        } catch (WriterException e) {
            throw new ServletException("QR Code generation error", e); // Corrected exception
        }
    }
}

