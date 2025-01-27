<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Almacen" %>
<%@ page import="com.svalero.gestiondecamiones.dao.AlmacenDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<main>





    <section class="py-5 text-center container">

        <h1>Almacenes</h1>

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
                <td><a href="view-almacen.jsp?idAlmacen=<%= almacen.getIdAlmacen() %>" type="button" class="btn btn-sm btn-outline-secondary">Detalles</a>
                    <a href="edit-almacen.jsp?id_almacen=<%= almacen.getIdAlmacen() %>" type="button" class="btn btn-sm btn-outline-secondary">Modificar</a>
                    <a href="remove-almacen?id=<%= almacen.getIdAlmacen() %>" type="button" class="btn btn-sm btn-outline-danger">Eliminar</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <a href="edit-almacen.jsp" class="btn btn-success my-2">Añadir nuevo almacén</a>
    </section>


</main>

<%@include file="includes/footer.jsp" %>