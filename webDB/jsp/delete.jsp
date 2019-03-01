<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Eliminare un Giudice</title>
    </head>
    <body>
    

       <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bissoli.marco;user=bissoli.marco;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();

            String Nome = request.getParameter("Nome");
            String Cognome = request.getParameter("Cognome");
            
	        String sql = "DELETE FROM Giudice WHERE Nome = ? AND Cognome = ?";
	        
			PreparedStatement ps1 = connection.prepareStatement(sql);
			
			ps1.setString(1, Nome);
			ps1.setString(2, Cognome);
			
			
						
			 ps1.executeUpdate();
			
     %> <h1 style="color:green">Giudice Eliminato! </h1> 
     <%
			
	        
	        
	        
	        connection.close();
        
        %>
    </body>
</html>