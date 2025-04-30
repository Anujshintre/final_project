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
 * Servlet implementation class Userregisterservlet
 */
@WebServlet("/Userregisterservlet")
public class Userregisterservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Userregisterservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter p = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String password = request.getParameter("password");
		
		try {
			Connection conn = DBUtil.getConnection();
			String InsertSql = "Insert into user(name,email,phonenumber,password)values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(InsertSql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phonenumber);
			ps.setString(4, password);
			
			int rows = ps.executeUpdate();
			
			if(rows>0) {
				response.sendRedirect("userlogin.jsp");
			}else {
				response.sendRedirect("userregister.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("userregister.jsp?error=eception");
		}
	}
	

}
