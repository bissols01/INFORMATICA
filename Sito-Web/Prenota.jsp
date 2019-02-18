<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>First JSP</title>
</head>
   
<body>
<% String username = request.getParameter("username");
   String classe = request.getParameter("classe");
   String compiti = request.getParameter("compiti");
   



       
       
       if (username == ""){
           out.println("<p>ATTENZIONE INSERIRE IL COGNOME!</p>");
           out.println("<a href='form1.html'>BACK</a>");
       }else{
           out.println("<h1>Benvenuto "+username+" </h1> <br>");
           if (classe == ""){
               
               out.println("SCEGLI UNA CLASSE VALIDA! <br>");
               out.println("<a href='form1.html'>BACK</a>");
           }else {
               out.println("Hai scelto la classe: "+classe+"<br>");
               
           }
           if (compiti == ""){
               out.println("Hai scelto di non visualizzare i compiti.");
           }else{
               out.println("Hai scelto di visualizzare i compiti.");%><br><%
           }
           String[] professori = {"Giraldi Laura", "Titze Walter", "Spadoni Riccardo", "Capozzi Giuseppe", "Carrara Maria Grazia", "Malizia Fabio", "Apicella Annalisa", "Bellocco Paola", "Arcostanzo Piero"};
    int contProf = 0;
    for(int i=0; i<8; i++){
        String prof = request.getParameter(professori[i]);
        if(prof != null) {
            
            out.println(professori[i]);  %><br><%
        } else {
            contProf++;
        }
    }
    
    if(contProf == 8) {
            out.println("Non si è scelto alcun professore, selezionarne almeno 1");
    }}%>


   

</body>
</html>