<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Ruta" %>
<%@ page import="com.svalero.gestiondecamiones.dao.RutaDao" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Almacen" %>
<%@ page import="com.svalero.gestiondecamiones.dao.AlmacenDao" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Camion" %>
<%@ page import="com.svalero.gestiondecamiones.dao.CamionDao" %>
<%@ page import="java.util.List" %>
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
    Database.connect();
    List<Camion> listCamiones = Database.jdbi.withExtension(CamionDao.class, CamionDao::getAllCamiones);
    List<Almacen> listAlmacenes = Database.jdbi.withExtension(AlmacenDao.class, AlmacenDao::getAllAlmacenes);
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
            <% if(request.getParameter("id_ruta") == null) { %>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="fecha_salida_new" class="form-label">Fecha de salida</label>
                    <input type="date" name="fecha_salida" class="form-control" id="fecha_salida_new">
                </div>

                <script>
                    $(function() {
                        $("#fecha_salida").datepicker({
                            dateFormat: "dd-mm-yy"
                        });
                    });
                </script>

                <div class="form-group col-md-6">
                    <label for="estado_new" class="form-label">Estado</label>
                    <select class="form-control" id="estado_new" name="estado" required>
                        <option value="en curso">En curso</option>
                        <option value="completada">Completada</option>
                        <option value="cancelada">Cancelada</option>
                    </select>
                </div>
            </div>
            <div class="form-group col-md-6">
                <label for="id_camion_new" class="form-label">Camion</label>
                <select name="id_camion" id="id_camion_new">
                    <option value="">Selecciona un camion</option>
                    <%
                        for(Camion camion: listCamiones) {
                    %>
                    <option value="<%= camion.getIdCamion() %>"><%= camion.getMatricula() %></option>
                    <% } %>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="id_almacen_origen_new" class="form-label">Almacen origen</label>
                <select name="id_almacen_origen" id="id_almacen_origen_new">
                    <option value="">Selecciona un almacen de origen</option>
                    <%
                        for(Almacen almacen: listAlmacenes) {
                    %>
                    <option value="<%= almacen.getIdAlmacen() %>"><%= almacen.getNombre() %></option>
                    <% } %>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="id_almacen_destino_new" class="form-label">Almacen destino</label>
                <select name="id_almacen_destino" id="id_almacen_destino_new">
                    <option value="">Selecciona un almacen de destino</option>
                    <%
                        for(Almacen almacen: listAlmacenes) {
                    %>
                    <option value="<%= almacen.getIdAlmacen() %>"><%= almacen.getNombre() %></option>
                    <% } %>
                </select>
            </div>
            <% } else { %>
            <div class="row">
                <div class="form-group col-md-6">
                    <input type="hidden" name="id_ruta" value="<%= ruta.getIdRuta() %>"/>
                    <label for="fecha_salida" class="form-label">Fecha de salida</label>
                    <input type="date" name="fecha_salida" class="form-control" id="fecha_salida" value="<%= ruta.getFecha_salida() %>">
                </div>

                <script>
                    $(function() {
                        $("#fecha_salida").datepicker({
                            dateFormat: "dd-mm-yy"
                        });
                    });
                </script>

                <div class="form-group col-md-6">
                    <label for="estado" class="form-label">Estado</label>
                    <select class="form-control" id="estado" name="estado" required>
                        <option value="en curso" <%= "en curso".equals(ruta.getEstado()) ? "selected" : "" %>>En curso</option>
                        <option value="completada" <%= "completada".equals(ruta.getEstado()) ? "selected" : "" %>>Completada</option>
                        <option value="cancelada" <%= "cancelada".equals(ruta.getEstado()) ? "selected" : "" %>>Cancelada</option>
                    </select>
                </div>
            </div>
            <div class="form-group col-md-6">
                <label for="id_camion" class="form-label">Camion</label>
                <select name="id_camion" id="id_camion">
                    <%
                        for(Camion camion: listCamiones) {
                            if(ruta.getIdCamion() == camion.getIdCamion()) {
                    %>
                    <option value="<%= camion.getIdCamion() %>" selected ><%= camion.getMatricula() %></option>
                    <% }else{ %>
                    <option value="<%= camion.getIdCamion() %>"><%= camion.getMatricula() %></option>
                    <% }} %>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="id_almacen_origen" class="form-label">Almacen origen</label>
                <select name="id_almacen_origen" id="id_almacen_origen">
                    <%
                        for(Almacen almacen: listAlmacenes) {
                            if(ruta.getIdAlmacenOrigen_() == almacen.getIdAlmacen()){
                    %>
                    <option value="<%= almacen.getIdAlmacen() %>" selected><%= almacen.getNombre() %></option>
                    <% }else{ %>
                    <option value="<%= almacen.getIdAlmacen() %>"><%= almacen.getNombre() %></option>
                    <% }} %>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="id_almacen_destino" class="form-label">Almacen destino</label>
                <select name="id_almacen_destino" id="id_almacen_destino">
                    <%
                        for(Almacen almacen: listAlmacenes) {
                            if(ruta.getIdAlmacenDestino_() == almacen.getIdAlmacen()){
                    %>
                    <option value="<%= almacen.getIdAlmacen() %>" selected><%= almacen.getNombre() %></option>
                    <% }else{ %>
                    <option value="<%= almacen.getIdAlmacen() %>"><%= almacen.getNombre() %></option>
                    <% }} %>
                </select>
            </div>
            <% } %>
            <button type="submit" class="btn btn-success mt-3">Enviar</button>
        </form>
        <br/>
        <div id="result"></div>
    </section>

</main>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<%@include file="includes/footer.jsp" %>