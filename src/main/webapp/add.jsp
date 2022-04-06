<%-- 
    Document   : add
    Created on : 26/03/2022, 1:44:03 a. m.
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Registro</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar Persona</h1>
                <!-- formulario para ingresar los datos de la nueva persona a registar -->
                <form action="controlador">
                    ID:<br>
                    <input class="form-control" type="text" name="txtid"><br>
                    Nombre:<br>
                    <input class="form-control" type="text" name="txtnombre"><br>
                    Correo:<br>
                    <input class="form-control" type="text" name="txtcorreo"><br>
                    Telefono:<br>
                    <input class="form-control" type="text" name="txttelefono"><br>
                    Prestamo:<br>
                    <input class="form-control" type="text" name="txtprestamo"><br>
                    <div class="form-row">
                        <!-- boton para agregar a la persona a la base de datos y en la vista  lista html -->
                        <input class="btn btn-primary" type="submit" name="accion" value="Agregar"> 
                        <!-- boton para regresar a la vista listar -->
                        <a class="btn btn-primary" href="controlador?accion=listar">Regresar</a>
                    </div>
                </form>    
            </div>
        </div>
    </body>
</html>
