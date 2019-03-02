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
    td{
        text-align:center;
    }
    tr{
        text-align:center;
    }
    table{
        text-align:center;
    }
    </style>
        <title>Elenco giudici XFactor</title>
    </head>
    <body background="sfondo.jpg">
     <% 
     if(request.getParameter("luogo")==null || request.getParameter("luogo").isEmpty()){
      %>
       <h1>Non hai inserito nessun giudice</h1>
      <%
        return;
      } 
      %>

      <h1>Elenco dei giudici di <%= request.getParameter("luogo") %></h1>
        <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bissoli.marco;user=bissoli.marco;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();

            String luogo = request.getParameter("luogo");

			String sql = "SELECT * FROM Giudice where LuogoDiNascita = ?";
			PreparedStatement ps1 = connection.prepareStatement(sql);
			ps1.setString(1, luogo);
						
			ResultSet rs = ps1.executeQuery();
			
			out.print("<table>");
			
			out.print("<tr><th align=left>Cognome</th><th align=left>Nome</th></tr>");
			
    		while(rs.next()){

				String Nome = rs.getString("Nome");
				String Cognome = rs.getString("Cognome");
				String LuogoDiNascita = rs.getString("LuogoDiNascita");
                
                out.print("<tr><td>" + Cognome + "</td><td>" + Nome + "</td></tr>");

	        }
	        
	        out.print("</table>");
	        
	        rs.close();
	        
	        connection.close();
        
        %>
    </body>
</html>