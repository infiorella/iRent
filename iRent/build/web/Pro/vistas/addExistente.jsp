<%-- 
    Document   : index
    Created on : 21/10/2020, 10:32:10 AM
    Author     : Ana Vasquez
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ModeloDAO.InquilinoDAO"%>
<%@page import="Modelo.Inquilino"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Inquilino</title>
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
            
                        .btn-primary{
                background-color: #b22222 !important;
                border: #b22222;
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
                  <form name="form1" action="salida.jsp"  method="POST">
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
                <li>
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

                <li class="dropdown active">
                  <a class="nav-link" href="../../../../iRent/Dev2_InqControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=listar"><i class="fas fa-users"></i><span>Inquilinos</span>
                  </a>
                </li>

              </ul>
            </aside>
          </div>

    <div class="main-content">
        <section class="section">
          <div class="row">
            <div class="col-12">
                <div class="m-4" style="height: 550px;">
                <iframe src="Dev2_InqControlador?&id_Pro=${id_Pro}&pass=${pass}&id_Dep=${id_Dep}&accion=existente" style="height: 100%; width: 100%; border: none;"></iframe>
                </div>

            </div>
          </div>
        </section>
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

