package com.svalero.gestiondecamiones.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Camion {
    private Integer idCamion;
    private String matricula;
    private float capacidad;
    private String estado;
    private String imagen;

}
