package com.svalero.gestiondecamiones.servlet;

import com.svalero.gestiondecamiones.dao.CamionDao;
import com.svalero.gestiondecamiones.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/remove-camion")
public class removeCamion extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idCamion = Integer.parseInt(request.getParameter("idCamion"));

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(CamionDao.class,
                    dao -> dao.removeCamion(idCamion));
            response.sendRedirect("list-camiones.jsp");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
