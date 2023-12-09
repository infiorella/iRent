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
        <title>Pagos</title>
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
            
                        .btn{
                margin-right: 15px !important;
            }  
              body:not(.sidebar-mini) .sidebar-style-2 .sidebar-menu>li.active>a {
                color: #b22222;
            }
            
            button{
                border-radius: 80%;
            }
            
            .dataTables_filter{
              float: right;
            }
            
            .dataTables_paginate{
                float: right !important;
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
                <li >
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

                <li class="dropdown active">
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


<!-- Contenido Principal -->
      <div class="main-content">
        <section class="section">
            <div class="row">
            <div class="col-12">
              <div class="card">
                <br>
                <div class="card-header">

                  <h4>Lista de Pagos Actuales</h4> 
                  <span><a  href="Dev2_PagoControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=add"  class="btn btn-icon btn-warning"> Agregar Pago</a></span>
               
               </div>
                
                <div class="card-body">
                  <div class="table-responsive">
                    <table id="datatabless" class="table table-striped">
                        <thead>
                            <tr>
                                <th class="no-exportar">Id Pago</th>
                                <th>Id Departamento</th>
                                <th>Nombre</th>
                                <th>Fecha de Vencimiento</th>
                                <th>Monto Total</th>
                                <th>Estado</th>
                                <th  class="no-exportar">Acción</th>
                            </tr>
                        </thead>                   
                      
                    <tbody>
                        <c:forEach var='cli' items="${lista}">
                        <tr>
                            <td class="no-exportar">${cli.getId_Pago()}</td>
                            <td>${cli.getId_Dep()}</td>
                            <td>${cli.getNomPago()}</td>
                            <td>${cli.getFechaVen()}</td>
                            <td>${cli.getMonto()}</td>
                            <td>${cli.getEstado()}</td>
                            <td  class="no-exportar">
                                <a href="Dev2_PagoControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=editar&id_Pago=${cli.getId_Pago()}"  class="btn btn-icon btn-primary"><i class="fas fa-edit"></i> Editar</a>
                            </td>
                        </tr>
                        </c:forEach>
                    
                    </tbody>                
                    </table>                        
                        
                    <br>
                    
                  </div>
                  </div>
                </div>
              </div>
            </div>
          <div class="row">
            <div class="col-12">
              <div class="card">
                <br>
                <div class="card-header">

                  <h4>Lista de Pagos Anteriores</h4> 
               </div>
                
                <div class="card-body">
                  <div class="table-responsive">
                    <table id="datatable" class="table table-striped">
                        <thead>
                            <tr>
                                <th>Id Departamento</th>
                                <th>Nombre</th>
                                <th>Fecha de Vencimiento</th>
                                <th>Monto Total</th>
                                <th>Estado</th>
                                <th  class="no-exportar">Acción</th>
                            </tr>
                        </thead>                   
                      
                    <tbody>
                        <c:forEach var='cli' items="${list}">
                        <tr>
                            <td>${cli.getId_Dep()}</td>
                            <td>${cli.getNomPago()}</td>
                            <td>${cli.getFechaVen()}</td>
                            <td>${cli.getMonto()}</td>
                            <td>${cli.getEstado()}</td>
                            <td  class="no-exportar">
                                <a href="Dev2_PagoControlador?&id_Pro=${id_Pro}&pass=${pass}&accion=editar&id_Dep=${cli.getId_Dep()}"  class="btn btn-icon btn-primary"><i class="fas fa-edit"></i> Editar</a>
                            </td>
                        </tr>
                        </c:forEach>
                    
                    </tbody>                
                    </table>                        
                        
                    <br>
                    
                  </div>
                  </div>
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
               <script>
                    
                $(document).ready(function(){
            $("#datatable").DataTable({
                "bLengthChange": false,
                language: {                
                    "lengthMenu": "Mostrar _MENU_ registros",                
                    "zeroRecords": "No se encontraron resultados",                
                    "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",                
                    "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",             
                    "sSearch": "Buscar:",                
                    "oPaginate": {                    
                        "sFirst": "Primero",                    
                        "sLast":"%C3%9Altimo",                    
                        "sNext":"Siguiente",                    
                        "sPrevious": "Anterior"     
                    },     
                    "sProcessing":"Procesando..."           
                },
        
                //para usar los botones responsive: 
                responsive: "true",        
                dom: 'Bfrtilp',               
                buttons:[ 
                    {
                        extend:    'excelHtml5',
                        text:      '<i class="fas fa-file-excel"> Excel </i> ',
                        titleAttr: 'Exportar a Excel',
                        title: 'Reporte de Pagos Anteriores',
                        className: 'btn btn-success',
                        exportOptions: {
						columns: ":not(.no-exportar)"
					}
                    },
                    {
                        extend:    'pdfHtml5',
                        text:      '<i class="fas fa-file-pdf"> PDF </i> ',
                        titleAttr: 'Exportar a PDF',
                        title: 'Reporte de Pagos Anteriores',
                        className: 'btn btn-danger',
                        exportOptions: {
						columns: ":not(.no-exportar)"
                        }  ,             
                        customize: function ( doc ) {
                            doc.defaultStyle.fontSize = 11;
                            doc.styles.title = {
                            color: '#b22222',
                            fontSize: '28',
                            alignment: 'center'
                            }, 
                            doc.content[1].table.widths = [90,90,90,90,90];
                            doc.styles.tableHeader = {
                                bold: true,
                                fontSize: 11,
                                fillColor:'#DF0101',
                                color:'white',
                                alignment: 'center'
                              },   
                            doc.content.splice( 1, 0, {
                                margin: [ 0, 0, 0, 12 ],
                                alignment: 'center',
                                image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAAwCAYAAADzRIMRAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAABmJLR0QA/wD/AP+gvaeTAAAAB3RJTUUH5AwSETQyEPjqEQAAJGJJREFUeNrtnHeYVdX19z9rn3PPvXfu9GEGGLqggoIdMBo1mmgsMZqooDEWEDEW7FETy4/EGKMxlmDsFRQ1WKIYgwoqYoldFAEFYShDG6aX287Z6/3jnIFR0Ug0xbys57nMM8xuZ+/vWeW71r7ClxQRg6rlmsnK+ceLOeaUd3ZNFfU8SG1QpVgHjIpIXUfb+mdmPHLFa9fd96B/4oGCMQ7WBl92mi3yPyLypRuK4edXBVx9gcgJZ9b8KJ4ovkKEQSDuxlYaqMqywG+f+PCtw+8/+zer7OXnxbDWxxgXRZEuU1prERFUtwDvf03M5jTu1QeOHPPmVvFE6f+JMPiToAIQR0S3cmMFlxz0k78Oqd4KVBVjXKz1URsQBHmCII+1PmABwRh3c5axRb4BslnAshZinrOTiB30+cpOANkqWdhtt6Z6OPy4WVjrc8dflffaFBFxi0r6xAHufUZ5bX1+g0bbArD/Hdmsk8ykAdUU4HxRM9XgedeNv/fxwnqOOG4fHr1XOeynf6t66ZkhB445Z8VI0CSw5NnHFj417tCRc+97XoOa5XDJCaFPBmzxy77hslnA6mgDPl/Lqaqd5+fbb25av2DaeVcdsH7RB3DXdTcnn3/q0P179Bo5QcTsCSQ728e8wrHHT/jw3r9MefmeaXfuuaw4oUwYBSKyIVjYIt9M2XyNtUmRtWh+arptzW1Tbhq2cPKzyp7VIsedsXDHQUNHnSbiHAGUf7qTIANcJ3FpebftDhx7zrIb61a/+cRWg49onXijMvEMwZgQw9ZuAdg3TTbLx4pENHKwRCSt6k/PpFuPfeFvEy/6zsFDFy5XZfpDr1aPO3/1BQWF3aeJOCfTCSoRwC6yQe5VEWmPxnNEZHcvXnJLdb99bn/ojsV7Xv9/h7sTb1SCIIgiR4PIP7PULfKfks0/LUEEFPTdfK7tzNXLXz3h5J/3nnXu5Tfm/nzX5NTEc1ccWVa+7QOOk7gc1UEbu1Fn/eykdMf6H6+pff3wfK51Ati3JAwNAQpF3NEFBd0ePGrsHb/6eMH8rQBueUxRtajaLeD6Bslm8VgXXhVQs+iNH6aKe45oa1l970O3j1g06c/KhFHfMseeeueuyVS3MxzHOwwo6dIxjQ2ey2Sa//j6nMtnX3LtXdnVK+D844WjT35zq6KSvmMdN3aCKr3DDgpIoGrfDfyOGxvqFj920OjvNDc3wc9/KqEBFYNuce7/q2WzgHXMz+aytvaN5PKlM4Nrp9yfG7IjXPqzN/skU31OdF1vDDBApHNIUdD38/m2m+tWvTntiQcOr5+5EC4ad1GiZ++9vekPHtwy/W0Y+/3dYwcffe+IZKpygog5RJXCsL+iSrtq8HQ20zjp7y/95uVRx9+br+wJZx0tG7TXFgf/v1O+FLBCH0ewNmDKTCWZgruvf6qwe/VOh7qx+AQRsxsQ6zLcarX+fe0ttXfcf+tOi6a/qXrobmJ+etrCnb14arwYt18Q5O5fv/a9xydc+oOWfYfAD4+YWtyjz+6HeInSCYIzAjTkHVRRdFUQ5O5Pt627/f5bdlh03VQ493iBAEQ6m23RYP9N8oXA6sop/fy3SkER3PbbA5z9j5g0Ip4oO0OM+wMRKd44jHRYa5/OZ5omzXpqwsuPvvJkrncVnDX2tV5FZf1OcBxvrIhshSCqtFqbn5HNNE56+pGfvvq7O9/wxxwER455oW9Zt8EnOk58LEi/cFxFFasavOfn229qWL/g4UOOOrAxk4UJR3XSE86/HFxCaKg35+8iYRJLVenU5la/aJTNX8+n5xXAiKCbmMtEH/9LrH8DOESiF/zLiRH5fGB15ZHO+61yzS/gmFPeGlBY3GeM48ROQOnLBrOHBft2Ptd+09ramseefGivpunvwK1XP1rYveeIH7hu8nQxZiSf1Gqd2qjW2vyUtubldz5w2/DFT7wNh+0qzvFnfLhroqDiNBHncDb4bAqQtmpn5jKNk979++9nHzXu1twHb7/LA7fs/JW1lwMsGzKEZ1pa+HFZGc3W0tvzMMbQmM/zSlsbhwwaxNKaGspiMRb5PonoALOqDIzHKXddFqbTGBGKHQcXWJPPsyaf59b6eh5ubg7Bpkqw//68vGQJPeNxEiLU5vPkVSlzHHq6Lr4IrUFAh7W4IjhAXpWcKoEqSRGG9OrF/NpaurkubdYyIB5Hgdltbey7997IXXdtfD4RAlX6ATU77cQ632d1Po8rQkKE+ek0zaocW1pKAGSspTCVglwOIuoHawl8H4yh0fdpCAIUKDSG1iBg23gcMeazwOrqu1x4jTJ4GDw6eUZxZfcdDo/FEhPA7MInokldGQTZe1qbl915220ja678PVw3sdQZNebVEYlU5QRj3EPZ4Dd9LooVte9ls+k/tTYsfXjfw/Zs7GiFmU8+WFDd+1sHefGiMwWzB115N6Eu8LNTO9rW3jr1lh0XXHufcsNlV7NsyYX/tP/lAPf06sXTra3mgJKSnRxjtgZyhMCp+1tLy2unl5bm53d0JEo8b281picQRIjWDmvXJYzxTEiv+ALZnGpHexAsbgmCVb8YPLj1/WXLGHbCCZiJE8kPG8af1q/v2c3z9tRw+mS0jJyoZlXEAh7gCuR0o8IJjKptC4JZ+xQWrn+kubmin+ftCcQRCazqutXWvvHjZDI78KOPMMaEOVsgmDwZOf54pvbpM0yNGarh+IJqfWsQPP9eNpsdkUwO94ypzqsGFlqzQZB3RJLF4XokEHFUJImqIJIAnGh9MauaXuv7SzcAq6vZO+3CFqp6F/HQvWPcEd/6xR7xZPmZIu6BQKrLObRZzT+ZTTdNmvn4mNeOHv9ScNXF8NOTX+9fVNpvrOPETwT6bNbJCmm1OjOfa/7jvNdvePHgY67LbTcMHpnyRnVJWb/jjOONAwZ17aAafODn226pX7fgwUOP+f76he/B73/xz5lHAzzUvz/NQVBW4brTXJE9gGx02DWrc7nDTu7Wbel1dXW7bhOPP2yhF5ABgggAWQFXw40OoiEt0JhXnZuz9p53mpr+eky3btkZbW2cXlXF062tJ8aNuT4CjROByEaAVsDT8PcgNEi4gBHItgTB+GHJ5LQPs9mjEyJ/AuLRfM1Y+/vnampu+s2AAX5q6dIN5tHfeWd+8NFHyTHdut0cN+aYTvMm0Fjv+z9Z7/s12yQSjwpUazhPJpq/QVTTiKQiQHUDCoF2haSAVUgI2A5r55lQYRisDbA24PwrlT/9roiP5r056Nv7XnV5oqDqARH3iC6gCsD+PZ9r/dmqFa+M32bo1q9c+PuXgoXvvVA8/py1x5eUD/qz4yYu3mxQAShJETk0nii9f+c9f3nVkoUfDR79HWG7nYavuv2a7len2+tGqQZ3iNDY2UHEbB/ziq/p3mvElDnPrDzo+b/eEb/2fjhyzDxUg80iVxUYmkjgicRFpLuGoa1rwTrQLqrJ6BDcaFNjUTcF8oSgSgJxhWT0KVLoGxM5NOU4t48sLT3ziaamxGnl5bSHfleJQkE4LFmgQyMAqapo6A5lo7EhnNtTKAggZYGEMWUKxRq2abeQVJFzR/brd2Bq6VKCIUM2+EetuRxJx4nloSIayyV8zgTgpRwnLlCq4fN0KNQDaVQbFFpUtTGwttWq1imsV9VWVBtUtTXahwIgYTp9qXOvVG54QPl4waySk89fNba4dKtpxolfCFRv0A8iy63NXt7U+PGosy7pc/+Oux7W+sCNF7pz/750rz4DdrjTSyRuFjHDUf1KTKYqVeJ4ZxcUVj180vkrT//g7Zcqrp2qOmTHrd9Z+fEzZ+ZzbScKPCci+ahLXEQOTBYUTdlljyP+8M4ri7ebdtf2TPyTMnDwgRG56vzDeYXQD7Gh1nAjrbFWVN8HMioigSoBGA3VZS5q44QvHNloGJ+NiXqf8G32FUo8x/nljkVFPyqaP58Oa+lCELuoNqHaADQCrYSmpz16qTt97vponnSguqZQhC41SD6qmZy1H6lIqsCYq+/r2/dbJpmkFAhUaQpr4FRC4DSgWge0ROuXjO9LpD09QtB0vnOlCkkLC6wxTaraiOpSRDKIgEgW1WVABhFrJlwScOkNyvN/PSf29t8X7VvZc6d7nFjqRsXshGpn6qYFDe7LpptH3Ttp58v7bjV8xQ7lsHLpBwP3PPCCy714+YNgjkS14KsA6tPoAraPuak/lFdtf9+8N5YdNH3qxPjI/Y5J77R77ydampb9RG3+ImBhZwyiqhXGMaeniiofHnf++rPmvvZW5WmX/JXxF66J9p4v1F4iQpEIJSK4kEF1AaqvKrRFmsc4xqCfzFjkgTogJqEJbDLQYqBRoD3MUpAGmoGMhRIx5pRb+/ataAuBlWNjRBMH2gjjMDcar1IgLqGZqRAolrBD3hPRWBiBZQlD51ZE2uMirqguBUqKHOf82+vq+tXttBMA630fEyLFqGomr7o8ejlEwTiqOQNWoExEKkVkiEAvESkEHFV1XQiMSBNQLtBToLtAfxEZIOCLap17w6/hp6e+O3D4Hr8cb0zseFV6RIeKiPiq+qqfb5+0evmcp/b43uj2K+9Yxasz55SO//k2RxQUVZ8BZkeNAPivEFXiIAd68ZLhQ3c7/aHFCxfePOX0IfN+fZOuvew0ufa405c8nSxInSbGGw1URGsfEovFrq7sOeDg995Ycv2H86Y8d+rFZ2V/fbNy2anyBXMpRgQrYq2qxdo6RHwRKVJIq0jWWkv0vD4ieVSbgQ4VMfX5/BVrfH+FZ0xOVTUpUtrL875nRI4BWgm1ghXYLi4ytMxxZkvoo/nAaqAWkapAdbnCrCA0L/ghqFVCnydfYEyzr7p+XRC8U+662I2mdC2qy1SkXlTLUO0wxuzSw3Un3rZu3TkvDhzYFDcGETGq6okxhS4UARkJX4xcu+oKC7/Kqg4QyLkQc0XcwFrXiHxfII61KxDpqca4VnWyDytdkZSFQFSNhb+7p1xYN6qotO8FirPLRoAIIiyxNntHS0PtvaNO2XnV2y+P5vFHroltN+RH367ovt1ZiHuAqib50uzGVwZYhTjeaQUF3fcbd96KW99/88Wpt/xF161ezgdPPnThuTsMP/VJL15ylojso0pCVT3BHJBIlO86bJfT7mhct/B3u+25e5OIi6q/6TmAdUFARtV3RVaJMSpQpNauUJH1KZFGG7YzhKYyG0VFRVZ1cZvqI8eXlze1h5qIUhHuWLt25tDi4hINwbUWiCmUFBszaEUuNxtIotpIOGaRqBb4qrcced991zFhAmvzeboXFIDjgOtCPs/y1lbS1lLguhQ6DlnV9rhIW151qSuypikI3hZr86XGDLaqNSJyeK94fNldDQ1XXtGjR7Y1CPKuSAshUB1UURGjEP9ZVVW21HXvprAwpBliMfA8bv/ww6HV8fhBCn0RWSPQM2NtzYvt7ZefXVnZONDzwraqzG5qwjUmfqOqrewCkCYbZB9Jd6y98b6bdph7wZWqP9oNpt359jY77Hj8Ka7jHatKd74mkm9z0QUy2I0VXlVWOfQHrz63+IaP5k199qAjr8oUl/K31+fMfr2kZKvRrld4KpihEbFaIeKemk7Xv9i9F09FXN/nivV9xi5bVje1X7+HY44zQcHDmDUCHQ1BUOq6bp0nkib0ffKEvk13IOMAjUHAsIULkegP67bfvv21trYXcJyjgGJCh9+LQ3m561Lr+w3x0PytQ7VORdJGZODvR42qiIvkUsa4sZYWQZXl+XxQ7jj6bF1d+6GlpcFJ69ahw4fjiJRLWCXSrdXaRXFrxYf6NNTEoUxgnRH52cElJTXVRx55j3PDDRLRG9noYwgdf7fYddl14ULaQs1MkQhvDRmCGFNJaKqTQD9Eeonqqjj4zb7PzsuW0WYtMWtD3s3a3DIRtxIkpxrMyefb/rhk4V+e3efAM9M3TFVmz3iufNx5244qLul/Gpihql8+v/gvxJcnmO8mkhW7bL/L+Gk1ixbfdN9NW7/3qz9p/f+dLjcde+r85woKu53sOLFjVeku0Co4LfksfFGyQUTIAhdVVSUQ2YnQdDlAmQVbIBLg+3Qx/eURfqyv2jEvnfb3Lypi5eDBWBHqgoCqDz7gsQEDtnFClHdyXkEHtJc7Dm35fDoei5lAdY2qNsZgtQcDB8fj1wYhCKujAw0Gu25bDPJjqquv/2F5+ayT1q1jTTqNI6IKKReqUyLFvuo6Ba8jCJLxkB54BZEdkiKnPDJ58vyl2ey7Tqg9mxHxCE3phtftnXR6wy8OQDze6QuWI1KO6lpC/6qk1BjXAO+2t39iL93mpqVji0v6H4bqusaGRY9/5+A91/bsfSYzHrvcGzzs6H269djhLBH3u4Th6H+ZSJnjJMYXFCb2Pfn8dbcvnPv2lAdm65p5b7JwxiPnXLTT7uc96cYK9svns+/kM7nXl85ngxP/eYgVVYbF44UxkZ2xtkBV2xDBGFNiRMhHb5ZAgYZgWYdIqYFcteOkZre1xbK+bwMRTRqTeLRv3287IkdEh+gQOuLtGWtXrs7nKXLdKqDQESknpBFWA80C27silRoCywXUDbVLgMgrJJOzABp8n4gzA5F0oGqyxgz1RNriqmVBSD2sdeE1hcEJYyYeV1Z2iqrmVHWBhWIj0h9IC+SNfPLF6wSYiqQj6qMKEReIWdAmaxWRDYTdBmANGjz8/ZPO4f3X5sDcN6q4cGw/c/ixTwzeYbdTfuY43tFA5X8aPv8QXsLW4npXFJX2P/iZx1ZMamtc8vQho69rT6Z4/qKTeP7eGfD+Gz/k3BPh/LHmc0lTBVKuSy6flxgkRCSRU23wRHppeKBBIIJnTEgzqDpAHNU2Fwq2Kyi42RhTjutmFKwRSTjQz4b0y3KgEpGEhY+bguDdnCpueEguEM/B/Lzqx75qj6QxvheG7qWE5KvRCEBWte2d9esBiIVAsNF6xBMZGnecVIe10w2sdUUOtVAK1CCS8lXzfePxI90Q5IZQKwrgKHjpYBN7EwQ4GykNS7gOX0FURLKb8C3MFecKPzt8MpefMQbPhUOOenDPVFHvBx3Hm/BNANVGVGhMxHwnnii+O1Xa+6I7/rBXIp6Ao8e9ypUXHMsfLpMotfH5TLwAccfBh5iIFCGSiDtOpUDCQOCIODERcqoxBYuIh0i5qK43Ir1cY75rYKQR+bYrMtyEIfxc4HUn5HhaBTJpa+85s7Z2hddJXYgUItLXQHNrELwfg5UxkbyIuAK5sAoNI5CKPpW7fPhh12e3hDeGOwg5qZGeMb0XptNPKjzrivRUGAaUCqxyVHu54aUY10AxqrURWLRjU2XgjoNVjUm4RZ3cYV6AApCCKF/aVVxjXGZOPwlVJRa/GzGxbcEM+cJD/FT2OqTQdBPNPqVWP9UmvKz6yXx66Fxr10ab9Ir0czxwheIgyI9MFfVKGENm2t17A2y42/iF2CSsBgjCm25qoBvgEIbSzR2+b40qWWu73lTKIuJpGN01R8O0ZKx9QcDLqS4tcJytRXV7MaZPoPr4ymx28vqhQzUPfJzNxgjJ0YwjUlnpujsb6NEeBM8HIu/GRCoUegN5haQLaU9kpu6yC8fX1FAkgqua9kUaIlK3GMjkVcsn1tW1/cZxJg1NJrcxIjuimhboY1QXR3ftBJGSiK8MBHIVsdimNhtrTD4yhSGIwY2JuNWeR5HjfBZYG4lDpytCPjd7KyK1gZ95QUQbEKOqVlCqHDe5j6r26IKHWt/vmCMi60WMtdZPOCaxN2IGR6v9IJ9re9+NFe5GmP9rtzb3LKoZ48a/j2oZaEeQT7/s+x2ru+BLQZyYV7yjiDv0M+sL/7VdaZB/BKhPAD1kkcMwPNwHT8ObuYmkMQlxHNyQ8Y8TpnXWqEgloTPbTkgn5GIirq+qsfDg1DpOD1G9rS6Tue68Xr2a+s+bR81222Hb2zsPGIEyF74vqg/9ZPnyKRF4lY2ErACB7rdf8MjSpQxPJulQJQjNqYNqAtUcxvRR1ULAXDxw4IoHV668pMhxJluRUqy1McfZVUV6IFIEJKKfWTbBHYWG1uKomqispp3Q2ScAaQsCGv3P7u/m3RAV1tsgc/b0+0dNX7P6xXy0EBmyyxhv5F4X7x9PlP0RTH9gUSbdePqcZy+Y8/H8hzuTqWbMWUv3iyfLplobtOQyDePuv3WXd447bcFeXrzwHj/vP71w/uPnrlz0dG6/Q6+7OOYV/gK1U5Z9/LdfPvuXk9oFR5ANJTF69MnvDSsu6zNZhCGb9Qxf+HjhScZFYg54EfFosHYVxqgPLsaQC3OBnUCvIkzZWKv6VKDa4hmzv2PMIUa1VqBWoS+g7b4/44Dy8rXMmsWykhKaczkc1XZE/AikAxXSFnrc3a/fgJi1QR5i+dBBzrvGkLE2fu+iRcYYk16cza4qchzfhqx8GmiJojzHM6YDsBQUcPRll8174oorfitwHcbsSJgyshFgQ3BtTEd9VhwHE9IMbtTHF4gFqn59EGgePuu8b862+/mO92sWPzlz/EWzsytrFrPjiEHEPHT1KjKXT5DpJ51XO9J1C34Z+Nkpd18/4NnLbpjGvLdm0qP3cMorS4LaZcs+EnFac9nGj+e+cdMH19zTkr3nqpNeGL7/NQ+4sdiS7x0yrrmwaBzvvbH4zZhX2IaY975z8NiGAVv/kHy+g5KyvjQ1LKFHr614ada0BYNLq5c64nxtwFJV0tbSHgQ2ZYyNdtlgTCGQNiK2S8GbsLGCIWbhzTW53C9Pra1d+2i/fgfEHOd6RLZWqEIVVJOFsdgFz7S0fLTfyJGrdojH8cM3zo0OtR5oV9W0iBxUacwPcRwPSGmoNbORj9OZx2zYIZk8vc735xiRXJdEtgPYnLWFgKmvrQ2WXXMNhy1Z8thf+vcf5BhzsYY0STYCWCx6GJUwm7DJvQnCvKXRMHMQJ6qkyKuqu4k+XzpZLIDaoK2tqTbw8/DB23eXz3risR89+eADO1w+QTjvN0qmo+FjVdva3LRk0aQ/wwfvzCKTri9tbVq23bLF83bzvMKzVYPeoLnAz0lTIxxwzJ1+Y/2HU6zNLm5vg1QRiEggoZ09euHcRXvX131Qfvf1/WiqX0xL01Jn2eI3ew/cZpefGHGGf12g6pRYeDJBlGD2CTc8B+Bb66BKLHxjO6OAMFJSTbsi2VcHDdIfTZ/+dLu1f4w2vycipYgEwD4VjnPqb5ctc+YOHEiJ62LDKoAOVNuAQgmjNbGqy62qZ6FnBIQ+Ct0VelmotLB1XGSAI0I2vHiZQKQakaroXAWQhDHsumABC7fdNvB9/2arOqXL43a2DXOHEPu0r6wAuRzW2kDD3KcQpqfaAdeImNymosLN33qhui+UVw7u37Pvntf16L37jwFcD1StIqI2yAdFJTBgm+9SXrntd4tK+00tKh0w1TjuaeG5hMuLJ2DWk79i5YqX59WueHfOGRd26mJFURUxe6WKuz9eVrHtBQUF3WNDdhxEadmg7qUV296fTFXcIPL1Rq0KtIVRUaAhmAJCM5cCjCsSYO3G6oaNZTMBIGItmSBg0ejRfJzN/llVnyI0IQlCzRP3jBn3g+7dv9MUizEvk8EV6YiqA3qjGiPkx7yoXzthLrGzgsKNwJ4jjEpz28bjWGvbCSsbOi1QzAkjRJsqLcUBtq2uZv/i4uaVmczvVPUZQg3nsTHSy29KWwmgYZWoAomovMaP1pVHN076FYEFrc2Qz/nLMun2CzOZ9sdVlShKjWqTRB0HPnz/MepWvztnZc3s8WtWvj7O9zN3Ip3l1mGI+uaciQzbdZwdvvf+mX4iXVcUhhJWS0Wk0nE9cV0wxokBvTWqjfq6pTIWwxEJRMSPQnxPQh7IEVWbDgJi4EcqwUbJ26SA9UG3TiTYZsECLuzZs77J938NvBdVJnhRNqmHa8xvHmts3KbScVBrg6h/pYhsJdBHoJuI7CYivSTUjl5U7ZCIfnrR2tyPslkwxhVISpjaKRLw3OilYM4cEMF5/nlK5s/ntIEDl7dae5mG6+okex2BuFrr6SboBonHMeEciS570s2IWB9sofPZkqTN/noXAZrWQ+8B+9T3HjDgoXR7GE1dfK1inJhHyMuoGHjywR9z9q91nTGsi3mwYsncFcWl/Q+iM1TXkAa4/eoKOpkQ2Yi5jROGpqbrMv4ld74U6BOPs6ihoWV7Yx72RFY44Vq9PHyw1to1a4IAz5hlvurjNixmDKyqCWB2E2QrPQ+A+9au5YTXX//g4T32uNQx5pTomTvPkrhIv1W53EdZa5eqyLOE4IKQeIxHfIoSaqcEYcDQ6Q8FQKsTBB8VAa1B8JbAfQIVRqQMMIG1r+ueeyIRK96pi56ureXY6uq3Hl69+jxXZIJuLIeubw6C+Z0L1C57sqKjgxZrV1SoPkkI/Laoz3Ot1mYGJT6blNlcYAkCxoV7J22LIBQW92KNKmeNf6tbcWm//QRxBbSz9v66Szd2PvZU6QsUENa2Yi0Ul/ansX7RBs4rKiuTTU39rxYBeOstLp8xIzvqmGOur04k3D5BYIwx0gy5iTvvnJEZMwBW/LxbtzO6e54XqGprELA2l8ve3tSUeWz1agxwwpAh/HnECEbX1k6fWFX1QoHrSmfduQHpCIKOcuDKNWvmjK6oeMszxvGDQAF1RYwJqw1sQJhdRiMiJCRdbaBqX6+vb13b1sbZTU0L904kztw+mXQGJZOeACva2tpy+ZDLlOgShQG+/8orzNx7b46qqZl1RXX16461xhGRtLXBvQ0NbfX5/Gc4h+Nqaljn+6tGl5aeVug4Xt7aQEXIqmbO7tYtd+nKlV8ZWICgFv40LU9BIfxy/EQKgcKinkcY4/6I6GaRWjj1F60cddLLI1OFPX4s4iZSRT33U6jq/PqHIA+N9YsA+MFo5cmHBNENR/wpJGlkZ3UTf/sawRUB/IWtt87uXlycjefz1OXzrAkCZMYM9JBDoLUVv6GhY34+31HhOCzP5ejnuljf547dd8fMnInMnBmueq+9dMm6dS0YQ9IY1uTz+KqUiLBNjx60Wmu7x+NtSWPoZgwJY1jr+2RUw+y369JsLVlrCSKt7YSFiJycTFIyciQ9n3uOo7p1y2SB93O5dh/Yz/PYsW9fjl21akM/C8Sqq/FV0b32YlVTU6sJAlqsJSHCpSNGwBNPcEUXX8sCLwwdCskkq+vq2mtyufZqx6FfIkEe8N59F/isT7X5Gguksb6D+XPfift+UFJbM3HdpGmQzTS/47jJdSJUqKr4ASCK9TMp309Xx2KFBSJuaaSSBFGpXd7CwUc9k1KNdZ/xyOFL4onDP6+6S8BEUfu/7uZz5x09gH0XLdrkWpynngrbdrlnt+F+nzHcNWvWhv83IjgvvRS+EJvKFHz00T+8q/iPDoMlSxARjl67dsMzbJCams/08aN1mDlzPnuHcMEC2ER6xrz22if2aFPy6VPZPGBF6fxUcQFbDR5R2trcfty3v/fULXsfeHDb67N/9e4+B036mzjemESyd2G2A27+bTHAbOCVqp67yiGjHz8gnii+OyoiACzF5X2KHadi/KiTllxd2XNAQzYDYYTfdVoFY8hmIPBzXV2Gr13+0SFv6rLpBn/kU47vl7mY+lWq2jbM+0/Uxuk/+P2rrvFLR4UKGDeWLCrqFdtrf2hqWFngebEjBg0duvsZ58Nz8x7MGcerBWKpwpJ9H508rXCJKlNmafDAi5q56u43036+7S0RqTcmnojF+pshO5Zi/cCkCkv2KylLfffEs2D73UDELaYT9KH9SxWXDTBV1ZDLtadUNf4VzmOL/BtkMzSW4rqJXfsO+v7J0+5674WCwu6jrfV3iccLL/r5qe+rFy8q8eLFR4kYxDhH9hu43/oLxr48BaEpFisKbJDzUsXVx1rr9/LiqbIdhh9z1OwZrz5fXjFgtDHeMGvt+ddc/GGz6+azhYW9xrDhm/8Ux43v8b1Dbz/0mUdfnFtSvvUYVVv173Dmt8g/L5tlClW1JOYV/8qLl7SpakkUwOxXXNpvV1BHVYuilikxztkVVdv/BKSN0KGPA9WgCdCkFy/4Q1XP7RoIUx4JY2REaXmPhwiphbJPzix9E6lutyVT3VqiRHdsc9a9Rf798k9EhRr/lCkSVVu6iYYO0PPzLbQWfubqvWopnyeqpRoSlVvkGyAGul6v/08v5+uVdEf4c8s3Af77xQA0Bj6/ucUnmeJ/5IumVBvrFgaDd4JEURXWBlvA9W8WF2DcuHdpbaovSBV7eyUSZftEWYBvpKiC4yT67H3Q9aMnT3rmufam2iVXPPSfXtX/fyKNqpQCY89ZNT4WT/4OpVi+zBcd/FeLWlXySn7m+jXvn7jbXt9df8l4939DGX9DxJQCIuI4jjNMMGUS2gz9Zn9ERCRuTGKHZKqqIlHw2fr7LfKvFVdEmDxLg+enL/9bEGT2szYoFpH/wDXnr10MYp7IpBtX1q/d8iW4/275f2NuNXJQxO1iAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTEyLTE4VDE3OjUyOjUwKzAwOjAwNMSafAAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0xMi0xOFQxNzo1Mjo1MCswMDowMEWZIsAAAAAASUVORK5CYII='
                            } );
                        }            
                    },
                    {
                        extend:    'print',
                        text:      '<i class="fa fa-print"> Imprimir </i> ',
                        titleAttr: 'Imprimir',
                        className: 'btn btn-info',
                        exportOptions: {
						columns: ":not(.no-exportar)"
					}
                    }
                    
                ]            
            }); 
            
            
        });
        </script>
</body>
</html>

