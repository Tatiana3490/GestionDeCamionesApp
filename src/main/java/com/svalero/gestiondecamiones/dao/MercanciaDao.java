package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Camion;
import com.svalero.gestiondecamiones.domain.Mercancia;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface MercanciaDao {

    @SqlQuery("SELECT * FROM mercancias")
    @UseRowMapper(MercanciaMapper.class)
    List<Mercancia> getAllMercancias();


}
