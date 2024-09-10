package com.svalero.gestiondecamiones.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Almacen {
    private int idAlmacen;
    private String nombre;
    private String ubicacion;
    private float capacidad_maxima;


}
