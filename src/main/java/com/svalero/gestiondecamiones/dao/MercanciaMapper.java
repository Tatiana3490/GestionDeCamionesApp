package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Mercancia;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MercanciaMapper implements RowMapper<Mercancia> {
    @Override
    public Mercancia map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Mercancia(rs.getInt("id"),
                rs.getString("nombre"),
                rs.getFloat("peso"),
                rs.getInt("ruta_id"),
                rs.getInt("almacen_destino_id"));
    }

}
