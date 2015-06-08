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
import modelo.dao.ClienteDao;
import modelo.entidad.Cliente;
import modelo.entidad.Contrato;
import modelo.entidad.Persona;
import modelo.entidad.PersonaCliente;
import modelo.util.ConexionOracle;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author ADMIN
 */
public class ClienteDaoImpl implements ClienteDao
{
    
    public Connection conecta()
    {
        return ConexionOracle.conectar();
    }

    @Override
    public boolean insertarCliente(Cliente client) {
        Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO Cliente VALUES ('"+client.getIdCliente()+"')";
        System.out.println(query); 
       try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
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
    public List<Cliente> listarCliente() 
    {
        List<Cliente> lista = new ArrayList<Cliente>();
        Cliente client=null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.id_persona, p.nombres, p.ap_pat, p.ap_mat from persona p, cliente c where p.id_persona=c.id_cliente";
        System.out.println(query);
        try {
            
            
             st = conecta().createStatement();
             rs=st.executeQuery(query);
             
                while(rs.next()){
                client = new Cliente();
                client.setIdCliente(rs.getString("id_persona"));
                client.setNombres(rs.getString("nombres"));
                client.setApPat(rs.getString("ap_pat"));
                client.setApMat(rs.getString("ap_mat"));
                lista.add(client);
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
    public Persona buscarCliente(String documento) 
    {
        Persona p = null;
        
        Statement st = null;
        ResultSet rs = null;
        String query = "SELECT p.id_persona, p.nombres, p.ap_pat, p.ap_mat, p.documento from persona p, cliente c "
                + "where p.id_persona=c.id_cliente and p.documento='"+documento+"'";
        System.out.println(query); 
       try {
            st = conecta().createStatement(); // 
            rs = st.executeQuery(query);
            while (rs.next()) { 
                
                p = new Persona();
                p.setIdPersona(rs.getString("id_persona"));
                p.setNombres(rs.getString("nombres"));
                p.setApPat(rs.getString("ap_pat"));
                p.setApMat(rs.getString("ap_mat"));
                p.setDocumento(rs.getString("documento"));
                System.out.println(p.getNombres()+""+p.getDocumento());
                
            }
            
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
                
            } catch (Exception ex) {
            }
        }
        return p;
    }

    @Override
    public List<Cliente> listarPensionista() 
    {
        List<Cliente> lista = new ArrayList<Cliente>();
        Cliente client=null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.id_persona, p.nombres, p.ap_pat, p.ap_mat, p.documento, cn.fecha_ini, cn.fecha_term "
                + "from persona p, cliente c, contrato cn where p.id_persona=c.id_cliente "
                + "and c.id_cliente=cn.id_cliente and sysdate<cn.fecha_term";
        System.out.println(query);
        try {
            
            
             st = conecta().createStatement();
             rs=st.executeQuery(query);
             
                while(rs.next()){
                client = new Cliente();
                client.setNombres(rs.getString("nombres"));
                client.setApPat(rs.getString("ap_pat"));
                client.setApMat(rs.getString("ap_mat"));
                client.setDocumento(rs.getString("documento"));
                client.setFechaIni(rs.getString("fecha_ini"));
                client.setFechaTerm(rs.getString("fecha_term"));
                lista.add(client);
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
    public Persona buscarPensionista(String documento) 
    {
        Persona p = null;
        
        Statement st = null;
        ResultSet rs = null;
        String query = "SELECT p.id_persona, p.nombres, p.ap_pat, p.ap_mat, p.documento from persona p, cliente c, contrato cn "
                + "where p.id_persona=c.id_cliente and c.id_cliente=cn.id_cliente and sysdate<cn.fecha_term and p.documento='"+documento+"'";
        System.out.println(query); 
        //String query2 = "SELECT p.id_persona, p.nombres, p.ap_pat, p.ap_mat, p.documento from persona p, cliente "
               // + "where p.id_persona=c.id_cliente and p.documento=";
       try {
            st = conecta().createStatement(); // 
            rs = st.executeQuery(query);
            while (rs.next()) { 
                
                p = new Persona();
                p.setIdPersona(rs.getString("id_persona"));
                p.setNombres(rs.getString("nombres"));
                p.setApPat(rs.getString("ap_pat"));
                p.setApMat(rs.getString("ap_mat"));
                p.setDocumento(rs.getString("documento"));
                System.out.println("Pensionista");
                
            }
            
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
                
            } catch (Exception ex) {
            }
        }
        return p;
    }

    
    
}
