<%-- 
    Document   : show
    Created on : 2/04/2022, 6:42:20 p. m.
    Author     : Asus
--%>


<!-- codigo inspirado de xve de
https://www.lawebdelprogramador.com/codigo/JavaScript/5332-Calculo-de-hipotecas-prestamos.html -->

<%@page import="modelo.Persona"%>
<%@page import="modelodao.personaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Plan de Pago</title>
    </head>

    <!-- estilos de algunos componentes -->
    <style>
        form {
            width:1200px;
            text-align:center;
        }
        form>div>span {
            width:100px;
            display: inline-block;
            text-align:center;
        }
        form input {
            width:200px;
        }
        form>div {
            text-align:center;
        }
        table>tr>th, table>tr>td {
            text-align:center;
            border-collapse: collapse;
            width: 440px;

        }
    </style>

    <body>     
        <h1>Cálculo de Plan de Pagos</h1>
        <!-- traemos los datos de la persona segun su id desde la base de datos -->
        <%
            personaDao dao = new personaDao();
            int id = Integer.parseInt((String) request.getAttribute("idper"));
            Persona p = (Persona) dao.list(id); // metodo que retona un objeto persona  por su id
        %> 
        
        <div id="resultado"></div>
        <script>
            //llamamos a la funcion calcular por si sola en html
            document.addEventListener('DOMContentLoaded', calcular, false);
            //recibimos los datos de la perona seleccionada segun su id
            function calcular() {
                let deuda = parseFloat(<%=p.getValor_credito()%>);
                let meses = parseInt(<%=p.getPlazo_de_pago_mensual()%>);
                let interes = parseFloat(<%=p.getTasa_intere_mensual()%>);
                const resultado = document.getElementById("resultado");

                // hacemos los calculos...
                // si trabajamos en años interes = (interes / 100) / 12;
                const m = (deuda * interes * (Math.pow((1 + interes), (meses)))) / ((Math.pow((1 + interes), (meses))) - 1);

                resultado.innerHTML = "<div>Capital Inicial: " + deuda.toLocaleString("es-CO", {minimumFractionDigits: 2, maximumFractionDigits: 2}) + " COP \
                <br>Cuota a pagar mensualmente: " + m.toLocaleString("es-CO", {minimumFractionDigits: 2, maximumFractionDigits: 2}) + " COP</div>";

                // cramos un objeto table donde poner el resultado
                const table = document.createElement("table");
                table.setAttribute("border", 1);
                table.setAttribute("cellpadding", 5);
                table.setAttribute("cellspacing", 0);


                // titulo de la tabla
                let tr = document.createElement("tr");
                for (let text of ["Mes", "Intereses", "Amortización", "Capital Pendiente"]) {
                    let th = document.createElement("th");
                    let txt = document.createTextNode(text);
                    th.appendChild(txt);
                    tr.appendChild(th);
                }
                table.appendChild(tr);

                // contenido de la tabla
                //los datos tendran un formato segun la region de colombia
                let totalInt = 0;
                for (let i = 1; i <= meses; i++) {
                    totalInt = totalInt + (deuda * interes);

                    tr = document.createElement("tr");
                    let td = document.createElement("td");
                    let txt = document.createTextNode(i);
                    td.appendChild(txt);
                    tr.appendChild(td);
                    td = document.createElement("td");
                    txt = document.createTextNode((deuda * interes).toLocaleString("es-CO", {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                    td.appendChild(txt);
                    tr.appendChild(td);
                    td = document.createElement("td");
                    txt = document.createTextNode((m - (deuda * interes)).toLocaleString("es-CO", {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                    td.appendChild(txt);
                    tr.appendChild(td);
                    deuda = deuda - (m - (deuda * interes));
                    td = document.createElement("td");
                    if (deuda < 0) {
                        txt = document.createTextNode("0");
                    } else {
                        txt = document.createTextNode(deuda.toLocaleString("es-CO", {minimumFractionDigits: 2, maximumFractionDigits: 2}));
                    }
                    td.appendChild(txt);
                    tr.appendChild(td);
                    table.appendChild(tr);
                }
                
                //mostramos el pago total de intereses
                resultado.appendChild(table);
                let div = document.createElement("div");
                let txt = document.createTextNode("Pago total de intereses : " + totalInt.toLocaleString("es-CO", {minimumFractionDigits: 2, maximumFractionDigits: 2}) + " COP");
                div.appendChild(txt);
                resultado.appendChild(div);
            }
        </script>
        <br>
        <div class="form-row">
            <a class="btn btn-primary" href="controlador?accion=listar">Regresar</a>
        </div>
    </body>
</html>
