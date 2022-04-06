
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Persona;
import modelodao.personaDao;


public class controlador extends HttpServlet {
    
//asignamos ruta de las vistas
     String listar="list.jsp";
     String add="add.jsp";
     String edit="edit.jsp";
     String calcular="show.jsp";
     Persona p= new Persona();
     personaDao dao= new personaDao();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        
        /*segun la accion que reciba el request desde el html 
        se efectuara el condicional con el parametro recibido
        
        */
        if (action.equalsIgnoreCase("listar")) {
            acceso=listar; //asignamo la ruta de la vista a llamar
        }else if(action.equalsIgnoreCase("add")){
            acceso=add; //asignamo la ruta de la vista a llamar
        }
        else if(action.equalsIgnoreCase("Agregar")){
            String id=request.getParameter("txtid");
            String nombre=request.getParameter("txtnombre");
            String correo=request.getParameter("txtcorreo");
            String telefono=request.getParameter("txttelefono");
            String prestamo=request.getParameter("txtprestamo");
            p.setId(Integer.valueOf(id));
            p.setNombre(nombre);
            p.setCorreo(correo);
            p.setTelefono(telefono);
            p.setValor_credito(Float.valueOf(prestamo));
            dao.add(p); //invocamos el metodo add 
            acceso=listar; //asignamo la ruta de la vista a llamar
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idper", request.getParameter("id"));
            acceso=edit; //asignamo la ruta de la vista a llamar
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            String id=request.getParameter("txtid");
            String nombre=request.getParameter("txtnombre");
            String correo=request.getParameter("txtcorreo");
            String telefono=request.getParameter("txttelefono");
            String prestamo=request.getParameter("txtprestamo");
            p.setId(Integer.valueOf(id));
            p.setNombre(nombre);
            p.setCorreo(correo);
            p.setTelefono(telefono);
            p.setValor_credito(Float.valueOf(prestamo));
            dao.edit(p); //invocamos el metodo edit
            acceso=listar; //asignamo la ruta de la vista a llamar
        }
        else if(action.equalsIgnoreCase("eliminar")){
            String id=request.getParameter("id");
            p.setId(Integer.valueOf(id));
            dao.eliminar(Integer.valueOf(id)); //invocamos el metodo eliminar
            acceso=listar; //asignamo la ruta de la vista a llamar
        }
        else if(action.equalsIgnoreCase("Buscar")){
             String dato=request.getParameter("txtbuscar");
             List<Persona> lista= dao.buscar(dato); //invocamos el metodo buscar que retorna una lista
             request.setAttribute("datos", lista);  
             acceso=listar; //asignamos la ruta de la vista a llamar
        }
        else if(action.equalsIgnoreCase("mostrar")){
            request.setAttribute("idper", request.getParameter("id"));
            acceso=calcular; //asignamos la ruta de la vista a llamar
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response); //llamamos la ruta de la vista a mostrar
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
