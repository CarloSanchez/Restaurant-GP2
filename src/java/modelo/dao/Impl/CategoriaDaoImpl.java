/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import modelo.dao.CategoriaDao;
import modelo.entidad.Categoria;
import modelo.entidad.Persona;
import modelo.util.ConexionOracle;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ADMIN
 */
public class CategoriaDaoImpl implements CategoriaDao{
    
     public Connection conecta()
    {
        return ConexionOracle.conectar();
    }

    @Override
    public boolean agregarCategoria(Categoria categoria) 
    {
        boolean estado = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(categoria);
            t.commit();
            session.close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            estado = false;
            t.rollback();
            session.close();
            System.out.println("Error: "+e.getMessage());
        }
        return estado; 
    }

    @Override
    public List<Categoria> listarCategoria() 
    {
        List<Categoria> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Categoria>();
            Query query = session.createQuery("FROM Categoria");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }
     
     
    
}
