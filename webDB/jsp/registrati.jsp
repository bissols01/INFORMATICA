<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrazione</title>
    </head>
    <body>
    

       <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bissoli.marco;user=bissoli.marco;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();

            String Nome = request.getParameter("Nome");
            String Cognome = request.getParameter("Cognome");
            String UserName = request.getParameter("UserName");
            String Email = request.getParameter("Email");
            String Password = request.getParameter("Password");
            try{
                String sql = "INSERT INTO Accounts (Nome, Cognome, UserName, Email, Password) VALUES(?,?,?,?,?) ";
			PreparedStatement ps2 = connection.prepareStatement(sql);
			
			ps2.setString(1, Nome);
			ps2.setString(2, Cognome);
			ps2.setString(3, UserName);
			ps2.setString(4, Email);
			ps2.setString(5, Password);
			
			ps2.executeUpdate();
			
			 %> <h1 style="color:green">Account Creato! </h1> <%
     
            } catch (Exception e){
            out.println("UserName già in uso! <br><br><a href=../html/registrati.html>BACK!</a>");
        }        
	        
			
			
			
						
			 
			
    
			
	        
	        
	        
	        connection.close();
        
        %>
    </body>
</html>