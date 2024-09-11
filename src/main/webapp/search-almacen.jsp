<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Almacen" %>
<%@ page import="com.svalero.gestiondecamiones.dao.AlmacenDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<main>

    <section class="py-5 text-center container">

        <h1>Almacenes encontrados</h1>

        <table id="example" class="table table-striped table-hover" style="width:100%">
            <thead>
            <tr>
                <th>#</th>
                <th>Nombre</th>
                <th>Ubicación</th>
                <th>Capacidad máxima</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                Database.connect();
                String nombre = request.getParameter("nombre");
                String ubicacion = request.getParameter("ubicacion");
                List<Almacen> almacenes = Database.jdbi.withExtension(AlmacenDao.class, dao -> dao.searchAlmacen(nombre, ubicacion));
                for (Almacen almacen : almacenes) {
            %>
            <tr>
                <td><%= almacen.getIdAlmacen() %> </td>
                <td><%= almacen.getNombre() %>  </td>
                <td><%= almacen.getUbicacion() %></td>
                <td><%= almacen.getCapacidad_maxima() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </section>


</main>
