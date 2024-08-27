
<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Mercancia" %>
<%@ page import="com.svalero.gestiondecamiones.dao.MercanciaDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>
<%--
<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-mercancia", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>
--%>
<script>
    $(document).ready(function () {
        $("#edit-button").click(function (event) {
            event.preventDefault();
            const form = $("#edit-form")[0];
            const data = new FormData(form);

            $("#edit-button").prop("disabled", true);

            $.ajax({
                type: "POST",
                enctype: "multipart/form-data",
                url: "edit-mercancia",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {
                    $("#result").html(data);
                    $("#name").value("");
                    $("#edit-button").prop("disabled", false);
                },
                error: function (error) {
                    $("#result").html(error.responseText);
                    $("#edit-button").prop("disabled", false);
                }
            });
        });
    });
</script>




<%
    int id;
    Mercancia mercancia = null;
    if (request.getParameter("id_mercancia") == null) {
        id = 0;
    } else {
        id = Integer.parseInt(request.getParameter("id_mercancia"));
        Database.connect();
        mercancia = Database.jdbi.withExtension(MercanciaDao.class, dao-> dao.getMercancia(id));
    }
%>

<main>
    <section class="py-5 text-center container">
        <h1>Registrar Mercancía</h1>
    </section>

    <section class="container">
        <form class="" action="" method="post" content="text/html" enctype="multipart/form-data" >
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" name="nombre" class="form-control" id="nombre">
                </div>
                <div class="form-group col-md-6">
                    <label for="peso" class="form-label">Peso</label>
                    <input type="text" name="peso" class="form-control" id="peso">
                </div>
            </div>

            <button type="submit" class="btn btn-success mt-3">Enviar</button>
        </form>
        <br/>
        <div id="result"></div>
    </section>
</main>

<%@include file="includes/footer.jsp" %>