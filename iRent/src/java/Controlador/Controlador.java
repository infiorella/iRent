package Controlador;

import Modelo.Inquilino;
import ModeloDAO.InquilinoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class Controlador extends HttpServlet {
    String listar="Administrador/vistas/listarCliente.jsp";
String add="Administrador/vistas/addCliente.jsp";
String volver="Administrador/vistas/cliExitoso.jsp";

    InquilinoDAO dao=new InquilinoDAO();
    Inquilino inq=new Inquilino();
    int r;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion=request.getParameter("accion");
        
        HttpSession sesion = request.getSession();
        
        //VERIRFCAMOS QUE SE HA LOGEADO
            int id_Inq=Integer.parseInt(request.getParameter("id_Inq"));            
            String pass=request.getParameter("pass");                    
        
        //Ingresar
        if(accion.equals("Ingresar")){

            inq.setId_Inq(id_Inq);
            inq.setPass(pass);
            
            r=dao.validar(inq);
            
            if(r==1){
                request.getSession().setAttribute("id_Inq",id_Inq );
                request.getSession().setAttribute("pass",pass );
                
                request.getRequestDispatcher("Dev2/vistas/Principal.jsp").forward(request, response);
            }  else{
                request.getRequestDispatcher("Dev2/vistas/Principal.jsp").forward(request, response);
            }
        }else if(accion.equals("perfil")){
            request.getSession().setAttribute("id_Inq",id_Inq );
            request.getSession().setAttribute("pass",pass );
                
            request.getRequestDispatcher("Dev2/vistas/perfil.jsp").forward(request, response);
                
        }else if(accion.equals("index")){
            request.getSession().setAttribute("id_Inq",id_Inq );
            request.getSession().setAttribute("pass",pass );
                
            request.getRequestDispatcher("Dev2/vistas/Principal.jsp").forward(request, response);
                
        } else if(accion.equals("bitacora")){
            request.getSession().setAttribute("id_Inq",id_Inq );
            request.getSession().setAttribute("pass",pass );
                
            request.getRequestDispatcher("Dev2/vistas/hola.jsp").forward(request, response);
                
        } else if(accion.equals("movimientos")){
            request.getSession().setAttribute("id_Inq",id_Inq );
            request.getSession().setAttribute("pass",pass );
                
            request.getRequestDispatcher("Dev2/vistas/movimientos.jsp").forward(request, response);
                
        }
        
        
        //Salir
        if(accion.equals("Salir")){
            request.getSession().invalidate();
            request.getSession(false);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
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
