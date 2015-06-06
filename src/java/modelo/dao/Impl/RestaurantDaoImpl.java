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
import modelo.dao.RestaurantDao;
import modelo.entidad.Categoria;
import modelo.entidad.Cliente;
import modelo.entidad.Contrato;
import modelo.entidad.Ocupacion;
import modelo.entidad.Persona;
import modelo.entidad.Usuario;
import modelo.util.ConexionOracle;
import static modelo.util.ConexionOracle.conectar;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author JUAN
 */
public class RestaurantDaoImpl implements RestaurantDao {
    public Connection conecta(){
        return ConexionOracle.conectar();
    }

      @Override
      
    public List<Usuario> validarusuario(String usuario, String password) 
    {
        List<Usuario>  lista=new ArrayList<Usuario>();
        Usuario u=null;
        Statement st=null;
        ResultSet rs=null;
        String query="select p.nombres ,p.ap_pat,p.ap_mat,p.documento, p.genero,u.login,u.pasword ,u.id_usuario from persona p,usuario u where p.id_persona=u.id_usuario and u.login='"+usuario+"' and u.pasword='"+password+"'";
         try {
            st=conectar().createStatement();
            rs=st.executeQuery(query);
             while (rs.next()) {
                 u=new Usuario();
                 u.setNombres(rs.getString("nombres"));
                 u.setAp_pat(rs.getString("ap_pat"));
                 u.setAp_mat(rs.getString("ap_mat"));
                 u.setDocumento(rs.getString("documento"));
                 u.setGenero(rs.getString("genero"));
                 u.setUser(rs.getString("login"));
                 u.setPassword(rs.getString("pasword"));
                 u.setId_usuario(rs.getString("id_usuario"));
                 
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
         return lista;}
    }



   

