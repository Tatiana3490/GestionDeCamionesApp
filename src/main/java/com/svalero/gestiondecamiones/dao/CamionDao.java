package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Almacen;
import com.svalero.gestiondecamiones.domain.Camion;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface CamionDao {

    @SqlQuery("SELECT * FROM camion")
    @UseRowMapper(CamionMapper.class)
    List<Camion> getAllCamiones();

    @SqlQuery("SELECT * FROM camion WHERE id_camion = ?")
    @UseRowMapper(CamionMapper.class)
    Camion getCamion(int     id);

    @SqlUpdate("INSERT INTO camion (matricula, capacidad, estado, imagen) VALUES (?,?,?,?)")
    int addCamion(String matricula, float capacidad, String estado, String imagen);

    @SqlUpdate("UPDATE camion SET matricula = ?, capacidad = ?, estado = ?, imagen = ? WHERE id_camion = ?")
    int updateCamion(String matricula, float capacidad, String estado, String imagen, int finalID);

    @SqlUpdate("DELETE FROM camion WHERE id_camion = ?")
    int removeCamion(int idCamion);

    @SqlQuery("SELECT * FROM camion WHERE matricula LIKE CONCAT('%',:searchTerm,'%') " +
            "AND estado LIKE CONCAT('%',:searchTerm2,'%')")

    @UseRowMapper(CamionMapper.class)
    List<Camion> searchCamion(@Bind("searchTerm") String searchTerm, @Bind("searchTerm2") String searchTerm2);


};
