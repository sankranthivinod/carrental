package com.klef;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ADDING")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class ADDCAR extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
     
 
        final Part filePart = request.getPart("cimage");
   
       
        InputStream pdfFileBytes = null;
        
        final PrintWriter writer = response.getWriter();
        
        String cname = request.getParameter("cname"); 
        String cnum = request.getParameter("cnum");
        String cfuel = request.getParameter("cfuel");
        String ccap = request.getParameter("ccap");
        String ccost = request.getParameter("ccost"); 
        
        
        try
        {
            
     
         pdfFileBytes = filePart.getInputStream();  // to get the body of the request as binary data
 
            final byte[] bytes = new byte[pdfFileBytes.available()];
             pdfFileBytes.read(bytes);  //Storing the binary data in bytes array.
 
         Connection con=null;
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
         
        
         PreparedStatement statement = null;
         String sql = " insert into cars values(?,?,?,?,?,?) ";
         statement = con.prepareStatement(sql);
            
          statement.setString(1, cname);
          statement.setString(2, cnum);
          statement.setBytes(3,bytes);
          statement.setString(4, cfuel);
          statement.setString(5, ccap);
          statement.setString(6, ccost);
             
             
          int success =  statement.executeUpdate();
         
               if(success>=1)
               {
  
            	   out.println("SUCCESWFULLY ADDED ");
                  RequestDispatcher rd = request.getRequestDispatcher("cars.jsp");
					rd.forward(request,response);
                    
               }
                 
               con.close();         
         
        }
        catch (SQLException e) 
        {
           writer.println(e.getMessage());
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
    }

}
