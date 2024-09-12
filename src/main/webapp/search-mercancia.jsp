<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Mercancia" %>
<%@ page import="com.svalero.gestiondecamiones.dao.MercanciaDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<main>

    <section class="py-5 text-center container">

        <h1>Mercancía encontrada</h1>
        <div class="d-flex justify-content-center align-items-center" style="height: 20vh;">
            <div class="col-md-8">
                <form action="search-almacen.jsp">
                    <input type="text" name="nombre" placeholder="Nombre de almacen"/>
                    <input type="text" name="ubicacion" placeholder="Ubicacion del almacen"/>
                    <button type="submit">Buscar</button>
                </form>
            </div>
        </div>

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
                String nombre = request.getParameter("nombre");
                String id_almacen_destino = request.getParameter("id_almacen_destino");
                List<Mercancia> mercancias = Database.jdbi.withExtension(MercanciaDao.class, dao -> dao.searchMercancia(nombre, id_almacen_destino));
                for (Mercancia mercancia : mercancias) {
            %>
            <tr>
                <td><%= mercancia.getIdMercancia() %> </td>
                <td><%= mercancia.getNombre() %>  </td>
                <td><%= mercancia.getPeso() %></td>
                <td><%= mercancia.getIdRuta() %></td>
                <td><%= mercancia.getIdAlmacenDestino_() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </section>


</main>
