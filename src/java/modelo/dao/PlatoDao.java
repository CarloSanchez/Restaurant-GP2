/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import modelo.entidad.Plato;

/**
 *
 * @author ADMIN
 */
public interface PlatoDao {
    
    public boolean insertarPlato(Plato plato);
     public List<Plato> listarPlato();
     public List<Plato> listaPlato();
}
