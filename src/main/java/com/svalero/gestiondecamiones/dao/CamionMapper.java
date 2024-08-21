package com.svalero.gestiondecamiones.dao;

import com.svalero.gestiondecamiones.domain.Camion;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CamionMapper implements RowMapper<Camion> {
    @Override
    public Camion map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Camion(rs.getInt("id"),
                rs.getString("matricula"),
                rs.getFloat("capacidad"),
                rs.getString("estado"),
                rs.getString("imagen"));
    }

}
