<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Ruta" %>
<%@ page import="com.svalero.gestiondecamiones.dao.RutaDao" %>


<%@include file="includes/header.jsp" %>




<main>
    <section class="py-5 text-center container">
        <h1>Ruta</h1>
    </section>

    <%
        Integer idRuta = Integer.parseInt(request.getParameter("idRuta"));

        Database.connect();
        Ruta ruta = Database.jdbi.withExtension(RutaDao.class, dao-> dao.getRuta(idRuta));
    %>

    <div class="cream-bg">
        <div class="container">
            <div class="row g-5 justify-content-evenly">
                <div class="col lg-6">
                    <div class="card">
                        <div class="row g-0">
                            <div class="col-6 col-md-7">
                                <div class="card-body d-flex flex-column">
                                    <div class="h-100">
                                        <h3 class="card-title">DATOS RUTA</h3>
                                        <h2 class="card-title"> <%= ruta.getIdRuta() %> </h2>
                                        <p class="card-text mb-1"><strong>Id del camión: </strong> <%= ruta.getIdCamion() %> </p>
                                        <p class="card-text mb-1"><strong>Fecha-salida: </strong> <%= ruta.getFecha_salida() %> </p>
                                        <p class="card-text mb-1"><strong>Almacén de origen: </strong> <%= ruta.getIdAlmacenOrigen_() %> </p>
                                        <p class="card-text mb-1"><strong>Almacén de destino: </strong> <%= ruta.getIdAlmacenDestino_() %>  </p>
                                    </div>
                                    <div>
                                        <a href="remove-mercancia?idMercancia=<%= ruta.getIdRuta()%>" type="button" class="btn btn-sm btn-outline-danger">Borrar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


<%@include file="includes/footer.jsp" %>