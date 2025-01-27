package com.svalero.gestiondecamiones.servlet;

import com.svalero.gestiondecamiones.dao.AlmacenDao;
import com.svalero.gestiondecamiones.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/*@WebServlet("/remove-almacen")
public class removeAlmacen extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idAlmacen = Integer.parseInt(request.getParameter("id"));

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(AlmacenDao.class,
                    dao -> dao.removeAlmacen(idAlmacen));

            response.sendRedirect("list-almacenes.jsp");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}*/

@WebServlet("/remove-almacen")
public class removeAlmacen extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int idAlmacen = Integer.parseInt(request.getParameter("idAlmacen"));

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(AlmacenDao.class,
                    dao -> dao.removeAlmacen(idAlmacen));
            response.sendRedirect("list-almacenes.jsp");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}