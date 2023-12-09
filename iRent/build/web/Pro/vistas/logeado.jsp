<%-- 
    Document   : logeado
    Created on : 04/12/2020, 05:46:55 PM
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
            alert('Logeado Exitoso');
            window.location = "../../../../iRent/Dev2_ProControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=index";
        </script>
    </body>
</html>
