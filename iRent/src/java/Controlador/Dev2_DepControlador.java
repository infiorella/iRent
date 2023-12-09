 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Departamento;
import Modelo.Inquilino;
import ModeloDAO.DepartamentoDAO;
import ModeloDAO.InquilinoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
@WebServlet(name = "Dev2_DepControlador", urlPatterns = {"/Dev2_DepControlador"})
public class Dev2_DepControlador extends HttpServlet {
    String depListar="Pro/vistas/listarDep.jsp";
    String depAdd="Pro/vistas/addDep.jsp";
    String depEdit="Pro/vistas/editDep.jsp";

    DepartamentoDAO dedao=new DepartamentoDAO();
    Departamento dep=new Departamento();
    
    InquilinoDAO idao=new InquilinoDAO();
    Inquilino inq=new Inquilino();
    int r;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String acceso="";
        String accion=request.getParameter("accion");
        
        //listar empleado
        if (accion.equalsIgnoreCase("listar")){
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
            List<Departamento>list=dedao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(depListar).forward(request, response);
                         acceso=depListar;
        }  
        //eliminar
        else  if (accion.equalsIgnoreCase("eliminar")){
             String id_Dep=request.getParameter("id_Dep");
            dedao.eliminar(id_Dep);
            List<Departamento>list=dedao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(depListar).forward(request, response);
                         acceso=depListar;
        }        
        
        //agregar empleado
        else if(accion.equalsIgnoreCase("add")){
            acceso=depAdd;
            
       //otra forma de agegar empleado
       } else if(accion.equalsIgnoreCase("Agregar")){          
            String id_Dep=request.getParameter("id_Dep");
            int doDep=Integer.parseInt(request.getParameter("doDep"));
            int baDep=Integer.parseInt(request.getParameter("baDep"));                       
            String estado=request.getParameter("estado");
            double monto=Double.parseDouble(request.getParameter("monto"));         
            double area=Double.parseDouble(request.getParameter("area"));    
            String distrito=request.getParameter("distrito");            
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
            
            dep.setId_Dep(id_Dep);
            dep.setDoDep(doDep);
            dep.setBaDep(baDep);
            dep.setEstado(estado);
            dep.setMonto(monto);
            dep.setArea(area);
            dep.setDistrito(distrito);
            dep.setId_Pro(id_Pro);
            
            dedao.add(dep);
             List<Departamento>list=dedao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(depListar).forward(request, response);
       }
        
        //editar empleado
        else if(accion.equalsIgnoreCase("editar")){
             int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
             String pass=request.getParameter("pass");
            String id_Dep=request.getParameter("id_Dep");
            request.setAttribute("id_Dep", id_Dep); 
            request.setAttribute("id_Pro", id_Pro); 
             request.setAttribute("pass", pass); 
            
           acceso=depEdit;
       
       } else if(accion.equalsIgnoreCase("Actualizar")){
            String id_Dep=request.getParameter("id_Dep");
            
            String xdoDep=request.getParameter("doDep");
            int doDep=Integer.parseInt(xdoDep);
            
            String xbaDep=request.getParameter("baDep");
            int baDep=Integer.parseInt(xbaDep);
            
            String estado=request.getParameter("estado");
            
            String xmonto=request.getParameter("monto");
            double monto=Double.parseDouble(xmonto);
            
            String xarea=request.getParameter("area");
            double area=Double.parseDouble(xarea);
            
            String distrito=request.getParameter("distrito");           
            
            String xid_Pro=request.getParameter("id_Pro");
            int id_Pro=Integer.parseInt(xid_Pro);
            
            dep.setId_Dep(id_Dep);
            dep.setDoDep(doDep);
            dep.setBaDep(baDep);
            dep.setEstado(estado);
            dep.setMonto(monto);
            dep.setArea(area);
            dep.setDistrito(distrito);
            dep.setId_Pro(id_Pro);            
            
            dedao.edit(dep);
            
             List<Departamento>list=dedao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(depListar).forward(request, response);            

       }
        //editar empleado
        else if(accion.equalsIgnoreCase("detalles")){
             int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
             String pass=request.getParameter("pass");
            String id_Dep=request.getParameter("id_Dep");
            request.setAttribute("id_Dep", id_Dep); 
            request.setAttribute("id_Pro", id_Pro); 
             request.setAttribute("pass", pass); 
            
           acceso="Pro/vistas/detalles.jsp";
       
       }
          RequestDispatcher vista=request.getRequestDispatcher(acceso);
       vista.forward(request,response);
        
         
   }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
