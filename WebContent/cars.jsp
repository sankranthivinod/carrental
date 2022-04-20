<%@ page import="java.sql.*" %>
<%@ page import="java.util.* "%>

<%

	out.println("<form action='searchcar.jsp' method='post' >");
	out.println("<input type='text' placeholder='ENTER THE CAR NAME' name='searchcar' /> &nbsp;&nbsp;&nbsp;");
	out.println("<input type='submit' value='SEARCH'/>");
	out.println("</form>");

	out.println("<br><br> <h1>THE COMPLETE LIST OF AVAILABLE CARS ARE  </h1>");
	
	out.println(" <table border='5px solid brown' align='center' ");
	out.println("<tr> ");
	out.println("<th>  CAR NAME  </th> ");
	out.println("<th>  CAR NUMBER </th> ");
	out.println("<th>  FUEL TYPE  </th> ");
	out.println("<th>  CAPACITY  </th> ");
	out.println("<th>  COST PER KILOMETER </th> ");
	out.println("<th>  CAR IMAGE   </th> ");
	out.println("<th>  ACTION </th> ");
	out.println("</tr>");

	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select cname,cnumber,fueltype,capacity,cost from cars");
		
		while(rs.next()){
			
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");	
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td>");
			out.println("<td>"+rs.getString(5)+"</td>");
			out.println("<td align=center>");
			%><img height=70px width=70px src="carimage.jsp?cname='<%=rs.getString(1)%>'" /><%
			out.println("</td>");
			
			out.println("<td><a href='deletecar.jsp?cname="+rs.getString(1)+"'>DELETE" + "</a></td>");
			out.println("</tr>");
					
			}
		
	}
	catch(Exception e ){
		System.out.println(e);
	}



%>