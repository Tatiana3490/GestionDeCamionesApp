<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Almacen" %>
<%@ page import="com.svalero.gestiondecamiones.dao.AlmacenDao" %>

<%@include file="includes/header.jsp" %>

<script>
    $(document).ready(function () {
        $("#search-input").focus();
    });
</script>

<main>
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Aplicación Web Tatiana</h1>
                <p class="lead text-body-secondary">Gestor de camiones</p>
            </div>
        </div>
        <form class="row g-2" id="search-form" method="GET" action="index.jsp">
            <div class="mb-1 col-8">
                <input type="text" class="form-control" placeholder="Búsqueda" name="search" id="search-input">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3" id="search-button">Buscar</button>
            </div>
        </form>
    </section>

    <div class="album py-5 bg-body-tertiary">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <%
                    String search = request.getParameter("search") != null ? request.getParameter("search") : "";

                    Database.connect();
                    List<Almacen> almacenes;
                    if (search.isEmpty()) {
                        almacenes = Database.jdbi.withExtension(AlmacenDao.class, dao -> dao.getAllAlmacenes());
                    } else {
                        final String searchTerm = "%" + search + "%";
                        almacenes = Database.jdbi.withExtension(AlmacenDao.class, dao -> dao.getAlmacenes(searchTerm));
                    }

                    for (Almacen almacen : almacenes) {
                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <p class="card-text"><strong><%= almacen.getNombre() %></strong></p>
                            <p class="card-text"><%= almacen.getUbicacion() %></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="view-almacen.jsp?id=<%= almacen.getIdAlmacen() %>" type="button" class="btn btn-sm btn-outline-primary">Ver</a>
                                    <a href="edit-almacen.jsp?id=<%= almacen.getIdAlmacen() %>" type="button" class="btn btn-sm btn-outline-primary">Registrar</a>
                                    <a href="remove-almacen?id=<%= almacen.getIdAlmacen() %>" type="button" class="btn btn-sm btn-outline-danger">Eliminar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                    Database.disconnect();
                %>
            </div>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>



<%@include file="includes/footer.jsp" %>

