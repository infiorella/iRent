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
        <title>Dashboard</title>
        <link rel="stylesheet" href="css/app.min.css">
        <link rel="stylesheet" href="css/estilo.css">
                  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
        <!--datables CSS básico-->
        <link rel="stylesheet" type="text/css" href="datatables/datatables.min.css"/>
        <!--datables estilo bootstrap 4 CSS-->  
        <link rel="stylesheet"  type="text/css" href="datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">            
        <script src="https://kit.fontawesome.com/9bb05c0e06.js" crossorigin="anonymous"></script>
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
        <script>
            function fecha()
            {
                var f=new Date();
                var mes=parseInt(f.getMonth())+1;
                if(mes<10) mes=0+mes;
                if(f.getDate()<10) f.getDate()=0+f.getDate();
                form1.txtfecha.value=f.getDate()+"/"+mes+"/"+f.getFullYear();
                
                myDate= new Date();
                hours=myDate.getHours();
                minutes=myDate.getMinutes();
                seconds=myDate.getSeconds();
                
                if(hours<10)hours="0"+hours;
                if(minutes<10) minutes="0"+minutes;
                if(seconds<10) seconds="0"+seconds;
                form1.txthora.value=(hours+":"+minutes+":"+seconds);
                setTimeout("showTime()",1000);
                
              }
            
        </script>
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
                  <div class="dropdown-title">Bievenido ${id_Inq}</div>

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
                <li class="dropdown active">
                  <a href=href="#" class="nav-link"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a>
                </li>


                <li>
                  <a class="nav-link" href="../../../../iRent/Controlador?&id_Inq=${id_Inq}&pass=${pass}&accion=perfil"><i class="far fa-id-card"></i><span>Perfil</span>
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
              <div class="row ">
                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                  <div class="card">
                    <div class="card-statistic-4">
                      <div class="align-items-center justify-content-between">
                        <div class="row ">
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                              <%
                     Conexion cn=new Conexion();
                    Connection con;   
                    PreparedStatement ps,ps2, ps3;
                    ResultSet rs, xrs, rs3;
                     con=cn.getConnection();              
                     int id_Inq= Integer.parseInt(request.getParameter("id_Inq"));
                    try{
                    
                        String sql = "SELECT * FROM inquilino WHERE id_Inq=?";
                     
                        ps=con.prepareStatement(sql);
                                
                        ps.setInt(1, id_Inq);
                        rs=ps.executeQuery();

                        while (rs.next()){             
                            String id_Dep=rs.getString("id_Dep");
                            try{
                                String xsql = "SELECT * FROM departamento WHERE id_Dep=?";
                     
                                ps2=con.prepareStatement(xsql);
                                
                                ps2.setString(1, id_Dep);
                                xrs=ps2.executeQuery();
                               while (xrs.next()){  
                    %>
                            <div class="card-content">
                              <h5 class="font-15">Alquiler</h5>
                              <h2 class="mb-3 font-18"><%=xrs.getDouble("monto")%></h2>
                            </div>
                          </div>
                            
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                            <div class="banner-img">
                              <img src="Dev2/img/alquiler.png" alt="">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                  <div class="card">
                    <div class="card-statistic-4">
                      <div class="align-items-center justify-content-between">
                        <div class="row ">
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                            <div class="card-content">
                              <h5 class="font-15">Habitaciones</h5>
                              <h2 class="mb-3 font-18"><%=xrs.getInt("doDep")+xrs.getInt("baDep")%></h2>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                            <div class="banner-img">
                              <img src="Dev2/img/dormitorio.png" alt="">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                          
                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                  <div class="card">
                    <div class="card-statistic-4">
                      <div class="align-items-center justify-content-between">
                        <div class="row ">
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                            <div class="card-content">
                              <h5 class="font-15">Distrito</h5>
                              <h2 class="mb-3 font-18">San Isidro</h2>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                            <div class="banner-img">
                              <img src="Dev2/img/distrito.png" alt="">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div> <% }
                                    xrs.close();
                                    rs.close();
                                    ps.close();
                                    ps2.close();
                                }
                             catch (Exception e) {
                            }
                        }
                            rs.close();
                            ps.close();
                            rs.close();
                        } catch (Exception e) {
                        }
                    %>
                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                  <div class="card">
                    <div class="card-statistic-4">
                    <%
                    try{                    
                        String sql = "SELECT * FROM inquilino WHERE id_Inq=?";                     
                        ps=con.prepareStatement(sql);
                                
                        ps.setInt(1, id_Inq);
                        rs=ps.executeQuery();

                        while (rs.next()){             
                            String id_Dep=rs.getString("id_Dep");
                            try{
                                String xsql = "SELECT COUNT(*) FROM servicio WHERE id_Dep=?";
                     
                                ps2=con.prepareStatement(xsql);
                                
                                ps2.setString(1, id_Dep);
                                xrs=ps2.executeQuery();
                               while (xrs.next()){  
                    %>
                      <div class="align-items-center justify-content-between">
                        <div class="row ">
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                            <div class="card-content">
                              <h5 class="font-15">Servicios </h5>
                              <h2 class="mb-3 font-18"><%=xrs.getInt("COUNT(*)")%></h2>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                            <div class="banner-img">
                              <img src="Dev2/img/servicios.png" alt="">
                            </div>
                          </div>
                        </div>
                      </div>
                        <% }
                                    xrs.close();
                                    rs.close();
                                    ps.close();
                                    ps2.close();
                                }
                             catch (Exception e) {
                            }
                        } 
                        }catch (Exception e) {
                            }                        
                    %>
                    </div>
                  </div>
                </div>          
              </div>
                          
              <div class="row">
                <div class="col-12 col-sm-12 col-lg-12">
                  <div class="card ">
                    <div class="card-header">
                      <h4>Gráfico de Pagos</h4>              
                    </div>
                    <div class="card-body">
                      <div class="row">
                        <div class="col-lg-9">
                            <div id="chart1">
                               
                               <canvas id="myChart" width="400" height="400"></canvas>
                                 <%  try{                    
                String sql = "SELECT * FROM inquilino WHERE id_Inq=?";                     
                ps=con.prepareStatement(sql);

                ps.setInt(1, id_Inq);
                rs=ps.executeQuery();
                con=cn.getConnection();
                
                while (rs.next()){             
                    String id_Dep=rs.getString("id_Dep"); 
                    String sql3 = "SELECT GROUP_CONCAT(monto SEPARATOR ','), GROUP_CONCAT(MONTH(fechaVen) SEPARATOR ',') FROM pago WHERE id_Dep=?";                     
                    ps3=con.prepareStatement(sql3);
                                
                    ps3.setString(1, id_Dep);
                    rs3=ps3.executeQuery();

                    while (rs3.next()){    
                    %>
                             
<script>    
 new Chart(document.getElementById("myChart"), {
                    type: 'line',
    data: {
        labels: [ <%=rs3.getString("GROUP_CONCAT(MONTH(fechaVen) SEPARATOR ',')")%> ],
        datasets: [{
                data: [<%=rs3.getString("GROUP_CONCAT(monto SEPARATOR ',')")%>], 
                label: "Pagos a realizar",
                        borderColor: "#00a86b",
                        fill: false                                   
        }]     
    
                    <%
                }
                rs.close();
                ps.close();
}}catch (Exception e) {
            }                          
  
                    %>
    },
  options: {
    title: {
      display: true,
      text: 'Pagos por mes'  
    }
    }
});
</script> 
                            </div>
                        </div>
                        <div class="col-lg-3">
                          <div class="row mt-5">
                            <div class="col-7 col-xl-7 mb-3">Alquiler</div>
                            <div class="col-5 col-xl-5 mb-3">
                              <span class="text-big">S/. 2000</span>
                            </div>
                            <div class="col-7 col-xl-7 mb-3">Gastos de Servicio</div>
                            <div class="col-5 col-xl-5 mb-3">
                              <span class="text-big">S/. 200</span>
                            </div>
                            <div class="col-7 col-xl-7 mb-3">Mantenimiento</div>
                            <div class="col-5 col-xl-5 mb-3">
                              <span class="text-big">S/. 50</span>
                            </div>
                            <div class="col-7 col-xl-7 mb-3">Gastos Totales</div>
                            <div class="col-5 col-xl-5 mb-3">
                              <span class="text-big">S/. 2200</span>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>


          <footer class="main-footer">
            <div class="footer-left">
             <p>Derechos Reservados © iRent 2020</p>
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
