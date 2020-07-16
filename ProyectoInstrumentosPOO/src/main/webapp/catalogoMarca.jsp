<%-- 
    Document   : catalogoMarca
    Created on : 5 jul. 2020, 17:54:21
    Author     : Kevin_Paez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.*"%>
<!DOCTYPE html>
<%
    List<Catalogo> catalogo = new CatalogoBD().ListadoCatalogo();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Catálogo De Marca</title>
        <style type="text/css">
            .table th{
                text-align: center;
            }
            .table td{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Catálogo de Marcas</h1>
        <div class="container show-top-margin separate-rows tall-rows">
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Marca</th>
                        <th colspan="2">Opciones</th>
                    </tr>
                </thead>
                <%
                    for (Catalogo cat : catalogo) {
                %>
                <tbody>
                    <tr>
                        <td scope="row"><%= cat.getIdMarca() %></td>
                        <td scope="row"><%= cat.getMarca() %></td>
                        <td><a class="btn btn-warning btn-block" href="formularioMarcas.jsp?idMarca=<%=cat.getIdMarca()%>">Editar Marca</a></td>
                        <td><a class="btn btn-danger btn-block" href="eliminarMarca.jsp?idMarca=<%=cat.getIdMarca()%>"> Eliminar Marca</a></td>
                    </tr>
                </tbody>
                <%}%>
            </table>
        </div>
        <div class="container show-top-margin separate-rows tall-rows">
            <a class="btn btn-success btn-black" href="formularioMarcas.jsp">Agregar Marca</a>
            <a class="btn btn-secondary btn-black" href="index.jsp">Regresar</a> 
        </div> 
        
    </body>
</html>
