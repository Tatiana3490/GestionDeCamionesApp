<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Ruta" %>
<%@ page import="com.svalero.gestiondecamiones.dao.RutaDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<main>

    <section class="py-5 text-center container">

        <h1>Rutas</h1>

        <table id="example" class="table table-striped table-hover" style="width:100%">
            <thead>
            <tr>
                <th>#</th>
                <th>id_camion</th>
                <th>id_almacen_origen</th>
                <th>id_almacen_destino</th>
                <th>Fecha de salida</th>
                <th>Estado</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                Database.connect();
                List<Ruta> rutas = Database.jdbi.withExtension(RutaDao.class, RutaDao::getAllRutas);
                for (Ruta ruta : rutas) {
            %>
            <tr>
                <td><%= ruta.getIdRuta() %> </td>
                <td><%= ruta.getIdCamion() %>  </td>
                <td><%= ruta.getIdAlmacenOrigen_() %></td>
                <td><%= ruta.getIdAlmacenDestino_() %></td>
                <td><%= ruta.getFecha_salida() %></td>
                <td><%= ruta.getEstado() %></td>
                <td><a href="view-ruta.jsp" type="button" class="btn btn-sm btn-outline-secondary">Detalles</a>
                    <a href="" type="button" class="btn btn-sm btn-outline-secondary">Modificar</a>
                    <a href="remove-ruta" type="button" class="btn btn-sm btn-outline-danger">Eliminar</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <a href="edit-ruta.jsp" class="btn btn-success my-2">Añadir nueva ruta</a>
    </section>


</main>

<%@include file="includes/footer.jsp" %>