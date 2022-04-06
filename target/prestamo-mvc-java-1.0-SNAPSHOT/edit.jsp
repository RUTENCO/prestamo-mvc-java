<%-- 
    Document   : edit
    Created on : 26/03/2022, 1:43:44 a. m.
    Author     : Asus
--%> 

<%@page import="modelo.Persona"%>
<%@page import="modelodao.personaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Actualizar Datos</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <!-- obtenemo los datos de la persona a editar desde l base datos-->
                <%
                    personaDao dao = new personaDao();
                    int id = Integer.parseInt((String) request.getAttribute("idper"));
                    Persona p = (Persona) dao.list(id);
                %>
                <!-- mostramos en el formulario la informacion de la persona-->
                <h1>Modificar Persona</h1>
                <form action="controlador">
                    ID:<br>
                    <input class="form-control" type="text" name="txtid" value="<%=p.getId()%>"><br>
                    Nombre:<br>
                    <input class="form-control" type="text" name="txtnombre" value="<%=p.getNombre()%>"><br>
                    Correo:<br>
                    <input class="form-control" type="text" name="txtcorreo" value="<%=p.getCorreo()%>"><br>
                    Telefono:<br>
                    <input class="form-control" type="text" name="txttelefono" value="<%=p.getTelefono()%>"><br>
                    Prestamo:<br>
                    <input class="form-control" type="text" name="txtprestamo" value="<%=p.getValor_credito()%>"><br>
                    <input type="hidden" name="txtid" value="<%=p.getId()%>">
                    <div class="form-row">
                        <!-- boton para actualizar los datos en la base de datos y en la vista lista html-->
                        <input class="btn btn-primary" type="submit" name="accion" value="Actualizar">
                        <!-- boton para regresar a la vista de listar -->
                        <a class="btn btn-primary" href="controlador?accion=listar">Regresar</a>
                    </div>
                </form>   
            </div>
        </div>
    </body>
</html>
