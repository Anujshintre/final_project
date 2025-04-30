package com.example;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/Adminloginservlet")
public class Adminloginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Adminloginservlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter p = response.getWriter();

        String name = request.getParameter("name");
        String password = request.getParameter("password");

        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM admin WHERE name=? AND password=?");
            ps.setString(1, name);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
             
                HttpSession session = request.getSession(); 
                session.setAttribute("admin_id", rs.getInt("id"));
                session.setAttribute("admin_name", rs.getString("name"));
                response.sendRedirect("ProductsServlet");
                
            } else {
                request.setAttribute("error", "Invalid name or password");
                RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminlogin.jsp?error=exception");
        }
    }
}
