package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Ruta;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.Date;
import java.util.List;

public interface RutaDao {

    @SqlQuery("SELECT * FROM ruta")
    @UseRowMapper(RutaMapper.class)
    List<Ruta> getAllRutas();


    @SqlQuery("SELECT * FROM ruta WHERE id_ruta = ?")
    @UseRowMapper(RutaMapper.class)
    Ruta getRuta(Integer id);

/*los id que no son el principal, ¿no los tengo que poner verdad?*/
    @SqlUpdate("INSERT INTO ruta (id_camion, id_almacen_origen, id_almacen_destino, fecha_salida, estado) VALUES (?,?,?,?,?,?)")
    Integer addRuta( Integer id_camion, Integer id_almacen_origen, Integer id_almacen_destino, Date fecha_salida, String estado);

    @SqlUpdate("UPDATE ruta SET  id_camion = ?, id_almacen_origen = ?, id_almacen_destino = ?, fecha_salida = ?, estado = ? WHERE idRuta = ?")
    int updateRuta(Integer id_camion, Integer id_almacen_origen, Integer id_almacen_destino, Date fecha_salida, String estado, int finalID);

    @SqlUpdate("DELETE FROM ruta WHERE idRuta = ?")
    Integer removeRuta(int idRuta);
}