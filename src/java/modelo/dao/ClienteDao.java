/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import modelo.entidad.Cliente;
import modelo.entidad.Persona;

/**
 *
 * @author ADMIN
 */
public interface ClienteDao {
    
     public boolean insertarCliente(Cliente client);
     public Persona buscarCliente(String documento);
     public List<Cliente> listarCliente();
     public List<Cliente> listarPensionista();
     public Persona buscarPensionista(String documento);
}
