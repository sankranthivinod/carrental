<html>
<head>
	<style>
	*{
		margin:0;
		padding:0;
		box-sizing:border-box;
	}
	
	#nav-bar{
    background-color:orange;
    display:flex;
    width:100%;
    height:75px;
    position:relative;
    bottom:0;
    overflow:hidden;
   position:fixed;
    top:0;
}
	#form1{
		margin-left:950px;
		margin-top:25px;
	}	
	#body{
	background-img:url('images/body.png');
	}
#submit{
	padding:7px;
	padding-left:12px;
	padding-right:12px;
	border-radius:5px;
	border:none;
	background-color:darkgreen;
	color:white;
}
	#text{
		padding:7px;
		border-radius:5px;
		border:none;
	}
		#submit:hover{
			cursor:pointer;
		}
		
	</style>
</head>
<nav id="nav-bar">
    <a href=""><img src="images/crazyrentals.jpeg" width="250px" height="75px" /></a>
    

    
    <form action="searchuser.jsp" method="post" id="form1">
    <input type='text' placeholder='ENTER THE MAIL' name='search' id='text' />
    <input type='submit' value='SEARCH' id='submit'/>    
    </form>
    

</nav>
<body id="body">



<%@ page import="java.sql.* " %>
<%@ page import="java.util.*" %>

<%

	//out.println("<form action='searchuser.jsp' method='post' >");
	//out.println("<input type='text' placeholder='ENTER THE MAIL' name='search' /> &nbsp;&nbsp;&nbsp;");
	//out.println("<input type='submit' value='SEARCH'/>");
	//out.println("</form>");
	
	
	out.println("<br><br> <h1 style='text-align:center; margin-top:60px;font-family:sans-serif;'>THE COMPLETE LIST OF REGISTERED USERS ARE  </h1><br><br>");
	
	out.println("<table  border='2px' style='margin-left:400px;' ");
	out.println("<tr>");
	out.println("<th style='padding:15px; color:yellow; background-color:rgb(0,0,0,0.5);'>  FULLNAME  </th> ");
	out.println("<th style='padding:15px; color:yellow; background-color:rgb(0,0,0,0.5);'>  GENDER  </th> ");
	out.println("<th style='padding:15px; color:yellow; background-color:rgb(0,0,0,0.5);'>  MOBILENO   </th> ");
	out.println("<th style='padding:15px; color:yellow; background-color:rgb(0,0,0,0.5);'>  AGE  </th> ");
	out.println("<th style='padding:15px; color:yellow; background-color:rgb(0,0,0,0.5);'>  EMAIL  </th> ");
	out.println("<th style='padding:15px; color:yellow; background-color:rgb(0,0,0,0.5);'>  ADDRESS </th> ");
	out.println("<th style='padding:15px; color:yellow; background-color:rgb(0,0,0,0.5);' >  ACTION </th> ");
	out.println("</tr>");
	
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
	
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from registration ");
	
	while(rs.next()){
		
	out.println("<tr style='font-size:larger;'>");
	
	out.println("<td style='padding:15px; color:brown;'>"+rs.getString(1)+"</td>");
	out.println("<td style='padding:15px; color:brown;'>"+rs.getString(2)+"</td>");
	out.println("<td style='padding:15px; color:brown;'>"+rs.getString(3)+"</td>");
	out.println("<td style='padding:15px; color:brown;'>"+rs.getString(4)+"</td>");
	out.println("<td style='padding:15px; color:brown;'>"+rs.getString(5)+"</td>");
	out.println("<td style='padding:15px; color:brown;'>"+rs.getString(7)+"</td>");	
	
	out.println("<td style='padding:15px;'><a href='deleteuser.jsp?email="+rs.getString(5)+"' style='color:red; text-decoration:none;font-size:larger;'>DELETE" + "</a></td>");
	
	out.println("</tr>");
			
	}
}
	catch(Exception e ){
		System.out.println(e);
	}
	



%>
</body>
</html>