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
        <title>Modificare la Data di Nascita di un Giudice</title>
    </head>
    <body background="sfondo.jpg">
            
            
       <%   
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bissoli.marco;user=bissoli.marco;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
            
            
			String Nome = request.getParameter("Nome");
			String Cognome = request.getParameter("Cognome");
			String DataDiNascita = request.getParameter("DataDiNascita");
			try{
			    
			
			String sql = "UPDATE Giudice SET DataDiNascita = ? WHERE Nome = ? AND Cognome = ?;";
	        
	        PreparedStatement ps1 = connection.prepareStatement(sql);
			ps1.setString(1, DataDiNascita);
			ps1.setString(2, Nome);
			ps1.setString(3, Cognome);
			ps1.executeUpdate();%>
			<form method="post" action="/html/home.html">
	            <h2 style="color:green; text-align:center;">La data di nascita del Giudice è stata cambiata!   </h2>
	            
	            <p><input type="submit" value="OK"/></p>
	            </form><%
        } catch (Exception e){
             out.println(e); 
            %> <form method="post" action="/html/update.html">
	            <h2 style="color:orange; text-align:center;">Ci sono stati degli errori, RIPROVARE! </h2>
	            
	            <p><input type="submit" value="BACK"/></p>
	            </form><%
            
            
}




	        connection.close();
        
        %>
    </body>
</html>