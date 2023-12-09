
<%@page import="Modelo.Inquilino"%>
<%@page import="ModeloDAO.InquilinoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificacion de Registros</title>
    </head>
    <body>
       <% 
           
       InquilinoDAO dao=new InquilinoDAO();
       int id=Integer.parseInt((String)request.getAttribute("id_Inq"));
       Inquilino inq=(Inquilino)dao.list(id);
       
       %>
       <h1>Modificar Persona</h1>
       <form action="Controlador">
           <table border="1">
                    <tbody>
                        <tr>
                            <td>DNI:</td>
                            <td> <input type="text" name="txtDni" value="<%=inq.getNom()%>" /> </td>
                        </tr>
                        <tr>
                            <td>Nombres:</td>
                            <td> <input type="text" name="txtNom" value="<%= inq.getApe()%>" /> 
                                <input type="hidden" name="txtId" value="<%= inq.getPass() %>" />
                            </td>
                            
                        </tr>
                        <tr>
                            <td colspan="2"> <input type="submit" value="Actualizar" name="accion" /> </td>
                        </tr>
                        
                    </tbody>
                </table>
                            <a href="Controlador?accion=listar">Regresar</a>
       </form>
        
    </body>
</html>
