package com.svalero.gestiondecamiones.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Ruta {
    private int idRuta;
    private int idCamion;
    private int idAlmacenOrigen_;
    private int idAlmacenDestino_;
    private Date fecha_salida;
    private String estado;
}
