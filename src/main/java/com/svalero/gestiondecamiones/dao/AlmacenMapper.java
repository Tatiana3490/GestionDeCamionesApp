package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Almacen;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AlmacenMapper implements RowMapper<Almacen> {
    @Override
    public Almacen map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Almacen(rs.getInt("id"),
                rs.getString("nombre"),
                rs.getString("ubicacion"),
                rs.getFloat("capacidad_maxima"));

    }

}