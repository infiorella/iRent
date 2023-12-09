
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Inquilino"%>
<%@page import="ModeloDao.InquilinoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado General</title>
    </head>
    <body>
        <div>
            <h1>Personas</h1>
            <a href="Controlador?accion=add">Agregar Nuevo></a>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>DNI</th>
                        <th>NOMBRES</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                InquilinoDao dao=new InquilinoDao();
                List<Inquilino> list=dao.listar();
                Iterator<Persona> iter=list.iterator();
                Persona per=null;
                while(iter.hasNext())
                    {
                    per=iter.next();
                %>
                <tbody>
                    <tr>
                        <td><%=per.getId() %></td>
                        <td><%=per.getDni() %></td>
                        <td><%=per.getNom() %></td>
                        <td>
                            <a href="Controlador?accion=editar&id=<%=per.getId()%>">Editar</a>
                            <a>Remove</a>
                            
                        </td>
                    </tr>
                    <% } %>
                </tbody>
                
            </table>

            
        </div>
    </body>
</html>
