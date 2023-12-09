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
<body>
        <div class="d-flex">
            <div class="col-sm-12 parte01">
                <div class="card">
                    <form action="Dev2_InqControlador" >
                        
                        <div class="card-body">
                            <div class="form-body">
                                <label>Datos del Inquilino</label>
                            </div>

                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                     <select name="id_Inq" class="form-control">
                                         <option value="${c.getId_Inq()}" >${c.getId_Inq()}</option>
                                        <%
                                          Conexion cn=new Conexion();
                                Connection con;   
                                PreparedStatement ps,ps2, ps3;
                                ResultSet rs, rs2, rs3;
                                 con=cn.getConnection();   
                                 con=cn.getConnection();                  
                                 try{
                                    String sql = "SELECT * FROM inquilino WHERE estado='2'";

                                    ps=con.prepareStatement(sql);

                                    rs=ps.executeQuery();

                                    while (rs.next()){ 
                                %>
                                    <option value="<%=rs.getInt("id_Inq") %>"><%=rs.getInt("id_Inq") %></option>
                                     <%  
                                        }
                                            rs.close();
                                            ps.close();
                                        } catch (Exception e) {
                                        }
                                        %>
                                     </select>
                                        <button type="submit" name="accion" value="buscar" class="btn btn-outline-info">Buscar</button>
                                </div> 
                                <div class="col-sm-6">
                                    <input type="text" name="nom" disabled="disabled"  value="${c.getNom()}" class="form-control" >
                                </div>   
                            </div>
                                
                            <div class="form-group d-flex">
                                <div class="col-sm-4 ">
                                    <label>Apellidos</label>
                                    <input type="text" name="ape" readonly=""  value="${c.getApe()}" class="form-control">
                               </div> 
                                <div class="col-sm-4">
                                     <label>Teléfono</label>
                                    <input type="text" name="tel" readonly=""    value="${c.getTel()}" class="form-control" >
                                </div>  
                                <div class="col-sm-4">
                                     <label>Fecha de Ingreso</label>
                                     <input type="date" name="fechaInf"    value="${c.getFechaIng()}" class="form-control" >
                                </div>   
                            </div>  
                                
                            <div class="form-group d-flex">
                                <div class="col-sm-4 ">
                                    <label>Tiempo</label>
                                    <input type="text" name="tiempo" readonly=""  value="${c.getTiempo()}" class="form-control">
                               </div> 
                                <div class="col-sm-4">
                                    <label>ID departamento</label>
                                    <input type="text" name="id_Dep" readonly=""   value="${id_Dep}" class="form-control" >                               
                                </div>  
                                <div class="col-sm-4">
                                     <label>Contraseña</label>
                               
                                    <input type="text" name="pase" readonly=""   value="${c.getPass()}" class="form-control" >
                                </div>   
                            </div>  
                             <input type="hidden" class="form-control" name="id_Pro" value="${id_Pro}">
                              <input type="hidden" class="form-control" name="pass" value="${pass}">
                            <div class="form-group">
                                <button type="submit" name="accion"  value="Registrar" class="btn btn-outline-info">Registrar</button>
                            </div>     
                        </div>
                    </form>
                </div>            
            </div>
        </div>
        
    </body>

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

