<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Camion" %>
<%@ page import="com.svalero.gestiondecamiones.dao.CamionDao" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Mercancia" %>
<%@ page import="com.svalero.gestiondecamiones.dao.MercanciaDao" %>


<%@include file="includes/header.jsp" %>




<main>
    <section class="py-5 text-center container">
        <h1>Mercancía</h1>
    </section>

    <%
        Integer idMercancia = Integer.parseInt(request.getParameter("idMercancia"));

        Database.connect();
        Mercancia mercancia = Database.jdbi.withExtension(MercanciaDao.class, dao-> dao.getMercancia(idMercancia));
    %>


    <div class="cream-bg">
        <div class="container">
            <div class="row g-5 justify-content-evenly">
                <div class="col lg-6">
                    <div class="card">
                        <div class="row g-0">
                            <div class="col-6 col-md-5">
                                <img class="card-img img-fluid rounded-start" src="link_foto" alt="Mercancia">
                            </div>
                            <div class="col-6 col-md-7">
                                <div class="card-body d-flex flex-column">
                                    <div class="h-100">
                                        <h3 class="card-title"> <%= mercancia.getNombre() %> </h3>
                                        <h2 class="card-title"> <%= mercancia.getPeso() %> </h2>
                                        <p class="card-text mb-1"><strong>Ruta: </strong> <%= mercancia.getIdRuta() %> </p>
                                        <p class="card-text mb-1"><strong>Almacén de destino: </strong> <%= mercancia.getIdAlmacenDestino_() %>  </p>

                                    </div>
                                    <div>
                                        <a href="remove-mercancia?idMercancia=<%= mercancia.getIdMercancia()%>" type="button" class="btn btn-sm btn-outline-danger">Borrar</a>
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