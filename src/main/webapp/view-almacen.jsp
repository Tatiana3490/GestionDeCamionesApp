<%@ page import="com.svalero.gestiondecamiones.dao.Database" %>
<%@ page import="com.svalero.gestiondecamiones.domain.Almacen" %>
<%@ page import="com.svalero.gestiondecamiones.dao.AlmacenDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@include file="includes/header.jsp" %>

<main>
    <section class="py-5 text-center container">
        <h1>Almacén</h1>
    </section>

    <%
        Integer idAlmacen = Integer.parseInt(request.getParameter("idAlmacen"));

        Database.connect();
        Almacen almacen = Database.jdbi.withExtension(AlmacenDao.class, dao-> dao.getAlmacen(idAlmacen));
    %>
    <%--Falta poner el link de la foto --%>
<div class="cream-bg">
    <div class="container">
        <div class="row g-5 justify-content-evenly">
            <div class="col-lg-6">
                <div class="card">
                    <div class="row g-0">
                        <div class="col-6 col-md-7">
                            <div class="card-body d-flex flex-column">
                                <div class="h-100">
                                    <h3 class="card-title">DATOS DEL ALMACÉN</h3>
                                    <h2 class="card-title"><%= almacen.getUbicacion() %></h2>
                                    <p class="card-text mb-1"><strong>Ubicación: </strong><%= almacen.getUbicacion() %></p>
                                    <p class="card-text mb-1"><strong>Capacidad: </strong><%= almacen.getCapacidad_maxima() %></p>
                                </div>
                                <div>
                                    <a href="remove-almacen?id=<%= almacen.getIdAlmacen() %>" type="button" class="btn btn-sm btn-outline-danger">Eliminar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--
    <%
        } else {
        out.println("<p>Almacén no encontrado.</p>");
            }
        }
    %>
--%>
</main>

<%@include file="includes/footer.jsp" %>