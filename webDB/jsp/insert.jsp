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

        <title>Creare un Giudice</title>
    </head>
    <body background="sfondo.jpg">
    

       <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bissoli.marco;user=bissoli.marco;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();

            String Nome = request.getParameter("Nome");
            String Cognome = request.getParameter("Cognome");
            String LuogoDiNascita = request.getParameter("LuogoDiNascita");
            String DataDiNascita = request.getParameter("DataDiNascita");
            String Soprannome = request.getParameter("Soprannome");
            String NazioneDiNascita = request.getParameter("NazioneDiNascita");
            String Biografia = request.getParameter("Biografia");
            String temp = request.getParameter("PrimaEdizione");
            int PrimaEdizione = Integer.parseInt(temp);
	        String sql = "INSERT INTO Giudice (Nome, Cognome, LuogoDiNascita, DataDiNascita, Soprannome, NazioneDiNascita, Biografia, PrimaEdizione) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement ps1 = connection.prepareStatement(sql);
			
			ps1.setString(1, Nome);
			ps1.setString(2, Cognome);
			ps1.setString(3, LuogoDiNascita);
			ps1.setString(4, DataDiNascita);
			ps1.setString(5, Soprannome);
			ps1.setString(6, NazioneDiNascita);
			ps1.setString(7, Biografia);
			ps1.setInt(8, PrimaEdizione);
			
						
			 ps1.executeUpdate();
			
     %> <form method="post" action="/html/home.html">
	            <h2 style="color:green; text-align:center;">GIUDICE CREATO!</h2>
	            
	            <p ><input type="submit" value="OK"/></p>
	            </form>
     <%
			
	        
	        
	        
	        connection.close();
        
        %>
    </body>
</html>