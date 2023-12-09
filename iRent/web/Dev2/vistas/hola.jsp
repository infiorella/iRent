<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iRent-Bitacora</title>
        <link rel="stylesheet" href="css/app.min.css">
        <link rel="stylesheet" href="css/estilo.css">
        <script src="https://kit.fontawesome.com/9bb05c0e06.js" crossorigin="anonymous"></script>
               <link rel="icon" type="image/png" href="Dev2/img/logo1.png" />
        <style type="text/css">
            div img{
              width: 100%;
            }

            .col-12 .col-md-12 .col-lg-5 .p-0{
                display: inline-block;
            }
        </style>
    </head>
    <body>
       
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-md-10 offset-md-1 col-lg-10 offset-lg-1">
            <div class="login-brand">
              iRent
            </div>
            <div class="card card-primary">
              <div class="row m-0">
                <div class="col-12 col-md-12 col-lg-5 p-0">
                  <div class="card-header text-center">
                      <a href="../../../../iRent/Controlador?&id_Inq=${id_Inq}&pass=${pass}&accion=index"><h4 class="has icon"><i class="fas fa-arrow-left"></i></h4></a><h4>Contáctan</i>os</h4>
                  </div>
                  <div class="card-body">
                       <%
                     Conexion cn=new Conexion();
                    Connection con;   
                    PreparedStatement ps;
                    ResultSet rs;
                     con=cn.getConnection();              
                     int id_Inq= Integer.parseInt(request.getParameter("id_Inq"));
                    try{
                    String sql = "SELECT * FROM inquilino JOIN departamento ON departamento.id_Dep=inquilino.id_Dep WHERE id_Inq=?";
                     
                        ps=con.prepareStatement(sql);
                                
                        ps.setInt(1, id_Inq);
                        rs=ps.executeQuery();

                        while (rs.next()){    
                    %>
                    <form action="Dev2_BiControlador" > 
                          <div class="form-group floating-addon">
                        <label>ID Departamento</label>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <div class="input-group-text">
                              <i class="fas fa-id-card"></i>
                            </div>
                          </div>
                            <input type="text" class="form-control" readonly="" name="id_Dep" value="<%=rs.getString("id_Dep")%>">
                        </div>
                      </div>
                          
                      <div class="form-group floating-addon">
                        <label>Tipo</label>
                        <div class="input-group">
                          <div class="input-group-prepend">
                          </div>
                            <select  autofocus name="tipo" class="form-control form-control-sm">
                                <option value="">-------------</option>
                                <option value="Consulta">Consulta</option>
                                <option value="Queja">Queja</option>
                            </select>  
                        </div>
                      </div>
                          
                      <div class="form-group floating-addon">
                        <label>Nombre</label>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <div class="input-group-text">
                              <i class="far fa-user"></i>
                            </div>
                          </div>
                            <input id="name" type="text" readonly="" class="form-control" name="nom"  value="<%=rs.getString("nom")%>">                       
                        </div>
                      </div>                            
                 
                      <div class="form-group">
                        <label>Mensaje</label>
                        <textarea class="form-control" name="mensaje" placeholder="Escribe tu mensaje..." data-height="200"></textarea>
                      </div>
                        <br>
                        <input id="name" type="hidden" readonly="" class="form-control" name="id_Pro"  value="<%=rs.getInt("id_Pro")%>">
                            <% }
                                    rs.close();
                                    ps.close();
                                }
                             catch (Exception e) {
                            }                        
                         
                    %>
                      <div class="form-group text-center">
                        <input type="submit" class="btn btn-round btn-lg btn-primary" value="Agregar" name="accion">
                           
                      </div>
                    </form>
                  </div>
                </div>
                <div class="col-12 col-md-12 col-lg-7 p-0">
                    <img class="imagen" src="Dev2/img/contacto.png">
                </div>
              </div>
            </div>
            <div class="simple-footer">
               <p>Derechos Reservados © iRent 2020</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
        
        <script src="js/app.min.js"></script>
        <script src="js/scripts.js"></script>  
  
    </body>
</html>
