<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
    <style>
     h1{
        color:white;
        text-align:center;
        font-size:200%;
        font-family:impact;
        text-shadow: 2px 2px #000000;
        text-outline-color:black;
    }
    p{
        
        color:white;
        text-align:center;
        font-size:200%;
        font-family:impact;
        text-shadow: 2px 2px #000000;
        text-outline-color:black;
    }
    </style>
        <title>Registrazione</title>
    </head background="sfondo.jpg">
    <body background="sfondo.jpg">
    

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
			
			 %>   
	            <form method="post" action="/html/inizio.html">
	            <h2 style="color:green; text-align:center;">ACCOUNT CREATO!</h2>
	            
	            <p><input type="submit" value="OK"/></p>
	            </form>
	            
	            
               <%
     
            } catch (Exception e){
                %>
            <form method="post" action="/html/registrati.html">
	            <h2 style="color:orange; text-align:center;">UserName già in uso!</h2>
	            
	            <p><input type="submit" value="BACK"/></p>
	            </form><%
            
               
	        
			
			
			
						
			 
			connection.close();
    
			
	        
        }

	        
	        
        
        %>
    </body>
</html>