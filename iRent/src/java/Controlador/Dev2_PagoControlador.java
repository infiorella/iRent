/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Pago;
import ModeloDAO.PagoDAO;
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
@WebServlet(name = "Dev2_PagoControlador", urlPatterns = {"/Dev2_PagoControlador"})
public class Dev2_PagoControlador extends HttpServlet {
    String paListar="Pro/vistas/listarPago.jsp";
    String paAdd="Pro/vistas/addPago.jsp";
    String paEdit="Pro/vistas/editPago.jsp";

    PagoDAO pdao=new PagoDAO();
    Pago pa=new Pago();
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
            List<Pago>list=pdao.listar();
            request.setAttribute("list", list);
            
            List<Pago>lista=pdao.listarb();
            request.setAttribute("lista", lista);
            
             int id_Pro=Integer.parseInt(request.getParameter("id_Pro"));
            String pass=request.getParameter("pass");
            request.setAttribute("id_Pro", id_Pro); 
            request.setAttribute("pass", pass); 
             
            request.getRequestDispatcher(paListar).forward(request, response);
                         acceso=paListar;
        } 
                        
        //agregar empleado
        else if(accion.equalsIgnoreCase("add")){
            acceso=paAdd;
            
       //otra forma de agegar empleado
       } else if(accion.equalsIgnoreCase("Agregar")){          
            String nomPago=request.getParameter("nomPago");
            String fechaVen=request.getParameter("fechaVen");       
            double monto=Double.parseDouble(request.getParameter("monto"));
            String id_Dep=request.getParameter("id_Dep");
            
            pa.setNomPago(nomPago);
            pa.setFechaVen(fechaVen);
            pa.setMonto(monto);
            pa.setId_Dep(id_Dep);
            
            pdao.add(pa);
             List<Pago>list=pdao.listar();
            request.setAttribute("list", list);
            
            List<Pago>lista=pdao.listarb();
            request.setAttribute("lista", lista);
            request.getRequestDispatcher(paListar).forward(request, response);
       }
        
        //editar empleado
        else if(accion.equalsIgnoreCase("editar")){
           acceso=paEdit;
       
       } else if(accion.equalsIgnoreCase("Actualizar")){
           int id_Pago=Integer.parseInt(request.getParameter("id_Pago"));
            String nomPago=request.getParameter("nomPago");
            String fechaVen=request.getParameter("fechaVen");

            String xmonto=request.getParameter("monto");
            double monto=Double.parseDouble(xmonto);
            
            String estado=request.getParameter("estado");
            String id_Dep=request.getParameter("id_Dep");
            
            pa.setId_Pago(id_Pago);
            pa.setNomPago(nomPago);
            pa.setFechaVen(fechaVen);
            pa.setMonto(monto);
            pa.setEstado(estado);
            pa.setId_Dep(id_Dep);
            
            pdao.edit(pa);
             List<Pago>list=pdao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(paListar).forward(request, response);
            

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
