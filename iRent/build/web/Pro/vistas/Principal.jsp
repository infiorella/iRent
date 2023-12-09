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
            body:not(.sidebar-mini) .sidebar-style-2 .sidebar-menu>li.active>a {
                color: #b22222;
            }
            
            canvas{
                width:100% !important;
                height:500px !important;
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
                  class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="Dev2/img/icono.png"
                    class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
                <div class="dropdown-menu dropdown-menu-right pullDown">
                  <div class="dropdown-title">Bievenido ${id_Pro}</div>

                  <div class="dropdown-divider"></div>
                  <form name="form1" action="salidaPro.jsp"  method="POST">
                      <input name="id_Pro" hidden="" value="${id_Pro}"/> 
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
                    class="logo-name"><img alt="image" src="Dev2/img/logo2.png" class="header-logo" />&nbsp<img alt="image" src="Dev2/img/logo3.png" class="header-logo" /></span>
                </a>
              </div>
              <ul class="sidebar-menu">
                <li class="menu-header">Main</li>
                <li class="dropdown active">
                  <a href=href="#" class="nav-link"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a>
                </li>


                <li>
                  <a class="nav-link" href="../../../../iRent/Dev2_ProControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=listar"><i class="far fa-id-card"></i><span>Perfil</span>
                  </a>
                </li>
                
                <li>
                  <a class="nav-link" href="../../../../iRent/Dev2_DepControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=listar"><i class="far fa-building"></i><span>Departamentos</span>
                  </a>
                </li>

                <li>
                  <a class="nav-link" href="../../../../iRent/Dev2_PagoControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=listar"><i class="far fa-credit-card"></i><span>Pagos</span>
                  </a>
                </li>
                
                <li>
                  <a class="nav-link" href="../../../../iRent/Dev2_BiControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=listar"><i class="fas fa-book"></i><span>Bitacora</span>
                  </a>
                </li>

                <li>
                  <a class="nav-link" href="../../../../iRent/Dev2_InqControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=listar"><i class="fas fa-users"></i><span>Inquilinos</span>
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
                     int id_Pro= Integer.parseInt(request.getParameter("id_Pro"));
                    try{
                    
                        String sql = "SELECT COUNT(*) FROM departamento WHERE id_Pro=?";
                     
                        ps=con.prepareStatement(sql);                                
                        ps.setInt(1, id_Pro);
                        rs=ps.executeQuery();

                        while (rs.next()){     
                    %>
                            <div class="card-content">
                              <h5 class="font-15">Cantidad de Departamento</h5>
                              <h2 class="mb-3 font-18"><%=rs.getInt("COUNT(*)")%></h2>
                            </div>
                          </div>
                            <% 
                        }
                            rs.close();
                            ps.close();
                            rs.close();
                        } catch (Exception e) {
                        }
                    %>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                            <div class="banner-img">
                              <img src="Dev2/img/pro4.png" alt="">
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
                                <%
                     con=cn.getConnection();              
                    try{
                    
                        String sql = "SELECT COUNT(*) FROM inquilino  WHERE id_Pro=? AND estado='1'";
                     
                        ps=con.prepareStatement(sql);                                
                        ps.setInt(1, id_Pro);
                        rs=ps.executeQuery();

                        while (rs.next()){     
                    %>
                              <h5 class="font-15">Cantidad de Inquilinos</h5>
                              <h2 class="mb-3 font-18"><%=rs.getInt("COUNT(*)")%></h2>
                            </div>
                             <% 
                        }
                            rs.close();
                            ps.close();
                            rs.close();
                        } catch (Exception e) {
                        }
                    %>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                            <div class="banner-img">
                              <img src="Dev2/img/pro3.png" alt="">
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
                                                <%
                    try{                    
                        String sql = "SELECT SUM(servicio.costo) FROM servicio JOIN departamento ON departamento.id_Dep=servicio.id_Dep WHERE departamento.id_Pro=?";
                       ps=con.prepareStatement(sql);
                                
                        ps.setInt(1, id_Pro);
                        rs=ps.executeQuery();

                        while (rs.next()){       
                    %>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                            <div class="card-content">
                              <h5 class="font-15">Gastos en servicios</h5>
                              <h2 class="mb-3 font-18"><%=rs.getDouble("SUM(servicio.costo)")%></h2>
                            </div>
                          </div>
                          
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                            <div class="banner-img">
                              <img src="Dev2/img/pro1.png" alt="">
                            </div>
                          </div>
                        </div>
                          <% }
                                    rs.close();
                                    ps.close();
                                }
                             catch (Exception e) {
                            }                   
                    %>
                      </div>
                    </div>
                  </div>
                </div>
                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                  <div class="card">
                    <div class="card-statistic-4">
                    <%
                    try{                    
                        String sql = "SELECT SUM(pago.monto) FROM pago JOIN departamento ON departamento.id_Dep=pago.id_Dep WHERE departamento.id_Pro=? AND MONTH(pago.fechaVen)=MONTH(NOW())";                     
                        ps=con.prepareStatement(sql);
                                
                        ps.setInt(1, id_Pro);
                        rs=ps.executeQuery();

                        while (rs.next()){       
                    %>
                      <div class="align-items-center justify-content-between">
                        <div class="row ">
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                            <div class="card-content">
                              <h5 class="font-15">Ganancia del Mes </h5>
                              <h2 class="mb-3 font-18"><%=rs.getDouble("SUM(pago.monto)")%></h2>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                            <div class="banner-img">
                              <img src="Dev2/img/pro2.png" alt="">
                            </div>
                          </div>
                        </div>
                      </div>
                        <% }
                                    rs.close();
                                    ps.close();
                                }
                             catch (Exception e) {
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
                        <div class="col-lg-12">
                            <div id="chart1">
                               
                               <canvas id="myChart" ></canvas>
                                 <%  try{                    
                String sql = "SELECT GROUP_CONCAT(DISTINCT  MONTH(fechaVen) SEPARATOR ',') FROM pago WHERE estado='Pagado'";                      
                ps=con.prepareStatement(sql);

                rs=ps.executeQuery();
                con=cn.getConnection();
                
                while (rs.next()){    
                    %>
<script>    
    
 new Chart(document.getElementById("myChart"), {
                    type: 'line',
    data: {
        labels: [ 8,9,10,11,12 ],
        datasets: [{
                data: [2500.00, 2550.00,2400.00, 2800.00, 2600.00], 
                label: "Ganancia",
                        borderColor: "#b22222",
                        fill: false                                   
        }]     
    
                    <%
         
}}catch (Exception e) {
            }                          
  
                    %>
    },
  options: {
    title: {
      display: true,
      text: 'Ganancia por Mes'  
    }
    }
});
</script> 

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
      
                    </section>
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
