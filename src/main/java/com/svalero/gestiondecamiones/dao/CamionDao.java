package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Camion;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface CamionDao {

    @SqlQuery("SELECT * FROM camiones")
    @UseRowMapper(CamionMapper.class)
    List<Camion> getAllCamiones();


}
