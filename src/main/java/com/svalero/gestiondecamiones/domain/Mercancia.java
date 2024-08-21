package com.svalero.gestiondecamiones.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Mercancia {
    private int id;
    private String nombre;
    private float peso;
    private int ruta_id;
    private int almacen_destino_id;
}
