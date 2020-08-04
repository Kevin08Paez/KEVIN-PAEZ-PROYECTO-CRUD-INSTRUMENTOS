<%-- 
    Document   : ordenProductos
    Created on : 1 ago. 2020, 14:47:55
    Author     : Kevin_Paez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ordencompra.*"%>
<%@page import="java.text.SimpleDateFormat"%> 
<%@page import="java.util.Date"%> 
<%@page import="java.text.DateFormat"%> 
<!DOCTYPE html>
<%
    int idOrden, idProducto, cantidad;
    boolean resultado;
    OrdenCompraBD fecha = new OrdenCompraBD();
    resultado = fecha.pruebafecha(); 
    
    Date date = new Date();
    DateFormat hourdateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //System.out.println("Hora y fecha: "+hourdateFormat.format(date));
    
    OrdenCompraBD fechayhora = new OrdenCompraBD();
    idOrden = fechayhora.BuscarIdOrden(hourdateFormat.format(date));
    
    idProducto = Integer.parseInt(request.getParameter("idInstru"));
    cantidad = Integer.parseInt(request.getParameter("cantidad"));
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Orden Porducto</title>
    </head>
    <body>
        <br>
        <div class="container show-top-margin separate-rows tall-rows">
            <table class="table table-striped table-hover">
                <thead class="thead-green">
                    <tr>
                        <th scope="col">Fecha</th>
                        <th scope="col">idProducto</th>
                        <th scope="col">Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td scope="row"><%=hourdateFormat.format(date)%></td>
                        <td scope="row"><%=idProducto%></td>
                        <td scope="row">
                            <form action="ventaProducto.jsp" method="GET" class="form">
                                <input type="hidden" value="<%=idOrden%>" class="form-control" name="idOrden" />
                                <input type="hidden" value="<%=idProducto%>" class="form-control" name="idProducto" />
                                <input type="number" class="form-control" min="1" max="<%=cantidad%>" name="cantidad"> <br>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-success btn-black"  value="Guardar"/>
                                    <a class="btn btn-info btn-black" href="index.jsp">Regresar</a>
                                </div>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
