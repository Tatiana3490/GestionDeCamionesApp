<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Mercancia" %>
<%@ page import="com.svalero.gestiondecamiones.dao.MercanciaDao" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Ruta" %>
<%@ page import="com.svalero.gestiondecamiones.dao.RutaDao" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Almacen" %>
<%@ page import="com.svalero.gestiondecamiones.dao.AlmacenDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp" %>

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


<%
    try{
        Database.connect();
        List<Ruta> listRutas = Database.jdbi.withExtension(RutaDao.class, RutaDao::getAllRutas);
        List<Almacen> listAlmacenes = Database.jdbi.withExtension(AlmacenDao.class, AlmacenDao::getAllAlmacenes);
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
        <form class="" id="edit-form" action="" method="post" content="text/html"  >
            <% if(request.getParameter("id_mercancia") == null) { %>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="nombre_new" class="form-label">Nombre</label>
                    <input type="text" name="nombre" class="form-control" id="nombre_new">
                </div>
                <div class="form-group col-md-6">
                    <label for="peso_new" class="form-label">Peso</label>
                    <input type="text" name="peso" class="form-control" id="peso_new">
                </div>
                <div class="form-group col-md-6">
                    <label for="id_ruta_new" class="form-label">Id de ruta</label>
                    <select name="id_ruta" id="id_ruta_new">
                        <option value="">Selecciona una ruta</option>
                        <%
                            for(Ruta ruta: listRutas) {
                        %>
                        <option value="<%= ruta.getIdRuta() %>"><%= ruta.getIdRuta() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="almacen_destino_new" class="form-label">Almacen destino</label>
                    <select name="id_almacen_destino" id="almacen_destino_new">
                        <option value="">Selecciona un almacen</option>
                        <%
                            for(Almacen almacen: listAlmacenes) {
                        %>
                        <option value="<%= almacen.getIdAlmacen() %>"><%= almacen.getNombre() %></option>
                        <% } %>
                    </select>
                </div>
            </div>
            <% } else { %>
            <div class="row">
                <div class="form-group col-md-6">
                    <input type="hidden" name="id_mercancia" value="<%= mercancia.getIdMercancia() %>"/>
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" name="nombre" class="form-control" id="nombre" value="<%= mercancia.getNombre() %>">
                </div>
                <div class="form-group col-md-6">
                    <label for="peso" class="form-label">Peso</label>
                    <input type="text" name="peso" class="form-control" id="peso" value="<%= mercancia.getPeso() %>">
                </div>
            </div>
            <div class="form-group col-md-6">
                <label for="id_ruta" class="form-label">Id de ruta</label>
                <select name="id_ruta" id="id_ruta">
                    <%
                        for(Ruta ruta: listRutas) {
                            if(ruta.getIdRuta() == mercancia.getIdRuta()){
                    %>
                    <option value="<%= ruta.getIdRuta() %>" selected ><%= ruta.getIdRuta() %></option>
                    <% }else{ %>
                    <option value="<%= ruta.getIdRuta() %>"><%= ruta.getIdRuta() %></option>
                    <% } }%>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="almacen_destino" class="form-label">Almacen destino</label>
                <select name="id_almacen_destino" id="almacen_destino">
                    <option value="">Selecciona un almacen</option>
                    <%
                        for(Almacen almacen: listAlmacenes) {
                            if(mercancia.getIdAlmacenDestino_() == almacen.getIdAlmacen()){
                    %>
                    <option value="<%= almacen.getIdAlmacen() %>" selected ><%= almacen.getNombre() %></option>
                    <% }else{ %>
                    <option value="<%= almacen.getIdAlmacen() %>"><%= almacen.getNombre() %></option>
                    <% }} %>
                </select>
            </div>
            <% } %>
            <button id="edit-button" type="submit" class="btn btn-success mt-3">Enviar</button>
        </form>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <br/>
        <div id="result"></div>
    </section>
</main>


<%@include file="includes/footer.jsp" %>