package com.svalero.gestiondecamiones.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Ruta {
    private int id;
    private int camion_id;
    private int almacen_origen_id;
    private int almacen_destino_id;
    private Date fecha_salida;
    private String estado;
}
