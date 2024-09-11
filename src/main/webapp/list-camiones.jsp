<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Camion" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.dao.CamionDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<main>

    <div class="d-flex justify-content-center align-items-center" style="height: 20vh;">
        <div class="col-md-8">
            <form>
                <div class="row">

                    <div class="col-md-6 mb-2">
                        <label for="matricula" class="form-label">Nº de matrícula</label>
                        <input type="text" class="form-control" id="matricula">
                    </div>

                    <div class="col-md-6 mb-2">
                        <label for="ubicacion" class="form-label">Ubicación del almacén</label>
                        <input type="text" class="form-control" id="ubicacion">
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100">Buscar</button>
            </form>
        </div>
    </div>



    <section class="py-5 text-center container">

        <h1>Camiones</h1>

        <table id="example" class="table table-striped table-hover" style="width:100%">
            <thead>
            <tr>
                <th>#</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Client</th>
                <th>Type trip</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                Database.connect();
                List<Camion> camiones = Database.jdbi.withExtension(CamionDao.class, CamionDao::getAllCamiones);
                for (Camion camion : camiones) {
            %>
            <tr>
                <td><%= camion.getIdCamion() %> </td>
                <td><%= camion.getMatricula() %>  </td>
                <td><%= camion.getCapacidad() %></td>
                <td><%= camion.getEstado() %></td>
                <td><%= camion.getImagen()%></td>
                <td><a href="view-camion.jsp?idCamion=<%= camion.getIdCamion()%>" type="button" class="btn btn-sm btn-outline-secondary">Detalles</a>
                    <a href="edit-camion.jsp?id_camion=<%= camion.getIdCamion()%>" type="button" class="btn btn-sm btn-outline-secondary">Modificar</a>
                    <a href="remove-camion?idCamion=<%= camion.getIdCamion()%>" type="button" class="btn btn-sm btn-outline-danger">Eliminar</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <a href="edit-camion.jsp" class="btn btn-success my-2">Añadir nuevo camión</a>
    </section>


</main>

<%@include file="includes/footer.jsp" %>