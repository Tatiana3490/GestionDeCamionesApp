<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Camion" %>
<%@ page import="com.svalero.gestiondecamiones.dao.CamionDao" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Camion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<main>

    <section class="py-5 text-center container">

        <h1>Camiones encontrados</h1>

        <table id="example" class="table table-striped table-hover" style="width:100%">
            <thead>
            <tr>
                <th>#</th>
                <th>Matricula</th>
                <th>Capacidad (kg.)</th>
                <th>Estado</th>
                <th>Imagen</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                Database.connect();
                String matricula = request.getParameter("matricula");
                String estado = request.getParameter("estado");
                List<Camion> camiones = Database.jdbi.withExtension(CamionDao.class, dao -> dao.searchCamion(matricula, estado));
                for (Camion camion : camiones) {
            %>
            <tr>
                <td><%= camion.getIdCamion() %> </td>
                <td><%= camion.getMatricula() %>  </td>
                <td><%= camion.getCapacidad() %></td>
                <td><%= camion.getEstado() %></td>
                <td><%= camion.getImagen()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </section>


</main>
