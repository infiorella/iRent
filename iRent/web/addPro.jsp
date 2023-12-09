<%-- 
    Document   : index
    Created on : 21/10/2020, 10:32:10 AM
    Author     : Ana Vasquez
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ModeloDAO.InquilinoDAO"%>
<%@page import="Modelo.Inquilino"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="css/app.min.css">
        <link rel="stylesheet" href="css/estilo.css">       
        <script src="https://kit.fontawesome.com/9bb05c0e06.js" crossorigin="anonymous"></script>}
               <link rel="icon" type="image/png" href="Dev2/img/logo1.png" />
        <style type="text/css">
            .card-body img{
              width: 100%;
            }

            .pt-4, .py-4{
              padding-top: 0px !important;
            }
        </style>
    </head>
    <body>
<div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
            <div class="card card-primary">
              <div class="card-header">
                <h4>Registro</h4>
              </div>
              <div class="card-body">
                <form action="Dev2_ProControlador">
                  <div class="row">
                      <div class="form-group col-6">
                           <%
                                Conexion cn=new Conexion();
                                Connection con;   
                                PreparedStatement ps;
                                ResultSet rs;
                                 con=cn.getConnection();              
                                
                                 try{

                                    String sql = "SELECT MAX(id_Pro) FROM propietario";

                                    ps=con.prepareStatement(sql);

                                    rs=ps.executeQuery(); 
                                    while (rs.next()){ 
                                    %>
                                       
                      <label for="frist_name">ID Generado</label>
                      <input id="frist_name" type="text" readonly="" class="form-control" name="id_Pro" value="<%=rs.getInt("MAX(id_Pro)")+1%>">
                              <%  
                                        }
                                            rs.close();
                                            ps.close();
                                        } catch (Exception e) {
                                        }
                                        %>
                    </div>
                    <div class="form-group col-6">
                      <label for="frist_name">Nombre Completo</label>
                      <input id="frist_name" type="text" class="form-control" name="nomPro" autofocus>
                    </div>                    
                  </div>
                    
                  <div class="row">
                      <div class="form-group col-6">
                        <label for="last_name">Teléfono</label>
                      <input id="last_name" type="text" class="form-control" name="telPro">
                    </div>
                      
                  <div class="form-group col-6">
                    <label for="email">Nacionalidad</label>
                    <input id="email" type="text" class="form-control" name="nacionPro">
                  </div>
                 </div>       
                  
                    
                  <div class="row">
                       <div class="form-group col-6">
                    <label for="edad">Edad</label>
                    <input id="edad" type="text" class="form-control" name="edadPro">
                  </div>
                    
                    <div class="form-group col-6">
                    <label for="passw">Contraseña</label>
                    <input id="passw" type="password" class="form-control" name="pass">
                  </div>
                  </div>
                    
                  <div class="form-group col-6">
                    <input type="submit" class="btn btn-primary" value="Agregar" name="accion" />
                  </div>
                </form>
              </div>
              <div class="mb-4 text-muted text-center">
                  ¿Ya estás registrado? <a href="indexPro.jsp">Login</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
        <!-- datatables JS -->
        <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.22/datatables.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.22/b-1.6.5/b-flash-1.6.5/b-html5-1.6.5/b-print-1.6.5/datatables.min.js"></script>  
    
        <!--Los del prooyecto--->
        <script src="funciones.js"></script>
        <script src="js/app.min.js"></script>
        <script src="js/scripts.js"></script>       
</body>
</html>