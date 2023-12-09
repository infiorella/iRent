
package Controlador;

import Modelo.Propietario;
import ModeloDAO.PropietarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Dev2_ProControlador", urlPatterns = {"/Dev2_ProControlador"})
public class Dev2_ProControlador extends HttpServlet {
        String proListar="Pro/vistas/listarPro.jsp";
    String proEdit="Pro/vistas/editPro.jsp";
String proAdd="Pro/vistas/addPro.jsp";
    PropietarioDAO pdao=new PropietarioDAO();
    Propietario pro=new Propietario();
    int r;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion=request.getParameter("accion");
        
        int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));            
        String pass=request.getParameter("pass");    
        
         if(accion.equals("index")){
            request.getSession().setAttribute("id_Pro",id_Pro );
            request.getSession().setAttribute("pass",pass );
                
            request.getRequestDispatcher("Pro/vistas/Principal.jsp").forward(request, response);
                
        }
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);        
                int id_Pr=Integer.parseInt(request.getParameter("id_Pro"));
                String pas=request.getParameter("pass");
                
                request.setAttribute("id_Pro", id_Pr);
                request.setAttribute("pass", pas);
        String acceso="";
        String accion=request.getParameter("accion");
        
        //listar empleado
        if (accion.equalsIgnoreCase("listar")){
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
            List<Propietario>list=pdao.buscar(id_Pro);
            request.setAttribute("list", list);
            request.getRequestDispatcher(proListar).forward(request, response);
                         acceso=proListar;
        }                        
        //agregar empleado
        else if(accion.equalsIgnoreCase("add")){
            acceso=proAdd;
            
       //otra forma de agegar empleado
       } else if(accion.equalsIgnoreCase("Agregar")){      
           int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
            String nomPro=request.getParameter("nomPro");
            int telPro=Integer.parseInt(request.getParameter("telPro"));
            int edadPro=Integer.parseInt(request.getParameter("edadPro"));
            String pass=request.getParameter("pass");
            String nacionPro=request.getParameter("nacionPro");
            
            pro.setId_Pro(id_Pro);
            pro.setNomPro(nomPro);
            pro.setTelPro(telPro);
            pro.setEdadPro(edadPro);
            pro.setPass(pass);
            pro.setNacionPro(nacionPro);
            
            pdao.add(pro);
            request.getRequestDispatcher("indexPro.jsp").forward(request, response);
       }
       
        //Editar
        else if(accion.equalsIgnoreCase("editar")){
            
       request.setAttribute("id_Dep", request.getParameter("id_Dep"));
           acceso=proEdit;
       
       } else if(accion.equalsIgnoreCase("Actualizar")){
             String xid_Pro=request.getParameter("id_Pro");
            int id_Pro=Integer.parseInt(xid_Pro);
            
            String nomPro=request.getParameter("nomPro");
            
            String xtelPro=request.getParameter("telPro");
            int telPro=Integer.parseInt(xtelPro);
            
            String nacionPro=request.getParameter("nacionPro");
            
            String xedadPro=request.getParameter("edadPro");
            int edadPro=Integer.parseInt(xedadPro);
            
            String passe=request.getParameter("pass");
            
            pro.setNomPro(nomPro);
            pro.setTelPro(telPro);
            pro.setNacionPro(nacionPro);
            pro.setEdadPro(edadPro);
            pro.setPass(passe);
            pro.setId_Pro(id_Pro);
            
            pdao.edit(pro);
            
             List<Propietario>list=pdao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(proListar).forward(request, response);
                       String pass=request.getParameter("pass");
                       request.setAttribute("id_Pro", id_Pro);
            request.setAttribute("pass", pass);
             int num = 0; // Or a different default value
             try {
                 num = Integer.parseInt("id_Pro");
             } catch(NumberFormatException e) {
                 // log the error or ignore it
             }

       }
          RequestDispatcher vista=request.getRequestDispatcher(acceso);
       vista.forward(request,response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
