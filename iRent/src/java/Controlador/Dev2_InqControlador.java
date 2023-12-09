
package Controlador;

import Modelo.Departamento;
import Modelo.Inquilino;
import ModeloDAO.DepartamentoDAO;
import ModeloDAO.InquilinoDAO;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "Dev2_InqControlador", urlPatterns = {"/Dev2_InqControlador"})
public class Dev2_InqControlador extends HttpServlet {
    Inquilino emp=new Inquilino();
    InquilinoDAO edao=new InquilinoDAO();
    Departamento de=new Departamento();
    DepartamentoDAO dedao=new DepartamentoDAO();
    String inqListar="Pro/vistas/listarInq.jsp";
    String inqAdd="Pro/vistas/addInq.jsp";
    String inqEdit="Pro/vistas/editInq.jsp";
            String existe="Pro/vistas/exist.jsp";

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
        
       
        if(accion.equalsIgnoreCase("buscar")){
            int id_Inq=Integer.parseInt(request.getParameter("id_Inq"));          
            emp=edao.buscar(id_Inq);
            String id_Dep=request.getParameter("id_Dep");  
            request.setAttribute("id_Dep", id_Dep);
            request.setAttribute("c",emp);
             request.getRequestDispatcher("Pro/vistas/exist.jsp").forward(request, response);         
        }
                
        //listar empleado
        else if (accion.equalsIgnoreCase("listar")){
            //List<Inquilino>list=edao.buscarInquilino(inqAdd); 
            //request.setAttribute("list", list);
            request.getRequestDispatcher(inqListar).forward(request, response);
                         acceso=inqListar;
        } 
        
        //registrar a un ya ingresado
        else if(accion.equalsIgnoreCase("Registrar")){
            String xid_Inq=request.getParameter("id_Inq");
            int id_Inq=Integer.parseInt(xid_Inq);                        
                       
            int tiempo=Integer.parseInt(request.getParameter("tiempo"));
            
            String id_Dep=request.getParameter("id_Dep");
            
            emp.setId_Inq(id_Inq);
            emp.setTiempo(tiempo);
            emp.setId_Dep(id_Dep);

            edao.registrar(emp);
            
            dedao.actualizar(id_Dep);            

             String pass=request.getParameter("pass");            
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
            request.setAttribute("id_Pro", id_Pro); 
             request.setAttribute("pass", pass); 
             
             
             List<Inquilino>list=edao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(existe).forward(request, response);

        }
         //agregar ya existente
        else if(accion.equalsIgnoreCase("registra")){
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));                     
            String pass=request.getParameter("pass");  
             String id_Dep=request.getParameter("id_Dep");  
             List<Departamento>list=dedao.buscarDeps(id_Pro);
            request.setAttribute("list", list);
             request.setAttribute("id_Pro", id_Pro); 
            request.setAttribute("pass", pass); 
            request.setAttribute("id_Dep", id_Dep); 
            acceso="Pro/vistas/addExistente.jsp";
            
       //otra forma de agegar empleado
       }          //agregar ya existente
        else if(accion.equalsIgnoreCase("existente")){
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));                     
            String pass=request.getParameter("pass");  
            String id_Dep=request.getParameter("id_Dep");  
            List<Departamento>list=dedao.buscarDeps(id_Pro);
            request.setAttribute("list", list);
             request.setAttribute("id_Pro", id_Pro); 
            request.setAttribute("pass", pass); 
            request.setAttribute("id_Dep", id_Dep); 
            acceso="Pro/vistas/exist.jsp";
            
       //otra forma de agegar empleado
       }
                               
        //Salir 
        else if(accion.equals("Salir")){
            request.getSession().invalidate();
            request.getSession(false);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
                //eliminar empleado
        else if(accion.equalsIgnoreCase("eliminar")){
            int id_Inq=Integer.parseInt(request.getParameter("id_Inq"));
             String id_Dep=request.getParameter("id_Dep");
            edao.eliminar(id_Inq,id_Dep);
            
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));                     
             List<Departamento>list=dedao.buscarDeps(id_Pro);
            request.setAttribute("list", list);
            acceso=inqListar;
        }
        //agregar empleado
        else if(accion.equalsIgnoreCase("nuevo")){
            String id_Dep=request.getParameter("id_Dep");  
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));                     
             List<Departamento>list=dedao.buscarDeps(id_Pro);
             request.setAttribute("id_Dep", id_Dep); 
            request.setAttribute("list", list);
            acceso="Pro/vistas/addNuevo.jsp";
        }
        
        //agregar empleado
        else if(accion.equalsIgnoreCase("add")){
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));                     
             List<Departamento>list=dedao.buscarDeps(id_Pro);
            request.setAttribute("list", list);
            acceso=inqAdd;
            
       //otra forma de agegar empleado
       } else if(accion.equalsIgnoreCase("Agregar")){    
            int id_Inq=Integer.parseInt(request.getParameter("id_Inq"));
            String nom=request.getParameter("nom");
            String ape=request.getParameter("ape");            
            int tel=Integer.parseInt(request.getParameter("tel"));
            String fechaIng=request.getParameter("fechaIng");
            int tiempo=Integer.parseInt(request.getParameter("tiempo"));
            String id_Dep=request.getParameter("id_Dep");
            String pase=request.getParameter("pase");
            int id_P=Integer.parseInt(request.getParameter("id_P"));
            int estado=Integer.parseInt(request.getParameter("estado"));
            emp.setId_Inq(id_Inq);
            emp.setNom(nom);
            emp.setApe(ape);
            emp.setTel(tel);
             emp.setPass(pase);
            emp.setFechaIng(fechaIng);
            emp.setTiempo(tiempo);
            emp.setId_Pro(id_P); 
            emp.setEstado(estado);
            edao.add(emp);            
            dedao.actualizar(id_Dep);
            
            String pass=request.getParameter("pass");            
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
            request.setAttribute("id_Pro", id_Pro); 
             request.setAttribute("pass", pass); 
             
             
             List<Inquilino>list=edao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(inqListar).forward(request, response);
       }
        else if(accion.equalsIgnoreCase("Agrega")){    
            int id_Inq=Integer.parseInt(request.getParameter("id_Inq"));
            String nom=request.getParameter("nom");
            String ape=request.getParameter("ape");            
            int tel=Integer.parseInt(request.getParameter("tel"));
            String fechaIng=request.getParameter("fechaIng");
            int tiempo=Integer.parseInt(request.getParameter("tiempo"));
            String id_Dep=request.getParameter("id_Dep");
            String pase=request.getParameter("pase");
            int id_P=Integer.parseInt(request.getParameter("id_P"));
            int estado=Integer.parseInt(request.getParameter("estado"));
            emp.setId_Inq(id_Inq);
            emp.setNom(nom);
            emp.setApe(ape);
            emp.setTel(tel);
             emp.setPass(pase);
            emp.setFechaIng(fechaIng);
            emp.setTiempo(tiempo);
            emp.setId_Pro(id_P); 
            emp.setEstado(estado);
            edao.add(emp);            
            
            String pass=request.getParameter("pass");            
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
            request.setAttribute("id_Pro", id_Pro); 
             request.setAttribute("pass", pass); 
             
             
             List<Inquilino>list=edao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(inqListar).forward(request, response);
       }
        
        //editar empleado
        else if(accion.equalsIgnoreCase("editar")){
            request.setAttribute("id_Inq", request.getParameter("id_Inq"));
           acceso=inqEdit;
       
       } else if(accion.equalsIgnoreCase("Actualizar")){
            
            String nom=request.getParameter("nom");
            String ape=request.getParameter("ape");
            
            String xtel=request.getParameter("tel");
            int tel=Integer.parseInt(xtel);
            
            String fechaIng=request.getParameter("fechaIng");
            
            String xtiempo=request.getParameter("tiempo");
            int tiempo=Integer.parseInt(xtiempo);
            
            String id_Dep=request.getParameter("id_Dep");
            
            String pass=request.getParameter("pass");
            
            emp.setNom(nom);
            emp.setApe(ape);
            emp.setTel(tel);
            emp.setFechaIng(fechaIng);
            emp.setTiempo(tiempo);
            emp.setId_Dep(id_Dep);
            emp.setPass(pass);
            
            edao.edit(emp);
             List<Inquilino>list=edao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(inqListar).forward(request, response);
            
             int num = 0; // Or a different default value
             try {
                 num = Integer.parseInt("id_Inq");
             } catch(NumberFormatException e) {
                 // log the error or ignore it
             }

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
