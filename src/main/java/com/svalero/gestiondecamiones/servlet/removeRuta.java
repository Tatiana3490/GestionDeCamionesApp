package com.svalero.gestiondecamiones.servlet;

import com.svalero.gestiondecamiones.dao.Database;
import com.svalero.gestiondecamiones.dao.RutaDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/remove-ruta")
public class removeRuta extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idRuta = Integer.parseInt(request.getParameter("idRuta"));

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(RutaDao.class,
                    dao -> dao.removeRuta(idRuta));

            response.sendRedirect("list-rutas.jsp");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
