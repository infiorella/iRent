<%-- 
    Document   : indexPro
    Created on : 08/12/2020, 07:15:54 PM
    Author     : USER
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iRent-Login</title>
        <link rel="stylesheet" href="css/app.min.css">
        <link rel="stylesheet" href="css/style.css">
       <link rel="icon" type="image/png" href="Dev2/img/logo1.png" />
        <script src="https://kit.fontawesome.com/9bb05c0e06.js" crossorigin="anonymous"></script>
        <style>
            .card-body img{
                width: 70%;
            }
            
            .card-body .logo3{
                width: 8%;
            }
            
            .btn-primary{
                background-color: #b22222 !important;
                border: #b22222;
            }
            
            .card.card-primary{
                border-top: 2px solid #b22222 !important;
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
        <section class="section">
          <div class="container mt-5">
            <div class="row">
              <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                <div class="card card-primary">
                  <div class="card-header">
                    <h4>Login-Propietario</h4>
                    
                  </div>
                  <div class="card-body">
                      <div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src="Dev2/img/logo.png">&nbsp&nbsp&nbsp<img class="logo3" src="Dev2/img/logo3.png"></div>
                      <br>
                      <form class="form1" action="validaPropietario.jsp">
                      <div class="form-group">
                        <label for="text">ID</label>
                        <input id="text" type="text" class="form-control" required="" name="id_Pro"  autofocus>
                      </div>
                        
                      <div class="form-group">
                        <div class="d-block">
                          <label for="pass" class="control-label">Contraseña</label>
                        </div>                          
                        <input id="password" type="password" class="form-control" name="pass" required="">
                      </div>
                      <div class="form-group">
                        <button type="submit" name="accion" class="btn btn-primary btn-lg btn-block" onclick="fecha()" tabindex="4" value="Ingresar">
                         Ingresar
                        </button>
                      </div>
                    </form> <div class="mt-5 text-muted text-center">
                       ¿No tienes cuenta? <a href="addPro.jsp">Crea una</a>
                    </div>
                  </div>
                   
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