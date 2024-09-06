<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Mercancia" %>
<%@ page import="com.svalero.gestiondecamiones.dao.MercanciaDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<main>

    <section class="py-5 text-center container">

        <h1>Mercancías</h1>

        <table id="example" class="table table-striped table-hover" style="width:100%">
            <thead>
            <tr>
                <th>#</th>
                <th>Nombre</th>
                <th>Peso</th>
                <th>Ruta</th>
                <th>Almacén destino</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                Database.connect();
                List<Mercancia> mercancias = Database.jdbi.withExtension(MercanciaDao.class, MercanciaDao::getAllMercancias);
                for (Mercancia mercancia : mercancias) {
            %>
            <tr>
                <td><%= mercancia.getIdMercancia() %> </td>
                <td><%= mercancia.getNombre() %>  </td>
                <td><%= mercancia.getPeso() %></td>
                <td><%= mercancia.getIdRuta() %></td>
                <td><%= mercancia.getIdAlmacenDestino_() %></td>
                <td><a href="view-mercancia.jsp" type="button" class="btn btn-sm btn-outline-secondary">Detalles</a>
                    <a href="edit-mercancia" type="button" class="btn btn-sm btn-outline-secondary">Modificar</a>
                    <a href="remove-mercancia" type="button" class="btn btn-sm btn-outline-danger">Eliminar</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <a href="edit-mercancia.jsp" class="btn btn-success my-2">Añadir nueva mercancía</a>
    </section>


</main>

<%@include file="includes/footer.jsp" %>