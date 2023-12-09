<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>

<%
    Calendar calendario=Calendar.getInstance();
int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
String pass=request.getParameter("pass");

String sql="select * from propietario where id_Pro=? and pass=?";
Conexion xconexion=new Conexion();
Connection xcon=xconexion.getConnection();

PreparedStatement ps,ps2,ps3, ps4,ps5,ps6,ps7;
ResultSet rs=null;
ResultSet rs2=null;
ResultSet rs3=null;
ResultSet rs5=null;
ResultSet rslog=null;
int intento=1;
final int maximo=3;

try {
    ps=xcon.prepareStatement(sql);
    ps.setInt(1, id_Pro);
    ps.setString(2, pass);
    rs=ps.executeQuery();         


    //Credenciales Correctas
    if(rs.next()) {
            request.getSession().setAttribute("id_Pro",id_Pro);
            request.getSession().setAttribute("pass",pass);                                        
        
        //Ver si ya esta logeado
        String sql2="select * from loginpro WHERE id_Pro="+id_Pro+" AND estado=1";
        ps4=xcon.prepareStatement(sql2);
        rs2=ps4.executeQuery();            

        //si esta logeado
        if(rs2.next()) {
            %>
            <script> alert("Ya se inicio sesión");               
            </script>
            <% 
               response.sendRedirect("Pro/vistas/logeado.jsp");
        //si no está logeado        
        } else{
            //ver intentos
            String sql3="SELECT * from loginpro WHERE id_Pro="+id_Pro;
            ps5=xcon.prepareStatement(sql3);
            rs3=ps5.executeQuery();

            //Si tiene intentos
            if(rs3.next()){
                int a=rs3.getInt("intento");

                a=a+1;

                //No supero el exceso de intento
                if(a>=1 && a<=3){

                    String sql4="UPDATE loginpro set pass='"+pass+"',"
                    +"estado='"+1+"',"
                    +"intento='"+a+"' WHERE id_Pro="+id_Pro;
                    ps6=xcon.prepareStatement(sql4);
                    ps6.executeUpdate();  

                   response.sendRedirect("Pro/vistas/logeado.jsp");

                //Si ya supero el exceso de intentos, cerrar ventana    
                }else if(a>3){
                    int b=rs3.getInt("horainicio");
                    int hora=calendario.get(Calendar.HOUR_OF_DAY);
                    //Si aun no vence la hora
                    if(b<hora){
                        String sql5="UPDATE loginpro set pass='"+pass +"' WHERE id_Pro="+id_Pro;
                        ps7=xcon.prepareStatement(sql5);
                        ps7.executeUpdate();  

                        %>
                        <script>
                            alert("Usuario bloqueado intentos permitidos alcanzados");      
                        </script> 
                        <%
                        }
                    } else{
                        String sql5="UPDATE loginpro set intento=1  WHERE id_Pro="+id_Pro;
                        ps7=xcon.prepareStatement(sql5);
                        ps7.executeUpdate(); 
                } 
            //Si ingresa prprimera vez
            }else{

                ps2=xcon.prepareStatement("insert into loginpro(id_Pro,pass,estado,intento) values(?,?,?,?)");
                ps2.setInt(1, id_Pro); 
                ps2.setString(2,pass);
                ps2.setInt(3,1);
                ps2.setInt(4, 1);
                ps2.executeUpdate();

               response.sendRedirect("Pro/vistas/logeado.jsp");
            }

        }    

    //Credenciales incorrectos
    } else{
        String sql2="SELECT intento from loginpro WHERE id_Pro="+id_Pro;
        ps4=xcon.prepareStatement(sql2);
        rs2=ps4.executeQuery();

        //Si ya ha intentado previamente
        if(rs2.next()){            
            int a=rs2.getInt("intento");
            a=a+1;

            String sql4="UPDATE loginpro set pass='"+pass+"',"
                    +"intento='"+a+"' WHERE id_Pro="+id_Pro;

            //Si los intentos son menores de 3    
            if(a<=3){
                ps6=xcon.prepareStatement(sql4);
                ps6.executeUpdate();  
                %>
                <script>
                    alert("Datos Incorrectos"); 
                     window.location = "indexPro.jsp";
                </script>                       
<%
            //Si los intentos son mayores a 3    
            } else if(a>3){
                %>                        
                <script>
                    alert("Usuario bloqueado intentos permitidos alcanzados"); 
                     window.location = "indexPro.jsp";
                </script>                        
                <%
            }

            String sql5="SELECT intento from loginpro WHERE id_Pro="+id_Pro;
            ps4=xcon.prepareStatement(sql5);
            rs5=ps4.executeQuery();
            //Si ingresa y cerrró sesión
           
        //Si recien intento por primera vez
        } else{      
            ps3=xcon.prepareStatement("insert into loginpro(id_Pro,pass,estado,intento) values(?,?,?,?)");
            ps3.setInt(1, id_Pro);
            ps3.setString(2,pass);
            ps3.setInt(3,3);
            ps3.setInt(4, 1);
            ps3.executeUpdate();
%>
            <script>
                    alert("Datos Incorrectos"); 
                    window.location = "indexPro.jsp";                    
                </script>  
<%              
}

}  
    } catch (Exception e) {        
    }

    rs.close();
    xcon.close();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>${id_Pro}</p>
        <p>${pass}</p>
    </body>
</html>