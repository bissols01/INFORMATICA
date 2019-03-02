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
        <title>Elenco giudici XFactor</title>
    </head>
    <body background="sfondo.jpg">
        <h1>Elenco dei giudici di XFactor</h1>
        <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bissoli.marco;user=bissoli.marco;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();

			String sql = "SELECT * FROM Giudice order by Cognome";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			out.print("<p><table style='border: 1px solid black; text-align:center;'>");
			
			out.print("<tr style='border: 1px solid black;'><th align=left>Cognome</th><th align=left>Nome</th></tr>");
			
    		while(rs.next()){

				String Nome = rs.getString("Nome");
				String Cognome = rs.getString("Cognome");
                
                out.print("<tr style='border: 1px solid black;'><td style='border: 1px solid black;'>" + Cognome + "</td><td style='border: 1px solid black;'>" + Nome + "</td></tr>");

	        }
	        
	        out.print("</table></p>");
	        
	        rs.close();
	        
	        connection.close();
        
        %>
    </body>
</html>