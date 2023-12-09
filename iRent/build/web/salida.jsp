<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>


<%
int id_Inq=Integer.parseInt(request.getParameter("id_Inq"));
String pass=request.getParameter("pass");
Conexion xconexion=new Conexion();
Connection xcon=xconexion.getConnection();

PreparedStatement ps;
ResultSet rs=null;

try {
        String sql="select * from loginquilino where id_Inq=? AND pass=? AND estado=1";
        ps=xcon.prepareStatement(sql);
        ps.setInt(1, id_Inq);
        ps.setString(2, pass);
        rs=ps.executeQuery();
        
        if(rs.next()){      
            
           String sql4="UPDATE loginquilino set pass='"+pass+"',"
                        +"diafin=CURDATE(),"
                        +"horafin=CURTIME(),"
                        +"estado='"+2+"',"
                        +"intento='"+0+"'"
                        +" WHERE id_Inq="+id_Inq;
           ps=xcon.prepareStatement(sql4);
           ps.executeUpdate();  

           response.sendRedirect("Principio.jsp");  
                         
        } else{
              response.sendRedirect("blanco.jsp");  

        }
        } catch (Exception e) {
        
}
    rs.close();
    xcon.close();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salir</title>
    </head>
    <body>
    </body>
</html>
