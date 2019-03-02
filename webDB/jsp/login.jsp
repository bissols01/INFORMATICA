
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
    a{
        text-align: center;
    }
    
    
    </style>
        <title>Log In</title>
    </head>
    <body background="sfondo.jpg">
    

       <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bissoli.marco;user=bissoli.marco;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();
			
			String UserName = request.getParameter("UserName");
			String Password = request.getParameter("Password");
			String nomeutente = "";
			boolean verifica = false;
			String sql2 = "SELECT Nome COUNT FROM Accounts WHERE Password = ? AND UserName = ?;";
			PreparedStatement ps4 = connection.prepareStatement(sql2);
			ps4.setString(1, Password);
			ps4.setString(2, UserName);
			
			ResultSet rs2 = ps4.executeQuery();
			while(rs2.next()){
			nomeutente = rs2.getString("COUNT");
		}

		

			
			String sql = "SELECT UserName COUNT FROM Accounts WHERE Password = ? AND UserName = ?;";
			PreparedStatement ps3 = connection.prepareStatement(sql);
			ps3.setString(1, Password);
			ps3.setString(2, UserName);
			
			ResultSet rs = ps3.executeQuery();
			
			
		
			while(rs.next()){
			    
			    
                verifica = true;
				String username = rs.getString("COUNT");
				
				if(username == null){
				    out.println("<p>credenziali errate!</p>");
				    
				}else{
				    out.println("<h1>Benvenuto nel sito "+nomeutente+" !</h1>");
			    %>
			    
			    <a href="db.jsp">
        <img src="elenco_giudici.png" alt="an image" width="600" height="150"/>
        </a>
        
        <a href="/html/luogo.html">
        <img src="scelta_luogo.png" alt="an image" width="600" height="150"/>
        </a>
        
        <a href="/html/insert.html">
        <img src="crea_giudice.png" alt="an image" width="600" height="150"/>
        </a><br><br>
        
        <a href="/html/delete.html">
        <img src="elimina_giudice.png" alt="an image" width="600" height="150"/>
        </a>
        
        <a href="/html/update.html">
        <img src="modifica_data.png" alt="an image" width="600" height="150"/>
        </a><%

				}
				
                
                

	        }
	        if(verifica == false){
	            %>
	            <form method="post" action="/html/login.html">
	            <h2 style="color:orange; text-align:center;">CREDENZIALI ERRATE!</h2>
	            
	            <p ><input type="submit" value="BACK"/></p>
	            </form>
    
    
    
  
    
    
    <%
	            
	        }
        
rs.close();
rs2.close();

connection.close();
			
			%>
    </body>
</html>