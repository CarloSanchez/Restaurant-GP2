/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.dao.PlatoDao;
import modelo.entidad.Plato;
import modelo.util.ConexionOracle;

/**
 *
 * @author ADMIN
 */
public class PlatoDaoImpl implements PlatoDao{
    
     public Connection conecta()
    {
        return ConexionOracle.conectar();
    }

    @Override
    public boolean insertarPlato(Plato plato) 
    {
        Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO Plato(id_categoria, nombre, precio_normal, precio_pensionista) VALUES ('"+plato.getIdCategoria()+"','"+plato.getNombre()+"',"
                + "'"+plato.getPrecioPensionista()+"','"+plato.getPrecioNormal()+"')";
        System.out.println(query); 
       try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            out.println();
            try {
                conecta().rollback();
                conecta().close();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public List<Plato> listarPlato() 
    {
        List<Plato> lista = new ArrayList<Plato>();
        Plato plato=null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.id_plato, p.nombre, p.precio_pensionista, p.precio_normal"
                + " from categoria c, plato p where c.id_categoria=p.id_categoria";
        System.out.println(query);
        try {
            
            
             st = conecta().createStatement();
             rs=st.executeQuery(query);
             
                while(rs.next()){
                plato = new Plato();
                plato.setIdPlato(rs.getString("id_plato"));
                plato.setNombre(rs.getString("nombre"));
                plato.setPrecioPensionista(rs.getString("precio_pensionista"));
                plato.setPrecioNormal(rs.getString("precio_normal"));
                lista.add(plato);
                }
             
             conecta().close();
            //System.out.println(lista);
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
    public List<Plato> listaPlato() 
    {
        List<Plato> lista = new ArrayList<Plato>();
        Plato plato=null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.id_plato, p.nombre, p.precio_pensionista, p.precio_normal"
                + " from categoria c, plato p where c.id_categoria=p.id_categoria";
        System.out.println(query);
        try {
            
            
             st = conecta().createStatement();
             rs=st.executeQuery(query);
             
                while(rs.next()){
                plato = new Plato();
                plato.setIdPlato(rs.getString("id_plato"));
                plato.setNombre(rs.getString("nombre"));
                plato.setPrecioPensionista(rs.getString("precio_pensionista"));
                plato.setPrecioNormal(rs.getString("precio_normal"));
                lista.add(plato);
                }
             
             conecta().close();
            //System.out.println(lista);
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
