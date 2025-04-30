package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Adminregisterservlet
 */
@WebServlet("/AdminRegisterservlet")
public class Adminregisterservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public Adminregisterservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter p = response.getWriter();
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String upiId = request.getParameter("upi_id"); // 🔥 Get UPI ID from form
        
        try {
            Connection conn = DBUtil.getConnection();
            // 🔥 Insert UPI ID also into the database
            String InsertSql = "INSERT INTO admin(name, email, password, upi_id) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(InsertSql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, upiId); // 🔥 Set UPI ID value here
            
            int rows = ps.executeUpdate();
            
            if (rows > 0) {
                response.sendRedirect("adminlogin.jsp");
            } else {
                response.sendRedirect("adminregister.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminregister.jsp?error=exception");
        }
    }
}
