package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Ruta;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RutaMapper implements RowMapper<Ruta> {
    @Override
    public Ruta map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Ruta(rs.getInt("id_ruta"),
                rs.getInt("id_camion"),
                rs.getInt("id_almacen_origen"),
                rs.getInt("id_almacen_destino"),
                rs.getDate("fecha_salida"),
                rs.getString("estado"));
    }

}