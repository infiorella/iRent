/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Servicio;
import ModeloDAO.ServicioDAO;
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
@WebServlet(name = "Dev2_SerControlador", urlPatterns = {"/Dev2_SerControlador"})
public class Dev2_SerControlador extends HttpServlet {
String serListar="Pro/vistas/listarDep.jsp";
    String serAdd="Pro/vistas/addEmpleado.jsp";
    String serEdit="Pro/vistas/editEmpleado.jsp";

    ServicioDAO sdao=new ServicioDAO();
    Servicio ser=new Servicio();
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
            List<Servicio>list=sdao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(serListar).forward(request, response);
                         acceso=serListar;
        } 
        
                     
        //agregar empleado
        else if(accion.equalsIgnoreCase("add")){
            acceso=serAdd;
            
       //otra forma de agegar empleado
       } else if(accion.equalsIgnoreCase("Agregar")){          
            String nom=request.getParameter("nom");
            double costo=Double.parseDouble(request.getParameter("costo"));
            String id_Dep=request.getParameter("id_Dep");
            
            ser.setNom(nom);
            ser.setCosto(costo);
            ser.setId_Dep(id_Dep);
            
            sdao.add(ser);
             List<Servicio>list=sdao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(serListar).forward(request, response);
       }
        
        //editar
        else if(accion.equalsIgnoreCase("editar")){
            request.setAttribute("id_Ser", request.getParameter("id_Ser"));
           acceso=serEdit;
       
       } else if(accion.equalsIgnoreCase("Actualizar")){
            
            String nom=request.getParameter("nom");
            
            String xcosto=request.getParameter("costo");
            double costo=Double.parseDouble(xcosto);
            
            String id_Dep=request.getParameter("id_Dep");
            
            ser.setNom(nom);
            ser.setCosto(costo);
            ser.setId_Dep(id_Dep);
            
            sdao.edit(ser);
             List<Servicio>list=sdao.listar();
            request.setAttribute("list", list);
            request.getRequestDispatcher(serListar).forward(request, response);          

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
