<%@ page import="java.sql.* " %>
<%@ page import="java.util.*" %>


<%

String car = request.getParameter("searchcar");


out.println("<h2>HERE ARE YOUR RESULTS BASED ON SEARCH</h2>");

out.println(" <table border='4px' align='center' ");
out.println("<tr> ");
out.println("<th>  CARNAME  </th> ");
out.println("<th>  CAR NUMBER </th> ");
out.println("<th>  FUELTYPE </th> ");
out.println("<th>  CAPACITY  </th> ");
out.println("<th>  COSTPERO KILOMETER  </th> ");
out.println("<th>  CARIMAGE </th> ");
out.println("</tr>");

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");

PreparedStatement ps = con.prepareStatement("select cname,cnumber,fueltype,capacity,cost from cars where cname = ? ");
ps.setString(1,car);

ResultSet rs = ps.executeQuery();


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
out.println("</tr>");




}
}
catch(Exception e ){
	System.out.println(e);
}





%>