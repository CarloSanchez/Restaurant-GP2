/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.dao.OcupacionDao;
import modelo.entidad.Ocupacion;
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
public class OcupacionDaoImpl implements OcupacionDao{
    
    public Connection conecta()
    {
        return ConexionOracle.conectar();
    }

    @Override
    public List<Ocupacion> listarOcupacion() 
    {
        List<Ocupacion> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Ocupacion>();
            Query query = session.createQuery("FROM Ocupacion");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista; 
    }

    @Override
    public boolean insertarOcupacion(Ocupacion ocupacion) 
    {
        boolean estado = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(ocupacion);
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
    
}
