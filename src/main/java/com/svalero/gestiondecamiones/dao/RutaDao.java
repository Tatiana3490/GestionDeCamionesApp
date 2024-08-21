package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Camion;
import com.svalero.gestiondecamiones.domain.Ruta;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface RutaDao {

    @SqlQuery("SELECT * FROM rutas")
    @UseRowMapper(RutaMapper.class)
    List<Ruta> getAllRutas();


}