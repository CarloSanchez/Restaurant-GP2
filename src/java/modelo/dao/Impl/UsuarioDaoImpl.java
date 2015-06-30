/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.dao.UsuarioDao;
import modelo.entidad.Plato;
import modelo.entidad.Usuario;
import modelo.util.ConexionOracle;
import static modelo.util.ConexionOracle.conectar;

/**
 *
 * @author ADMIN
 */
public class UsuarioDaoImpl implements UsuarioDao{
    
    public Connection conecta()
    {
        return ConexionOracle.conectar();
    }
    
    public Connection abrirConexion()
    {
    return ConexionOracle.conectar();
    }
  
    
    public void Guardar()
    {
        try {
            ConexionOracle.conectar().commit();
        } catch (Exception e) {
        }
    }
     
    
    public void Revertir()
    {
        try {
            ConexionOracle.conectar().rollback();
        } catch (Exception e) {
        }
    }
    
    
    public void cerrarConexion() 
    {try {
            ConexionOracle.conectar().close();
        } catch (Exception e) {
        }
    
    }

    @Override
    public String validarDatos(String login, String password) 
    {
        String id_usuario=null;
        
        String query = "select id_usuario from usuario"
                + " where upper(login) ='"+login.toUpperCase()+"' and password ='"+password+"'";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            if (rs.next()) {
                id_usuario = rs.getString("id_usuario");
            }
            cerrarConexion();
        } catch (Exception e) {
            cerrarConexion();
            e.printStackTrace();
            System.out.println("ERROR:"+e.getMessage());
        }
        return id_usuario;
    }

    @Override
    public Usuario mostrarUsuario(String idUsuario) 
    {
        Usuario usuario = null;// para que el recolector de basura lo lleve
        String query = "SELECT p.ap_pat||' '||p.ap_mat||', '||p.nombres as usuar FROM persona p, usuario u"
                + " WHERE p.id_persona=u.id_usuario and id_usuario='"+idUsuario+"'";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            if (rs.next()) {
                
                usuario = new Usuario();// crea una entidad que puede almacenar n registros
                usuario.setUsuarioo(rs.getString("usuar"));
            }
            cerrarConexion();
        } catch (Exception e) {
            cerrarConexion();
            e.printStackTrace();
            System.out.println("ERROR:"+e.getMessage());
        }
        return usuario;
    }

    @Override
    public List<Usuario> listarUsuario() 
    {
    List<Usuario> lista = new ArrayList<Usuario>();
        Usuario usuario = null;
        Statement st = null;
        ResultSet rs = null;
        String query ="select id_usuario, login, password from usuario";
       try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {  
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getString("id_usuario"));
                usuario.setLogin(rs.getString("login"));
                usuario.setPassword(rs.getString("password"));
                lista.add(usuario);
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return lista;
    }


   
}
