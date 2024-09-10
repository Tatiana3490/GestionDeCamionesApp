<%@ page import="com.svalero.gestiondecamiones.domain.Almacen" %>
<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.dao.AlmacenDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<!--<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-almacen", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>-->

<%
    int id;
    Almacen almacen = null;
    if (request.getParameter("id_almacen") == null) {
        id = 0;
    } else {
        id = Integer.parseInt(request.getParameter("id"));
        Database.connect();
        almacen = Database.jdbi.withExtension(AlmacenDao.class, dao-> dao.getAlmacen(id));
    }
%>

<main>
    <section class="py-5 text-center container">
        <h1>Registrar Almacén</h1>
    </section>

    <section class="container">
        <form class="" action="" method="post" content="text/html" enctype="multipart/form-data" >
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" name="nombre" class="form-control" id="nombre">
                </div>
                <div class="form-group col-md-6">
                    <label for="ubicacion" class="form-label">Ubicación</label>
                    <input type="text" name="ubicacion" class="form-control" id="ubicacion">
                </div>
            </div>
            <div class="form-group mt-1">
                <label class="form-label" for="capacidad_maxima">Capacidad máxima</label>
                <textarea class="form-control" name="capacidad_maxima" id="capacidad_maxima" rows="3"></textarea>
            </div>

            <button type="submit" class="btn btn-success mt-3">Enviar</button>
        </form>
        <br/>
        <div id="result"></div>
    </section>
</main>

<%@include file="includes/footer.jsp" %>