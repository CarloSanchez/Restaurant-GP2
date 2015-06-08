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
                usuario.setPasword(rs.getString("password"));
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

    @Override
    public List<Usuario> validarusuario(String login, String password) 
    {
        List<Usuario> lista = new ArrayList<Usuario>();
        Usuario u=null;
        Statement st=null;
        ResultSet rs=null;
        String query="select u.login, u.pasword , u.id_usuario from persona p,usuario u "
                + "where p.id_persona=u.id_usuario and u.login='"+login+"' and u.password='"+password+"'";
         try {
            st=conectar().createStatement();
            rs=st.executeQuery(query);
             while (rs.next()) {
                 u=new Usuario();
                 u.setIdUsuario(rs.getString("id_usuario"));
                 u.setLogin(rs.getString("login"));
                 u.setPasword(rs.getString("password"));
                 lista.add(u);
             }
             conectar().close();
        } 
         catch (Exception e) {
            e.printStackTrace();
             try {
                  conectar().close(); 
             } catch (Exception ex) {
               
             }
        }
         return lista;
    }
    
}
