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
    Ruta getRuta(int id);


    @SqlUpdate("INSERT INTO ruta (id_camion, id_almacen_origen, id_almacen_destino, fecha_salida, estado) VALUES (?,?,?,?,?,?)")
    int addRuta( int id_camion, int id_almacen_origen, int id_almacen_destino, Date fecha_salida, String estado);

    @SqlUpdate("UPDATE ruta SET  id_camion = ?, id_almacen_origen = ?, id_almacen_destino = ?, fecha_salida = ?, estado = ? WHERE id_ruta = ?")
    int updateRuta(int id_camion, int id_almacen_origen, int id_almacen_destino, Date fecha_salida, String estado, int finalID);

    @SqlUpdate("DELETE FROM ruta WHERE id_ruta = ?")
    int removeRuta(int idRuta);
}