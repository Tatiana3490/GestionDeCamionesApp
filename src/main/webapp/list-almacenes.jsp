<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Almacen" %>
<%@ page import="com.svalero.gestiondecamiones.dao.AlmacenDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<main>

    <section class="py-5 text-center container">

        <h1>Almacenes</h1>

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
                List<Almacen> almacenes = Database.jdbi.withExtension(AlmacenDao.class, AlmacenDao::getAllAlmacenes);
                for (Almacen almacen : almacenes) {
            %>
            <tr>
                <td><%= almacen.getIdAlmacen() %> </td>
                <td><%= almacen.getNombre() %>  </td>
                <td><%= almacen.getUbicacion() %></td>
                <td><%= almacen.getCapacidad_maxima() %></td>
                <td><a href="view-almacen.jsp" type="button" class="btn btn-sm btn-outline-secondary">Detalles</a>
                    <a href="" type="button" class="btn btn-sm btn-outline-secondary">Modificar</a>
                    <a href="remove-almacen" type="button" class="btn btn-sm btn-outline-danger">Eliminar</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <a href="edit-almacen" class="btn btn-success my-2">Añadir nuevo almacén</a>
    </section>


</main>

<%@include file="includes/footer.jsp" %>