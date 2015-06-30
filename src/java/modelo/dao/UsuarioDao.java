/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import modelo.entidad.Usuario;

/**
 *
 * @author ADMIN
 */
public interface UsuarioDao {
    public List<Usuario> listarUsuario();
    public String validarDatos(String login, String password);
    public Usuario mostrarUsuario(String idUsuario); 
}
