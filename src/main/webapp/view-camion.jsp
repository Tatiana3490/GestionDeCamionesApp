<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Camion" %>
<%@ page import="com.svalero.gestiondecamiones.dao.CamionDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<%@include file="includes/header.jsp" %>




<main>
    <section class="py-5 text-center container">
        <h1>Camión</h1>
    </section>

    <%
        Integer idCamion = Integer.parseInt(request.getParameter("idCamion"));

        Database.connect();
        Camion camion = Database.jdbi.withExtension(CamionDao.class, dao-> dao.getCamion(idCamion));
    %>

    <div class="cream-bg">
        <div class="container">
            <div class="row g-5 justify-content-evenly">
                <div class="col lg-6">
                    <div class="card">
                        <div class="row g-0">
                            <div class="col-6 col-md-5">
                                <img class="card-img img-fluid rounded-start" src="<%= camion.getImagen() %>" alt="Camión">
                            </div>
                            <div class="col-6 col-md-7">
                                <div class="card-body d-flex flex-column">
                                    <div class="h-100">
                                        <h3 class="card-title">DATOS DEL CAMIÓN</h3>
                                        <p class="card-text mb-1"><strong>Matrícula: </strong> <%= camion.getMatricula() %> </p>
                                        <p class="card-text mb-1"><strong>Estado: </strong> <%= camion.getEstado() %> </p>
                                        <p class="card-text mb-1"><strong>Capacidad: </strong> <%= camion.getCapacidad() %> </p>
                                        <p class="card-text mb-1"><strong>Foto: </strong> <%= camion.getImagen() %>  </p>
                                    </div>
                                    <div>
                                        <a href="remove-camion?idCamion=<%= camion.getIdCamion()%>" type="button" class="btn btn-sm btn-outline-danger">Borrar</a>
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