package com.svalero.gestiondecamiones.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Almacen {
    private int id;
    private String nombre;
    private String ubicacion;
    private float capacidad_maxima;


}
