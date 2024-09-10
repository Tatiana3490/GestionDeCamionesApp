package com.svalero.gestiondecamiones.servlet;

import com.svalero.gestiondecamiones.dao.CamionDao;
import com.svalero.gestiondecamiones.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.UUID;


@WebServlet("/edit-camion")
@MultipartConfig /*Esto es para la imagen porque está esperando un fichero*/
public class editCamion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (hasValidationErrors(request, response))
                return;
            int id = 0;
            if (request.getParameter("id_camion") != null) {
                id = Integer.parseInt(request.getParameter("id_camion"));
            }
            String matricula = request.getParameter("matricula");
            float capacidad = Float.parseFloat(request.getParameter("capacidad"));
            String estado = request.getParameter("estado");
            Part imagenPart = request.getPart("imagen");

            // Guardar la imagen en disco
            /*String imagePath = request.getServletContext().getInitParameter("image-path");
            if (!new File(imagePath).exists())
                new File(imagePath).mkdir();*/
            String filename = null;
            /*if (imagenPart.getSize() == 0) {
                filename = "no-image.jpg";
            } else {*/
                filename = UUID.randomUUID() + ".jpg";
               /* InputStream fileStream = imagenPart.getInputStream();
                Files.copy(fileStream, Path.of(imagePath + File.separator + filename));
            }*/


            Database.connect();
            final String finalFilename = filename;
            if (id == 0) {
                int affectedRows = Database.jdbi.withExtension(CamionDao.class, dao ->
                        dao.addCamion(matricula, capacidad, estado, finalFilename));
                sendMessage("Camion regsitrado correctamente", response);
                Database.close();
                sendMessage("Nuevo camion añadido", response);
            } else {
                final int finalID = id;
                int affectedRows = Database.jdbi.withExtension(CamionDao.class, dao ->
                        dao.updateCamion(matricula, capacidad, estado, finalFilename, finalID));
                sendMessage("Camion Modificado", response);
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            sendError("¡Atencion!, se ha producido un error.", response);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            sendError("¡Atencion!, Error al conectar con la base de datos", response);
        } catch (Exception e) {
            e.printStackTrace();
            sendError( e.getMessage(), response);
        }
    }


    private boolean hasValidationErrors(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean hasErrors = false;
        if (request.getParameter("matricula").isBlank()) {
            sendError("El campo Matrícula no puede estar vacío", response);
            hasErrors = true;
        }
        if (request.getParameter("capacidad").isBlank()) {
            sendError("El campo Capacidad no puede estar vacío", response);
            hasErrors = true;
        }
        if (request.getParameter("estado").isBlank()) {
            sendError("El campo Estado no puede estar vacío", response);
            hasErrors = true;
        }
        return hasErrors;

    }
private void sendError(String message, HttpServletResponse response) throws IOException {
            response.getWriter().println("<div class='alert alert-danger' role='alert'>" + message + "</div>");
        }

private void sendMessage (String message, HttpServletResponse response) throws IOException {
            response.getWriter().println("<div class='alert alert-success' role='alert'>" + message + "</div>");
        }

}
