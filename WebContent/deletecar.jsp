<%@ page import="java.sql.* " %>
<%@ page import="java.util.*" %>


<%

String cname = request.getParameter("cname");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
	
	PreparedStatement ps = con.prepareStatement("delete from cars where cname = ? ");
	ps.setString(1,cname);
	ps.executeUpdate();
	
	out.println("<H1> DELETED  THE CAR SUCCESFULLY FROM THE DATABASE  </H1>");
	
	%><jsp:forward   page="cars.jsp"/><%
}
catch(Exception e){
	System.out.println(e);
}

%>