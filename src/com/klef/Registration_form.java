package com.klef;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Registration_form extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Registration_form() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		
		String fname = request.getParameter("fname");
		String gender = request.getParameter("gender");
		String mobileno = request.getParameter("mobileno");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String address = request.getParameter("address");
		
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con  = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");

			Statement stmt = con.createStatement();
			
			PreparedStatement ps = con.prepareStatement("insert into registration values(?,?,?,?,?,?,?)");
			ps.setString(1,fname);
			ps.setString(2,gender);
			ps.setString(3,mobileno);
			ps.setString(4,age);
			ps.setString(5,email);
			ps.setString(6,pwd);
			ps.setString(7,address);
			ps.executeUpdate();
		
			
			System.out.println("Registered Succesfully ");
			RequestDispatcher rd = request.getRequestDispatcher("Login.html");
			rd.forward(request, response);
				
			
				
		}
		
		catch(Exception e){
			System.out.println(e);
			RequestDispatcher rd = request.getRequestDispatcher("registration.html");
			rd.forward(request, response);
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
