<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<% 
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;

try 
{	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con  = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
	stmt = con.createStatement();
	rs = stmt.executeQuery("select cimage from cars where cname= " + request.getParameter("cname") );
	
	
	
	
	
	while(rs.next()) 
	{
		image = rs.getBlob(1);
		imgData = image.getBytes(1,(int)image.length());
	} 
	
	response.setContentType("image/gif");
	OutputStream o = response.getOutputStream();
	o.write(imgData);
	o.flush();
	o.close();
	} 
	catch (Exception e) 
	{
		out.println("Unable To Display image");
		out.println("Image Display Error=" + e.getMessage());
		return;
	} 


%>