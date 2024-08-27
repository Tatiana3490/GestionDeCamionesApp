package com.svalero.gestiondecamiones.servlet;

import com.svalero.gestiondecamiones.dao.AlmacenDao;
import com.svalero.gestiondecamiones.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;



@WebServlet("/edit-almacen")

public class editAlmacen extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (hasValidationErrors(request, response))
                return;
            int id = 0;
            if (request.getParameter("id_almacen") != null) {
                id = Integer.parseInt(request.getParameter("id_almacen"));
            }
            String nombre = request.getParameter("nombre");
            String ubicacion = request.getParameter("ubicacion");
            float capacidad_maxima = Float.parseFloat(request.getParameter("capacidad_maxima"));


            Database.connect();
            if (id == 0) {
                int affectedRows = Database.jdbi.withExtension(AlmacenDao.class, dao ->
                        dao.addAlmacen(nombre, ubicacion, capacidad_maxima));
                Database.close();
                sendMessage("Nuevo almacen añadido", response);
            } else {
                final int finalID = id;
                int affectedRows = Database.jdbi.withExtension(AlmacenDao.class, dao ->
                        dao.updateAlmacen(nombre, ubicacion, capacidad_maxima, finalID));
                Database.close();
                sendMessage("Almacen Modificado", response);
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
        if (request.getParameter("nombre").isBlank()) {
            sendError("El campo Nombre no puede estar vacío", response);
            hasErrors = true;
        }
        if (request.getParameter("ubicacion").isBlank()) {
            sendError("El campo Ubicación no puede estar vacío", response);
            hasErrors = true;
        }
        if (request.getParameter("capacidad_maxima").isBlank()) {
            sendError("El campo Capacidad_maxima no puede estar vacío", response);
            hasErrors = true;
        }
        return hasErrors;

    }

    private void sendError(String message, HttpServletResponse response) throws IOException {
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" + message + "</div>");
    }

    private void sendMessage(String message, HttpServletResponse response) throws IOException {
            response.getWriter().println("<div class='alert alert-success' role='alert'>" + message + "</div>");
    }


}
