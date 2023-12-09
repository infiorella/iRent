package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Principio_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>iRent</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/app.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/estilo.css\">\n");
      out.write("                  <script src=\"https://cdn.jsdelivr.net/npm/chart.js@2.8.0\"></script>\n");
      out.write("        <!--datables CSS básico-->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"datatables/datatables.min.css\"/>\n");
      out.write("        <!--datables estilo bootstrap 4 CSS-->  \n");
      out.write("        <link rel=\"stylesheet\"  type=\"text/css\" href=\"datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css\">            \n");
      out.write("        <script src=\"https://kit.fontawesome.com/9bb05c0e06.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("       <link rel=\"icon\" type=\"image/png\" href=\"Dev2/img/logo1.png\" />\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            img{\n");
      out.write("                width: 90%;\n");
      out.write("                display: block;\n");
      out.write("                margin: auto;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .img2{\n");
      out.write("                width: 60% !important;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            h2{\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("  <div id=\"app\">\n");
      out.write("    <section class=\"section\">\n");
      out.write("      <div class=\"container mt-5\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-12 col-md-10 offset-md-1 col-lg-10 offset-lg-1\">\n");
      out.write("            <div class=\"login-brand\">\n");
      out.write("              iRent\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card card-primary\">\n");
      out.write("              <div class=\"row m-0\">\n");
      out.write("                <div class=\"col-12 col-md-12 col-lg-5 p-0\">\n");
      out.write("                  <div class=\"card-body\">\n");
      out.write("                      <h2>Login Inquilino</h2>\n");
      out.write("                      <a href=\"index.jsp\"><img src=\"Dev2/img/indexInq.png\"></a>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                  <div class=\"col-12 col-md-12 col-lg-6 p-0\">\n");
      out.write("                  <div class=\"card-body\">\n");
      out.write("                      <h2>Login Propietario</h2>\n");
      out.write("                    <a class=\"img2\" href=\"indexPro.jsp\"><img src=\"Dev2/img/indexPro.png\"></a>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"simple-footer\">\n");
      out.write("              <p>Derechos Reservados © iRent 2020</p>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </section>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("        <!-- datatables JS -->\n");
      out.write("        <script src=\"https://unpkg.com/jquery@3.3.1/dist/jquery.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://cdn.datatables.net/v/dt/dt-1.10.22/datatables.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.22/b-1.6.5/b-flash-1.6.5/b-html5-1.6.5/b-print-1.6.5/datatables.min.js\"></script>  \n");
      out.write("    \n");
      out.write("        <!--Los del prooyecto--->\n");
      out.write("        <script src=\"funciones.js\"></script>\n");
      out.write("        <script src=\"js/app.min.js\"></script>\n");
      out.write("        <script src=\"js/scripts.js\"></script>       \n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
