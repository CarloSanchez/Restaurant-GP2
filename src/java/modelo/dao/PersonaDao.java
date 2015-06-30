/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import modelo.entidad.Persona;

/**
 *
 * @author ADMIN
 */
public interface PersonaDao {
    public boolean agregarPersona(Persona persona);
    public List<Persona> listarpersona();
    public boolean modificarPersona(Persona persona);
    public boolean eliminarPersona(Persona persona);
    public Persona buscarPersona(String documento);
    public Persona obtenerPersona(String idCliente);
    
}
