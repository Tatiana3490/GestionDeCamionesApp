<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Mercancia" %>
<%@ page import="com.svalero.gestiondecamiones.dao.MercanciaDao" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<main>

    <section class="py-5 text-center container">

        <h1>Rutas encontradas</h1>
        <div class="d-flex justify-content-center align-items-center" style="height: 20vh;">
            <div class="col-md-8">
                <form action="search-ruta.jsp">
                    <input type="text" name="fecha_salida" placeholder="Fecha de salida del camion"/>
                    <input type="text" name="estado" placeholder="Estado de la ruta"/>
                    <button type="submit">Buscar</button>
                </form>
            </div>
        </div>

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
                Date fecha_salida = request.getParameter("nombre");
                String id_almacen_destino = request.getParameter("id_almacen_destino");
                List<Mercancia> mercancias = Database.jdbi.withExtension(MercanciaDao.class, dao -> dao.searchMercancia(nombre, id_almacen_destino));
                for (Mercancia mercancia : mercancias) {
            %>
            <tr>
                <td><%= ruta.getIdRuta() %> </td>
                <td><%= ruta.getIdCamion() %>  </td>
                <td><%= ruta.getIdAlmacenOrigen_() %></td>
                <td><%= ruta.getIdAlmacenDestino_() %></td>
                <td><%= ruta.getFecha_salida() %></td>
                <td><%= ruta.getEstado() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </section>


</main>
