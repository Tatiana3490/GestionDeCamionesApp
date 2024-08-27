<%@ page import="com.svalero.gestiondecamiones.domain.Camion" %>
<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.dao.CamionDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@include file="includes/header.jsp" %>

<script type="text/javascript">
  $(document).ready(function() {
    $("form").on("submit", function(event) {
      event.preventDefault();
      var formValue = $(this).serialize();
      $.post("edit-camion", formValue, function(data) {
        $("#result").html(data);
      });
    });
  });
</script>

<%
  int id_camion;
  Camion camion = null;
  if (request.getParameter("id_camion") == null) {
    id_camion = 0;
  } else {
    id_camion = Integer.parseInt(request.getParameter("id_camion"));
    Database.connect();
    camion = Database.jdbi.withExtension(CamionDao.class, dao-> dao.getCamion(id_camion));
  }
%>


<body>
<div class="container mt-5">
  <h2>Registro de Camión</h2>
  <form <%--action="edit-camion" method="POST" enctype="multipart/form-data"--%>>
    <!-- Matrícula -->
    <div class="form-group">
      <label for="matricula">Matrícula:</label>
      <input type="text" class="form-control" id="matricula" name="matricula" required>
    </div>

    <!-- Capacidad -->
    <div class="form-group">
      <label for="capacidad">Capacidad (kg):</label>
      <input type="number" class="form-control" id="capacidad" name="capacidad" step="0.01" required>
    </div>

    <!-- Estado -->
    <div class="form-group">
      <label for="estado">Estado:</label>
      <select class="form-control" id="estado" name="estado" required>
        <option value="disponible">Disponible</option>
        <option value="en mantenimiento">En mantenimiento</option>
        <option value="en ruta">En ruta</option>
      </select>
    </div>

    <br>

    <!-- Imagen -->
    <div class="form-group">
      <label for="imagen">Subir Imagen:</label>
      <input type="file" class="form-control-file" id="imagen" name="imagen" accept="image/*" required>
    </div>

    <br>

    <!-- Botón de envío -->
    <button type="submit" class="btn btn-primary">Registrar Camión</button>
  </form>
  <div id="result"></div>
</div>




<%@include file="includes/footer.jsp" %>