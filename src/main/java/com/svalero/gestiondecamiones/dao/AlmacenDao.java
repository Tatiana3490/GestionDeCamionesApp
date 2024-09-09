package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Almacen;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface AlmacenDao {

    @SqlQuery("SELECT * FROM almacen")
    @UseRowMapper(AlmacenMapper.class)
    List<Almacen> getAllAlmacenes();

    @UseRowMapper(AlmacenMapper.class)
    List<Almacen> getAlmacenes(@Bind("searchTerm") String searchTerm);

    @SqlQuery("SELECT * FROM almacen WHERE id_almacen = ?")
    @UseRowMapper(AlmacenMapper.class)
    Almacen getAlmacen(Integer id);

    @SqlUpdate("INSERT INTO almacen (nombre, ubicacion, capacidad_maxima) VALUES (?,?,?)")
    Integer addAlmacen(String nombre, String ubicacion, float capacidad_maxima);

    @SqlUpdate("UPDATE almacen SET nombre = ?, ubicacion = ?, capacidad_maxima = ? WHERE id_almacen = ?")
    int updateAlmacen(String nombre, String ubicacion, float capacidad_maxima, int finalID);

    @SqlUpdate("DELETE FROM almacen WHERE id_almacen = ?")
    Integer removeAlmacen(int idAlmacen);

}