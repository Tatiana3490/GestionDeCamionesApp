package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Mercancia;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface MercanciaDao {

    @SqlQuery("SELECT * FROM mercancia")
    @UseRowMapper(MercanciaMapper.class)
    List<Mercancia> getAllMercancias();

    @SqlQuery("SELECT * FROM mercancia WHERE id_mercancia = ?")
    @UseRowMapper(MercanciaMapper.class)
    Mercancia getMercancia(Integer id);

    @SqlUpdate("INSERT INTO mercancia (nombre, peso) VALUES (?,?)")
    Integer addMercancia(String nombre, float peso, Integer id_ruta, Integer id_almacen_destino);

    @SqlUpdate("UPDATE mercancia SET nombre = ?, peso = ?, id_ruta = ?, id_almacen_destino = ?WHERE idMercancia = ?")

    int updateMercancia(String nombre, float peso, Integer id_ruta, Integer id_almacen_destino, int finalID);

    @SqlUpdate("DELETE FROM mercancia WHERE idMercancia = ?")
    Integer removeMercancia(int idMercancia);

}
