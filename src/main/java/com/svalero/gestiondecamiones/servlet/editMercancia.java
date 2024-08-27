package com.svalero.gestiondecamiones.servlet;

import com.svalero.gestiondecamiones.dao.Database;
import com.svalero.gestiondecamiones.dao.MercanciaDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/edit-mercancia")

public class editMercancia extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (hasValidationErrors(request, response))
                return;
            int id = 0;
            if (request.getParameter("id_mercancia") != null) {
                id = Integer.parseInt(request.getParameter("id_mercancia"));
            }
            String nombre = request.getParameter("nombre");
            float peso = Float.parseFloat(request.getParameter("peso"));;
            Integer id_ruta = Integer.parseInt(request.getParameter("id_ruta"));
            Integer id_almacen_destino = Integer.parseInt(request.getParameter("id_almacen_destino"));


            Database.connect();
            if (id == 0) {
                int affectedRows = Database.jdbi.withExtension(MercanciaDao.class, dao ->
                        dao.addMercancia(nombre, peso, id_ruta, id_almacen_destino));
                Database.close();
                sendMessage("Nueva mercancia añadida", response);
            } else {
                final int finalID = id;
                int affectedRows = Database.jdbi.withExtension(MercanciaDao.class, dao ->
                        dao.updateMercancia(nombre, peso,id_ruta, id_almacen_destino, finalID));
                Database.close();
                sendMessage("Mercancia Modificada", response);
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            sendError("¡Atencion!, se ha producido un error.", response);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            sendError("¡Atencion!, Error al conectar con la base de datos", response);
        } catch (Exception e) {
            e.printStackTrace();
            sendError("¡Atencion!, se ha producido una excepción", response);
        }
    }


    private boolean hasValidationErrors(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean hasErrors = false;
        if (request.getParameter("nombre").isBlank()) {
            sendError("El campo Nombre no puede estar vacío", response);
            hasErrors = true;
        }
        if (request.getParameter("peso").isBlank()) {
            sendError("El campo Peso no puede estar vacío", response);
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
