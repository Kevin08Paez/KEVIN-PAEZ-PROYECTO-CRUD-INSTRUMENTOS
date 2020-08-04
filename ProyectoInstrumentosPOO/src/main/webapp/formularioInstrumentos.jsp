<%-- 
    Document   : formularioInstrumentos
    Created on : 15 jul. 2020, 8:05:32
    Author     : Kevin_Paez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.*"%>
<!DOCTYPE html>
<%
    List<Catalogo> catalogo = new CatalogoBD().ListadoCatalogo();
    String titulo = "Agregar Instrumento", nom = "";
    String ruta = "agregarInstrumento.jsp";

    int id = 0;
    if (request.getParameter("idInstru") != null) {
        id = Integer.parseInt(request.getParameter("idInstru"));
        titulo = "Editar Instrumento";
        ruta = "editarInstrumento.jsp";
        InstrumentoBD instrumento = new InstrumentoBD();
        nom = instrumento.BuscarInstrumento(new Instrumento(Integer.parseInt(request.getParameter("idInstru"))));

    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title><%=titulo%></title>
    </head>
    <body>
        <h1><%=titulo%></h1>
        <div class="container show-top-margin separate-rows tall-rows">
            <form action="<%=ruta%>" method="GET" class="form">
                <% if (id != 0) {%>
                <div>
                    <input type="hidden" value="<%=id%>" class="form-control" placeholder="id" name="id" />
                </div>
                <% }%>
                <div class="form-group">
                    <input type="text" value="<%=nom%>" class="form-control" placeholder="Nombre Instrumento" name="nombre" required/>
                </div>
                <div class="form-group">
                    <select class="form-control" name="idmarca" required >
                        <option value="">Selecciona una opción</option>
                        <%
                            for (Catalogo cat : catalogo) {
                        %>
                        <option value="<%= cat.getIdMarca()%>"> <%= cat.getMarca()%> </option>
                        <%
                            }
                        %>   
                    </select>
                </div>

                <% if (id == 0) { %>
                <div class="form-group">
                    <input type="number" class="form-control" placeholder="Precio"  name="precio" required />
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" placeholder="Cantidad"  name="cantidad" required />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Descripción"  name="desc" required />
                </div>
                <% }%>
                <br>
                <div class="form-group">
                    <input type="submit" class="btn btn-success btn-black"  value="Enviar"/>
                    <a class="btn btn-info btn-black" href="index.jsp">Regresar</a>
                </div>
            </form>

        </div>


    </body>
</html>
