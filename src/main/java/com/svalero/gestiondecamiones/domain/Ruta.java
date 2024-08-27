package com.svalero.gestiondecamiones.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Ruta {
    private Integer idRuta;
    private Integer idCamion;
    private Integer idAlmacenOrigen_;
    private Integer idAlmacenDestino_;
    private Date fecha_salida;
    private String estado;
}
