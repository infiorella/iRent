<%-- 
    Document   : prueba
    Created on : 27/11/2020, 10:10:44 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="#" />  
    <title>Tutorial DataTables</title>
      
    
    <!--font awesome con CDN-->  

    <script src="https://kit.fontawesome.com/9bb05c0e06.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.22/datatables.min.css"/>
    <style>
        .buttons-pdf {
            background-color: #e91e63 !important;
            color: #fff !important;
            border-radius: 5px !important;
            border: 0 !important;
            width: 100px;
            padding: 13px 13px 13px;
        }

        .btn-group-vertical>.btn, .btn-group>.btn {
            position: relative;
            -ms-flex: 1 1 auto;
            -webkit-box-flex: 1;
            flex: 1 1 auto;
        }

        .buttons-print {
            background-color: #6563ef !important;
            color: #fff !important;
            border-radius: 5px !important;
            border: 0 !important;
            width: 100px;
            padding: 13px 13px 13px;
        }

        .buttons-excel {
            background-color: #59bf70 !important;
            color: #fff !important;
            border-radius: 5px !important;
            border: 0 !important;
            width: 100px;
            padding: 13px 13px 13px;
        }
    </style>
  </head>
    
  <body> 
     <header>
         <h1 class="text-center text-light">DATATABLES</h1>
         <h2 class="text-center text-light">Cómo <span class="badge badge-warning">Personalizar</span></h2> 
     </header>    
    <div style="height:50px"></div>
     
    <!--Ejemplo tabla con DataTables-->
    <div class="container">
        <div class="row">
                <div class="card-body">
                    <div class="table-responsive">        
                        <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Puesto</th>
                                <th>Ciudad</th>                               
                                <th>Año de Ingreso</th>
                                <th>Salario</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Tiger Nixon</td>
                                <td>Arquitecto</td>
                                <td>Edinburgh</td>                                
                                <td>2011/04/25</td>
                                <td>$320,800</td>
                            </tr>
                            <tr>
                                <td>Garrett Winters</td>
                                <td>Contador</td>
                                <td>Tokyo</td>                                
                                <td>2011/07/25</td>
                                <td>$170,750</td>
                            </tr>                
                            <tr>
                                <td>Cedric Kelly</td>
                                <td>Senior Javascript Developer</td>
                                <td>Edinburgh</td>                                
                                <td>2012/03/29</td>
                                <td>$433,060</td>
                            </tr> 
                                   <tr>
                                <td>Jonas Alexander</td>
                                <td>Developer</td>
                                <td>San Francisco</td>                                
                                <td>2010/07/14</td>
                                <td>$86,500</td>
                            </tr>                           
                        </tbody>        
                       </table>                  
                    </div>
                </div>
        </div>  
    </div>    
     
    <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.22/datatables.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.22/b-1.6.5/b-flash-1.6.5/b-html5-1.6.5/b-print-1.6.5/datatables.min.js"></script>  
<script src="funciones.js"></script>
  </body>
</html>