/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import modelo.entidad.Contrato;

/**
 *
 * @author ADMIN
 */
public interface ContratoDao {
    
     public boolean ejecutar1(String idCliente, String idOcupacion, String precio);
     public boolean crearContrato(Contrato contrato);
}
