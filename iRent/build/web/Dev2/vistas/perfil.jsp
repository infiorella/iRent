<%-- 
    Document   : perfil
    Created on : 21/10/2020, 10:51:11 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil-iRent</title>
        
        <link rel="stylesheet" href="css/app.min.css">
        <link rel="stylesheet" href="css/estilo.css">
        <script src="https://kit.fontawesome.com/9bb05c0e06.js" crossorigin="anonymous"></script>
               <link rel="icon" type="image/png" href="Dev2/img/logo1.png" />
        <style type="text/css">
            .card-body img{
              width: 80%;
              display: block;
              margin:auto;
            }

            .pt-4, .py-4{
              padding-top: 0px !important;
            }
          </style>
  
    </head>
    <body>

        <div id="app">
            <div class="main-wrapper main-wrapper-1">
              <div class="navbar-bg"></div>
              <nav class="navbar navbar-expand-lg main-navbar sticky">
                <div class="form-inline mr-auto">
                  <ul class="navbar-nav mr-3">
                    <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
                                                                                collapse-btn"> <i data-feather="align-justify"></i></a></li>
                    <li><a href="#" class="nav-link nav-link-lg fullscreen-btn">
                        <i data-feather="maximize"></i>
                      </a></li>
                  </ul>
                </div>
                <ul class="navbar-nav navbar-right">
                  <li class="dropdown"><a href="#" data-toggle="dropdown"
                      class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="Dev2/img/icon1.png"
                        class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
                    <div class="dropdown-menu dropdown-menu-right pullDown">
                        <div class="dropdown-title">Hola,${id_Inq}</div>
                      
                      <div class="dropdown-divider"></div>
                      <form name="form1" action="salida.jsp"  method="POST">
                      <input name="id_Inq" hidden="" value="${id_Inq}"/> 
                        <input name="pass" hidden=""  value="${pass}"/>
                        <input type="submit" value="Salir" class="dropdown-item has-icon text-danger" name="salir" onclick="fecha()"/>
                  </form>
                    </div>
                  </li>
                </ul>
              </nav>
              <div class="main-sidebar sidebar-style-2">
                <aside id="sidebar-wrapper">
                  <div class="sidebar-brand">
                    <a href="Principal.jsp"> <img alt="image" src="Dev2/img/logo1.png" class="header-logo" /> <span
                        class="logo-name"><img alt="image" src="Dev2/img/logo2.png" class="header-logo" /></span>
                    </a>
                  </div>
                  <ul class="sidebar-menu">
                    <li class="menu-header">Main</li>
                    <li>
                      <a href="../../../../iRent/Controlador?&id_Inq=${id_Inq}&pass=${pass}&accion=index" class="nav-link"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a>
                    </li>


                    <li class="dropdown active">
                      <a class="nav-link" href="#"><i class="far fa-id-card"></i><span>Perfil</span>
                      </a>
                    </li>

                    <li>
                      <a class="nav-link" href="../../../../iRent/Controlador?&id_Inq=${id_Inq}&pass=${pass}&accion=movimientos"><i class="far fa-credit-card"></i><span>Movimientos</span>
                      </a>
                    </li>

                    <li>
                      <a class="nav-link" href="../../../../iRent/Controlador?&id_Inq=${id_Inq}&pass=${pass}&accion=bitacora"><i class="fas fa-book"></i><span>Bitacora</span>
                      </a>
                    </li>

                  </ul>
                  </ul>
                </aside>
              </div>
              <!-- Main Content -->
              <div class="main-content">
                <section class="section">
                  <div class="section-body">
                    <div class="row mt-sm-4">
                      <div class="col-12 col-md-12 col-lg-4">
                        <div class="card author-box">
                          <div class="card-body">
                            <div class="author-box-center">
                              <img alt="image" src="Dev2/img/icon1.png" class="rounded-circle author-box-picture">
                              <div class="clearfix"></div>
                              <br>
                              <div class="author-box-name"> <%
                    Conexion cn=new Conexion();
                    Connection con;   
                    PreparedStatement ps,ps2;
                    ResultSet rs, xrs,rs2;
                     con=cn.getConnection();              
                     int id_Inq= Integer.parseInt(request.getParameter("id_Inq"));
                    try{
                    
                     String sql = "SELECT * FROM inquilino WHERE id_Inq=?";
                     
                                ps=con.prepareStatement(sql);
                                
                                ps.setInt(1, id_Inq);
                                rs=ps.executeQuery();

                                        while (rs.next())
                                    {             
                    %>
                                <strong>Usuario: <%=rs.getString("nom")%></strong>
                              </div>
                              <br>
                              <div class="author-box-job">Departamento: <%=rs.getString("id_Dep")%></div>
                            </div>
                            
                          </div>
                        </div>
                        <div class="card">
                          <div class="card-header">
                            <h4>Detalles del departamento</h4>
                          </div>
                          <div class="card-body">
                            <div class="py-4">
                              <p class="clearfix">
                                <span class="float-left">
                                  Número de Habitaciones
                                </span>
                                  <%
                                   String id_Dep=rs.getString("id_Dep");
                                   try{
                                    String xsql = "SELECT * FROM departamento WHERE id_Dep=?";
                     
                                    ps2=con.prepareStatement(xsql);
                                
                                    ps2.setString(1, id_Dep);
                                    xrs=ps2.executeQuery();
                                  while (xrs.next()){   
                                    %>
                                <span class="float-right text-muted">
                                   <%=xrs.getInt("doDep")%>
                                </span>                                
                              </p>
                              
                              <p class="clearfix">
                                <span class="float-left">
                                  Número de Baños
                                </span>
                                <span class="float-right text-muted">
                                   <%=xrs.getInt("baDep")%>
                                </span>
                              </p>
                              <p class="clearfix">
                                <span class="float-left">
                                  Monto
                                </span>
                                <span class="float-right text-muted">
                                   <%=xrs.getString("monto")%>
                                </span>
                              </p>
                              <p class="clearfix">
                                <span class="float-left">
                                  Area
                                </span>
                                <span class="float-right text-muted">
                                   <%=xrs.getString("area")%> m<sup>2</sup>
                                </span>
                              </p>
                              <p class="clearfix">
                                <span class="float-left">
                                  Distrito
                                </span>
                                <span class="float-right text-muted">
                                   <%=xrs.getString("distrito")%>
                                </span>
                              </p>
                                    <% }
                                        xrs.close();
                                          rs.close();
                                          ps.close();
                                          ps2.close();
                                    } catch (Exception e) {
                                }
                            }           
                        }catch (Exception e) {
                        }
                    %>
                            </div>
                          </div>
                        </div>
                      </div>
                                


                      <div class="col-12 col-md-12 col-lg-8">
                        <div class="card">
                          <div class="padding-20">
                            <ul class="nav nav-tabs" id="myTab2" role="tablist">
                              <li class="nav-item">
                                <a class="nav-link active" id="home-tab2" data-toggle="tab" href="#home2" role="tab"
                                  aria-selected="true">Información</a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" id="profile-tab2" data-toggle="tab" href="#profile2" role="tab"
                                  aria-selected="true">Editar</a>
                              </li>
                            </ul>
                              
                            <div class="tab-content tab-bordered" id="myTab3Content">
                              <div class="tab-pane fade show active" id="home2" role="tabpanel" aria-labelledby="home-tab2">
                                <div class="row">
                                <%
                                try{
                                String sql = "SELECT * FROM inquilino WHERE id_Inq=?";                     
                                
                                ps=con.prepareStatement(sql);                                
                                ps.setInt(1, id_Inq);
                                rs=ps.executeQuery();

                                while (rs.next()){             
                                %>
                                    
                                  <div class="col-md-3 col-6 b-r">
                                    <strong>Nombre</strong>
                                    <br>
                                    <p class="text-muted"><%=rs.getString("nom")%></p>
                                  </div>
                                                                    
                                  <div class="col-md-3 col-6 b-r">
                                    <strong>Celular</strong>
                                    <br>
                                    <p class="text-muted"><%=rs.getString("tel")%></p>
                                  </div>
                                  
                                  <div class="col-md-3 col-6">
                                    <strong>Fecha de Ingreso</strong>
                                    <br>
                                    <p class="text-muted"><%=rs.getString("fechaIng")%></p>
                                  </div>
                                  
                                  <div class="col-md-3 col-6 b-r">
                                    <strong>Tiempo de Contrato</strong>
                                    <br>
                                    <p class="text-muted"><%=rs.getString("tiempo")%></p>
                                  </div>
                                </div>
                                  
                                <% }
                                    rs.close();
                                    ps.close();
                                    rs.close();
                                } catch (Exception e) {
                                }
                                %>
                                
                                
                                <div class="section-title">Servicios del departamento</div>
        
                                <%
                               try{
                                String sql = "SELECT * FROM inquilino WHERE id_Inq=?";
                     
                                ps=con.prepareStatement(sql);                               
                                ps.setInt(1, id_Inq);
                                rs=ps.executeQuery();

                                while (rs.next())
                                    {   
                                String id_Dep=rs.getString("id_Dep");
                                   try{
                                    String xsql = "SELECT * FROM servicio WHERE id_Dep=?";
                     
                                    ps2=con.prepareStatement(xsql);
                                
                                    ps2.setString(1, id_Dep);
                                    xrs=ps2.executeQuery();
                                  while (xrs.next()){   
                                    %>
                                                                   <ul>  
                                  <li>Servicio de <%=xrs.getString("nom")%></li>                                 
                                 </ul>
                                <%
                                    }
                                    xrs.close();
                                    ps2.close();
                                } catch (Exception e) {
                                }}
                                    } catch (Exception e) {
                                }
%>
                            
                               
                                <div class="section-title">Quejas/Sugerencias presentadas</div>
                            <%
                                try{
                                    String sql = "SELECT * FROM inquilino WHERE id_Inq=?";

                                    ps=con.prepareStatement(sql);
                                    ps.setInt(1, id_Inq);
                                    rs=ps.executeQuery();

                                    while (rs.next()){ 
                                    String sql2 = "SELECT * FROM bitacora WHERE id_Dep=?";

                                    ps2=con.prepareStatement(sql2);
                                    ps2.setString(1, rs.getString("id_Dep"));
                                    rs2=ps2.executeQuery();
                                    
                                    while(rs2.next()){
                                %>
                                <ul>

                                  <li><%=rs2.getString("mensaje")%>
                                  </li>
                                </ul>
                                <% 
                                    }
                                    rs2.close();
                                    ps2.close();
                                    rs2.close();
                                } 
                                    rs.close();
                                    ps.close();
                                    rs.close();
                                } catch (Exception e) {
                                }
                                %>
                            </div>
                                                                                           
                            </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </section>
            </div>
              <footer class="main-footer">
                <div class="center">
                    <p class="center">Derechos Reservados © iRent 2020</p>
               </div>
              </footer>
            </div>
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
