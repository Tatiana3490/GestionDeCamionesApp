<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Ruta" %>
<%@ page import="com.svalero.gestiondecamiones.dao.RutaDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-ruta", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<%
    int id;
    Ruta ruta = null;
    if (request.getParameter("id_ruta") == null) {
        id = 0;
    } else {
        id = Integer.parseInt(request.getParameter("id_ruta"));
        Database.connect();
        ruta = Database.jdbi.withExtension(RutaDao.class, dao-> dao.getRuta(id));
    }
%>

<main>
    <section class="py-5 text-center container">
        <h1>Registrar Ruta</h1>
    </section>

    <section class="container">
        <form class="" action="" method="post" content="text/html" enctype="multipart/form-data" >
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="fecha_salida" class="form-label">Fecha de salida</label>
                    <input type="text" name="fecha_salida" class="form-control" id="fecha_salida">
                </div>
                <div class="form-group col-md-6">
                    <label for="estado" class="form-label">Estado</label>
                    <select class="form-control" id="estado" name="estado" required>
                        <option value="en_curso">En curso</option>
                        <option value="completada">Completada</option>
                        <option value="cancelada">Cancelada</option>
                    </select>
                </div>
            </div>

            <button type="submit" class="btn btn-success mt-3">Enviar</button>
        </form>
        <br/>
        <div id="result"></div>
    </section>
</main>

<%@include file="includes/footer.jsp" %>