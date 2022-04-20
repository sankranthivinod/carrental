<%@ page import="java.sql.* " %>
<%@ page import="java.util.*" %>


<%

String email = request.getParameter("email");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
	
	PreparedStatement ps = con.prepareStatement("delete from registration where email = ? ");
	ps.setString(1,email);
	ps.executeUpdate();
	
	out.println("<H1> DELETED SUCCESFULLY FROM THE DATABASE  </H1>");
	
	%><jsp:forward   page="users.jsp"/><%
}
catch(Exception e){
	System.out.println(e);
}

%>