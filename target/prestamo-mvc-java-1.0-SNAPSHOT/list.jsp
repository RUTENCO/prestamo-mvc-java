<%-- 
    Document   : list
    Created on : 26/03/2022, 1:44:24 a. m.
    Author     : Asus
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Persona"%>
<%@page import="modelodao.personaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Inicio</title>
    </head>
    <body>
        <div class="container-fluid">
            <h1>Listado de Personas</h1>
            <!-- conjunto de botones (buscar y agregar nuevo) mas un txt de buscar -->
            <form>
                <div class="form-row">
                    <div class="col-sm-6 form-group my-4">
                        <a class="btn btn-success" href="controlador?accion=add">Agregar Nuevo</a>
                    </div>
                    <div class="col-sm-6 form-group my-4 form-inline">    
                        <input class="form-control" type="text" name="txtbuscar">
                        <input class="btn btn-success form-control" type="submit" value="Buscar">
                    </div>
                </div>
            </form>    
       
          <!-- tabla con los registro obtenido de la base de datos -->
            <div class="container-fluid">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">id</th>
                            <th class="text-center">nombre</th>
                            <th class="text-center">correo</th>
                            <th class="text-center">telefono</th>
                            <th class="text-center">prestamo</th>
                            <th class="text-center">acciones</th>

                        </tr>
                    </thead>
                    <% 
                        String idbuscar= request.getParameter("txtbuscar");
                        personaDao dao = new personaDao();
                        List<Persona> list;
                           if(idbuscar != null){ //condicional para listar peronas segun la busquedad
                            list = dao.buscar(idbuscar);
                           }else{
                            list = dao.listar(); //listar todos los registros de la base de datos
                           }
                        Iterator<Persona> iter = list.iterator();
                        Persona per = null;
                        while (iter.hasNext()) { //ciclo para estraer los registros uno por uno 
                            per = iter.next();//asignamos el registro al objeto perona

                    %>
                    <!-- asignamos valores a la tabla segun los registros en la base de datos -->
                    <tbody>
                        <tr>
                            <td class="text-center"><%= per.getId()%></td>
                            <td class="text-center"><%= per.getNombre()%></td>
                            <td class="text-center"><%= per.getCorreo()%></td>
                            <td class="text-center"><%= per.getTelefono()%></td>
                            <td class="text-center"><%= per.getValor_credito()%></td>
                            <td class="text-center">
                                <!-- conjunto de botones con las acciones de editar,eliminar,mostrar segun el id de la persona selecionada-->
                                <a class="btn btn-warning" href="controlador?accion=editar&id=<%= per.getId()%>">Editar</a>
                                <a class="btn btn-danger" href="controlador?accion=eliminar&id=<%= per.getId()%>">Remove</a>
                                <a class="btn btn-success" href="controlador?accion=mostrar&id=<%= per.getId()%>">Calcular plan de pagos</a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>    
        </div>    
    </body>
</html>
