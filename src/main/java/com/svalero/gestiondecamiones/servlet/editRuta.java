package com.svalero.gestiondecamiones.servlet;

import com.svalero.gestiondecamiones.dao.Database;
import com.svalero.gestiondecamiones.dao.RutaDao;
import com.svalero.gestiondecamiones.util.DateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;


@WebServlet("/edit-ruta")

public class editRuta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (hasValidationErrors(request, response))
                return;
            int id = 0;
            if (request.getParameter("id_ruta") != null) {
                id = Integer.parseInt(request.getParameter("id_ruta"));
            }
            Integer id_camion = Integer.parseInt(request.getParameter("id_camion"));
            Integer id_almacen_origen = Integer.parseInt(request.getParameter("id_almacen_origen"));
            Integer id_almacen_destino = Integer.parseInt(request.getParameter("id_almacen_destino"));
            Date fecha_salida = (Date) DateUtils.parse(request.getParameter("fecha_salida"));
            String estado = request.getParameter("estado");

            Database.connect();
            if (id == 0) {
                int affectedRows = Database.jdbi.withExtension(RutaDao.class, dao ->
                        dao.addRuta(id_camion, id_almacen_origen, id_almacen_destino, fecha_salida, estado));
                Database.close();
                sendMessage("Nueva ruta añadida", response);
            } else {
                final int finalID = id;
                int affectedRows = Database.jdbi.withExtension(RutaDao.class, dao ->
                        dao.updateRuta(id_camion, id_almacen_origen, id_almacen_destino, fecha_salida, estado, finalID));
                Database.close();
                sendMessage("Ruta Modificada", response);
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            sendError("¡Atencion!, se ha producido un error.", response);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            sendError("¡Atencion!, Error al conectar con la base de datos", response);
        } catch (Exception e) {
            e.printStackTrace();
            sendError("¡Atencion!, se ha producido una excepcion", response);
        }
    }


    private boolean hasValidationErrors(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean hasErrors = false;
        if (request.getParameter("fecha_salida").isBlank()) {
            sendError("El campo Fecha_salida no puede estar vacio", response);
            hasErrors = true;
        }
        if (request.getParameter("estado").isBlank()) {
            sendError("El campo Estado no puede estar vacio", response);
            hasErrors = true;
        }

        return hasErrors;

    }
    private void sendError (String message, HttpServletResponse response) throws IOException {
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" + message + "</div>");
    }

    private void sendMessage (String message, HttpServletResponse response) throws IOException {
            response.getWriter().println("<div class='alert alert-success' role='alert'>" + message + "</div>");
    }

}
