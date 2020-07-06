<%-- 
    Document   : index
    Created on : 2 jul. 2020, 20:06:16
    Author     : Kevin_Paez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.Instrumento"%>
<%@page import="Dao.InstrumentoBD"%>
<!DOCTYPE html>
<%
    List<Instrumento> instrumentos = new InstrumentoBD().ListadoInstrumento();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Instrumentos</title>
        <style type="text/css">
            .table-striped tbody tr:nth-of-type(odd){
                background-color: rgb(237,245,245);
            }
            .table-hover tbody tr:hover{
                background-color: #d9ebeb;
                color: rgb(112,24,78);
            }
            .thead-green{
                background-color: rgb(0, 99, 71);
                color: white;
            }
            .table th{
                text-align: center;
            }
            .table td{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1> Instrumentos</h1>
        <br>
        <div class="container show-top-margin separate-rows tall-rows">
            <table class="table table-striped table-hover">
                <thead class="thead-green">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Descripción</th>
                        <th colspan="2">Opciones</th>
                    </tr>
                </thead>
                <%
                    for (Instrumento instrumento : instrumentos) {
                %>
                <tbody>
                    <tr>
                        <td scope="row"><%=instrumento.getIdInstru()%></td>
                        <td scope="row"><%=instrumento.getNombre()%></td>
                        <td scope="row"><%=instrumento.getMarca()%></td>
                        <td scope="row"><%=instrumento.getPrecio()%></td>
                        <td scope="row"><%=instrumento.getDescripcion()%></td>
                        <td><a class="btn btn-warning btn-block" href="index.jsp?idInstru=<%=instrumento.getIdInstru()%>">Editar Instrumento</a></td>
                        <td><a class="btn btn-danger btn-block" href="index.jsp?idInstru=<%=instrumento.getIdInstru()%>"> Eliminar Instrumento</a></td>
                    </tr>
                </tbody>
                <%}%>
            </table>
        </div>
        <br>
        <div class="container show-top-margin separate-rows tall-rows">
            <a class="btn btn-success btn-black" href="">Agregar Instrumento </a>
            <a class="btn btn-secondary btn-black" href="catalogoMarca.jsp">Catálogo de Marcas</a>     
        </div>

            
    </body>
</html>
