package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Almacen;
import com.svalero.gestiondecamiones.domain.Camion;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface AlmacenDao {

    @SqlQuery("SELECT * FROM almacenes")
    @UseRowMapper(AlmacenMapper.class)
    List<Almacen> getAllAlmacen();


}