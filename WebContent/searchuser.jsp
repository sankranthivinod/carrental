<%@ page import="java.sql.* " %>
<%@ page import="java.util.*" %>


<%

String email = request.getParameter("search");


out.println("<h2>HERE ARE YOUR RESULTS BASED ON SEARCH</h2>");

out.println(" <table border='4px' align='center' ");
out.println("<tr> ");
out.println("<th>  FULLNAME  </th> ");
out.println("<th>  GENDER  </th> ");
out.println("<th>  MOBILENO   </th> ");
out.println("<th>  AGE  </th> ");
out.println("<th>  EMAIL  </th> ");
out.println("<th>  ADDRESS </th> ");
out.println("</tr>");

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");

PreparedStatement ps = con.prepareStatement("select * from registration where email = ? ");
ps.setString(1,email);

ResultSet rs = ps.executeQuery();


while(rs.next()){
	
out.println("<tr>");

out.println("<td>"+rs.getString(1)+"</td>");
out.println("<td>"+rs.getString(2)+"</td>");
out.println("<td>"+rs.getString(3)+"</td>");
out.println("<td>"+rs.getString(4)+"</td>");
out.println("<td>"+rs.getString(5)+"</td>");
out.println("<td>"+rs.getString(7)+"</td>");	


out.println("</tr>");

	
	
	
}
}
catch(Exception e ){
	System.out.println(e);
}





%>