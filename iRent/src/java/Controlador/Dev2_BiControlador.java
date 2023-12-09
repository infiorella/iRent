/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Bitacora;
import ModeloDAO.BitacoraDAO;
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
@WebServlet(name = "Dev2_BiControlador", urlPatterns = {"/Dev2_BiControlador"})
public class Dev2_BiControlador extends HttpServlet {
    String depListar="Pro/vistas/Bitacora.jsp";
         String regresar="Dev2/vistas/bitacoraenviada.jsp";
            BitacoraDAO edao=new BitacoraDAO();
    Bitacora bi=new Bitacora();
        
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
        
        if(accion.equalsIgnoreCase("Agregar")){          
            String id_Dep=request.getParameter("id_Dep");
            String tipo=request.getParameter("tipo");   
            String nom=request.getParameter("nom");
            String mensaje=request.getParameter("mensaje");   
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));   
            
            bi.setId_Dep(id_Dep);
            bi.setTipo(tipo);
            bi.setNom(nom);
            bi.setMensaje(mensaje);
            bi.setId_Pro(id_Pro);
            
            edao.add(bi);
            acceso=regresar;
       } 
        
        //listar empleado
        if (accion.equalsIgnoreCase("listar")){
            int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
            List<Bitacora>list=edao.buscar(id_Pro);
            request.setAttribute("list", list);
            request.getRequestDispatcher(depListar).forward(request, response);
                         acceso=depListar;
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
