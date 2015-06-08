/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import modelo.entidad.Categoria;

/**
 *
 * @author ADMIN
 */
public interface CategoriaDao {
    
     public boolean agregarCategoria(Categoria categoria);
    public List<Categoria> listarCategoria();
    
}
