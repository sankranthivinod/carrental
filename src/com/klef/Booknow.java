package com.klef;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Booknow extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Booknow() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String user = session.getAttribute("login").toString();
		out.println("<h1>HELLO </h1>" +user + "   "+ "<h1>WELCOME TO BOOK NOW PAGE</h1>");
		
		try {
				
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con  = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select cname,cnumber,fueltype,capacity,cost from cars");
			
			while(rs.next()) {
				
				String n = rs.getString(1);
				out.println("<h1>" + rs.getString(1)   + "</h1>");
				out.println(rs.getString(2));
				out.println(rs.getString(3));
				out.println(rs.getInt(4));
				out.println(rs.getInt(5));
				out.println("<br><br>");
				out.println("<img src='image.jsp?cname="+rs.getString(1)+"'>" + "</img>");
			}
			
		}
		catch(Exception e ) {
			System.out.println(e);
		}
		

		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
