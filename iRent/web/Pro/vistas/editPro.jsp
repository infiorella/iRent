<%-- 
    Document   : index
    Created on : 21/10/2020, 10:32:10 AM
    Author     : Ana Vasquez
--%>

<%@page import="Modelo.Propietario"%>
<%@page import="ModeloDAO.PropietarioDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Editar Propietario</title>
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
            
            .btn-primary{
                background-color: #b22222 !important;
                border: #b22222;
            }
        </style>
    </head>
    <body>



            <div class="row">
              <div class="col-12 col-md-6 col-lg-6">
                <div class="card">
       
                    <div class="card-header has-icon">
                       <h4>Editar Empleado</h4>
                    </div>
                    <div class="card-body">
                
                 <form  action="Dev2_ProControlador">
                     
                    <table>
                          <c:forEach var='emp' items="${list}">
                      <tr> 
                          <td >
                          <!--Nombre-->
                          <div class="form-group">
                            <label>Nombre: </label><input type="text" class="form-control"  name="nomPro" value="${emp.getNomPro()}" />                    
                          </div>
                        </td>
                        
                        <td>
                          <!--Teléfono-->
                          <div class="form-group">
                            <label>Teléfono: </label> <input type="text" class="form-control" name="telPro" value="${emp.getTelPro()}" /> 
                          </div>
                        </td>  

                        <td>
                          <!--Nacionalidad-->
                          <div class="form-group">
                            <label>Nacionalidad: <input type="text" class="form-control"  name="nacionPro" value="${emp.getNacionPro()}" />
                          </div>
                        </td>  
                       
                      </tr>  

                      <tr>        
                        <td colspan="2">               
                          <div class="form-group ">
                            <label>Edad: </label><input type="text" class="form-control" name="edadPro" value="${emp.getEdadPro()}" />                         
                          </div>
                        </td> 
                        
                        <td>
                          <!--Contraseña-->
                          <div class="form-group">
                              <label>Contraseña: </label> <input class="form-control" type="password" name="pass" value="${emp.getPass()}" />
                          </div>
                        </td>  
                      </tr>                      
                      
                      <tr>
                          <td colspan="3">
                          <div class="card-footer text-right"><input class="btn btn-primary" type="submit"  value="Actualizar" name="accion" />                           
                          </div>
                        </td>  
                      </tr>
                    </c:forEach>
                    </table>  
                  </form>
                </div>
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