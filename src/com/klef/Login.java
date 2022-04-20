package com.klef;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Login() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String login = request.getParameter("login");
		String pwd = request.getParameter("pwd");
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con  = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from registration");
			
			int flag=0;
			
			
			while(rs.next()){
				if((login.equals(rs.getString(3)) || login.equals(rs.getString(5))) && (pwd.equals(rs.getString(6))) ) {
					flag=1;
					
					HttpSession session = request.getSession();
					session.setAttribute("login",login);
					
					RequestDispatcher rd = request.getRequestDispatcher("Booknow.jsp");
					rd.forward(request,response);
					break;
				} 
			}
			
			if(flag==0) {
				
				
				RequestDispatcher rd1 = request.getRequestDispatcher("Login.html");
				
				//out.println("<html><head></head><body onload=\"alert(' Invalid credentials! ')\"></body></html>");
				
				
				rd1.include(request,response);
				out.println("<center><h4 style='color:aqua; margin-left:450px; margin-bottom:500px;' >INVALID CREDENTIALS ! </h4></center>");
				
				
			}
			
			
			
			// query for admin login 
			
			Statement s = con.createStatement();
			ResultSet ra = s.executeQuery("select * from admin");
			int a=0;
			 while(ra.next()) {
				 
				 
				 if(login.equals(ra.getString(1)) && pwd.equals(ra.getString(2))){
					 
					 	HttpSession session = request.getSession();
						session.setAttribute("login",login);
						
						RequestDispatcher rd = request.getRequestDispatcher("admin.html");
						rd.forward(request,response);
						break;
						
				 }
				 
				 
			 }
			
			
		}
		catch(Exception e ){
			System.out.println(e);
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
