<%-- 
    Document   : incorrecto
    Created on : 21/10/2020, 03:09:49 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            alert("Usuario Incorrecto");
           request.getRequestDispatcher("../index.jsp").forward(request, response);
        </script>
            
    </body>
</html>
