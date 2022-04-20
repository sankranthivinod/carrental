<%@page import="java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="icon" type="image/png" href="images/car logo.png">
<style>
body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: orange;
}

.topnav a {
  float: left;
  display: block;
  color: whitesmoke;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: orange;
  color: whitesmoke;
}

.topnav .login-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
  width:120px;
}

.topnav .login-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background-color: #555;
  color: white;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .login-container button:hover {
  background-color: green;
}

@media screen and (max-width: 600px) {
  .topnav .login-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .login-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
}
.buttonf{
 border-radius:8px;
 font-size:15px;
}
.button {
  background-color: #4CAF50; 
  color: white;
  padding: 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 8px 4px;
}
.quotation{
  font-family:cursive;
  color:black;
  font-size: 30px;
  margin-left:450px;
  font-weight:bold;  
}
.button1 {
  background-color: orange; 
  color: white; 
  border: 2px solid #4CAF50;
}
.button1:hover {
  background-color: #4CAF50;
  color: white;
}
.lower{
  position: fixed;
  bottom: 0;
  left:0;
  background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1;
  width: 100%;
  padding: 10px;
}
.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: grey;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  font-size: 12px;
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
.column {
  float: left;
  width: 32.5%;
  padding:3px;

}
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
</head>
<body class="body" >
  
  
<div class="topnav">
<div class="img">
            <img class="logo" src="images/car logo.png" width="130" height="49" ALT="align box" ALIGN=LEFT>
  <a class="active" href="CARSTOREHOMEPAGE.html">HOME</a>
  <div class="dropdown">
    <button class="dropbtn">CARS 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="allcars.html">Latest Cars</a>
      <a href="allcars.html">Popular Cars</a>
      <a href="expensivecars.html">Expensive Cars</a>
      <a href="allcars.html">All Cars</a>
      <a href="usedcars.html">Used Cars</a>
    </div>
  </div>
  <a href="sellcar.html">Sell Car</a>
  <a href="About us page.html">ABOUT US</a>

<div class="login-container">
    <form action="login.html" method="get">  
      <a class="buttonf" href="login.html">Login</a>
      <a class="buttonf" href="registrationform.html">Register</a>
   </form> 
  </div>
</div>

</div>
<%
try {
   
  response.setContentType("text/html");
  Connection con = null;
  Class.forName("oracle.jdbc.driver.OracleDriver");
   con  = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");

  Statement stmt = con.createStatement();
  
  ResultSet rs = stmt.executeQuery("select cname,cnumber,fueltype,capacity,cost from cars");
  %>
  <div class="row">
  <%
  while(rs.next()) 
  {
  
    String n = rs.getString(1);
   %>
    <div class="column">
    <div class="card" style="width:400px">
   <img  height=400  width=100% src="image.jsp?cname='<%=rs.getString(1)%>'"/> 
    <div class="card-body">
      <h4 class="card-title"> <%=rs.getString(1)%></h4>
      <h4 style='text-align:center'><p >CAR Name:<%=rs.getString(1)%><br>
	CAR NUMBER:<%=rs.getString(2)%><br>
	FUELTYPE:<%=rs.getString(3)%><br>
	CAPACITY:<%=rs.getString(4)%><br>
	COST PER KILOMETER :<%=rs.getString(5)%><br>
	</p></h4>
	<p>
    <% out.println(" <a href='stunt.jsp?cname="+rs.getString(1)+"'><button type='submit' class='button' >Buy Now</button></a> ") ;%>
  
  </p>
</div>
</div>
</div>
 <%
  }
    }
  catch(Exception e ) {
    System.out.println(e);
}

%>
</div>
</body>
</html>