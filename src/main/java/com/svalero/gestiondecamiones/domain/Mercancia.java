package com.svalero.gestiondecamiones.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Mercancia {
    private Integer idMercancia;
    private String nombre;
    private float peso;
    private Integer idRuta;
    private Integer idAlmacenDestino_;
}
