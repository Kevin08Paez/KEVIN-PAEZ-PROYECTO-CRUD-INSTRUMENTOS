<%-- 
    Document   : index
    Created on : 3 jun. 2020, 16:45:36
    Author     : Kevin_Paez
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection conexion = null;
    Statement stmt= null;
    ResultSet rs= null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdinstrumentos ", "root", "");
        stmt = conexion.createStatement();
        rs = stmt.executeQuery("SELECT instrumentos.idInstru, instrumentos.nombre, cat_marca.marca, "
                + "instrumentos.precio, instrumentos.descripcion FROM `instrumentos` JOIN cat_marca ON instrumentos.id_marca=cat_marca.idMarca ");
    } catch (Exception e) {    
        out.println("Error " + e);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instrumentos</title>
        <style>
            table {width: 60%; background-color: #b4b8be;}
            th, td {padding: 8px;}
            table tr:nth-child(even) {
            background-color: #eee;
            }
            table tr:nth-child(odd) {
            background-color: #fff;
            }
            table th {
            background-color: black;
            color: white;
            }
            table td{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div>
            <h1 align="center">Instrumentos Musicales</h1>    
            <table align="center">
                <tr>
                    <th>IdInstru</th>
                    <th>Nombre</th>
                    <th>Marca</th>
                    <th>Precio</th>
                    <th>Descripción</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getInt("idInstru")%></td>
                    <td><%= rs.getString("nombre")%></td>
                    <td><%= rs.getString("marca")%></td>
                    <td><%= rs.getDouble("precio")%></td>
                    <td><%= rs.getString("descripcion")%></td>
                </tr>
                <%}%>
            </table>
            <br><br>
            <h1 align="center">Catálogo</h1> 
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdinstrumentos ", "root", "");
                    stmt = conexion.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM cat_marca");
                } catch (Exception e) {
                    out.println("Error " + e);
                }
            %>
            
            <table align="center">
                <tr>
                    <th>IdMarca</th>
                    <th>Nombre</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getInt("idMarca")%></td>
                    <td><%= rs.getString("marca")%></td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
