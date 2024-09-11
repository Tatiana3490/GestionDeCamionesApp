<%@ page contentType="text/html;charset=UTF-8" language="java"%>


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
                <h1 class="fw-light">Aplicación de Gestión de Camiones</h1>
                <p class="lead text-body-secondary">Gestiona tus camiones y almacenes de forma eficiente</p>
                <p>
                    <a href="list-camiones.jsp" class="btn btn-primary my-2">Camiones</a>
                    <a href="list-almacenes.jsp" class="btn btn-primary my-2">Almacenes</a>
                    <a href="list-rutas.jsp" class="btn btn-primary my-2">Rutas</a>
                    <a href="list-mercancias.jsp" class="btn btn-primary my-2">Mercancías</a>
                </p>
            </div>
        </div>
    </section>
<%-- Ubicar las imagenes --%>
    <div class="album py-5 bg-body-tertiary">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <!-- Tarjeta 1 -->
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="images/Noticias%20camiones.png" alt="Camión 1" class="bd-placeholder-img card-img-top" width="100%" height="225">
                        <div class="card-body">
                            <p class="card-text">Mantente actualizado con las noticias más actuales.</p>
                            <div class="d-flex justify-content-between align-items-center">

                                <small class="text-body-secondary">Última actualización: 2 días</small>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Tarjeta 2 -->
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="images/Flota2.jpg" alt="Flota" class="bd-placeholder-img card-img-top" width="100%" height="225">
                        <div class="card-body">
                            <p class="card-text">Echa un vistazo a nuestra flota.</p>
                            <div class="d-flex justify-content-between align-items-center">

                                <small class="text-body-secondary">Última actualización: 5 días</small>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Tarjeta 3 -->
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="images/Camion2.jpg" alt="Camion 2" class="bd-placeholder-img card-img-top" width="100%" height="225">
                        <div class="card-body">
                            <p class="card-text">Nuestras rutas.</p>
                            <div class="d-flex justify-content-between align-items-center">

                                <small class="text-body-secondary">Última actualización: 1 semana</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</main>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>



<%@include file="includes/footer.jsp" %>

