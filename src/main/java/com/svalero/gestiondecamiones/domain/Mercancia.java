package com.svalero.gestiondecamiones.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Mercancia {
    private int idMercancia;
    private String nombre;
    private float peso;
    private int idRuta;
    private int idAlmacenDestino_;
}
