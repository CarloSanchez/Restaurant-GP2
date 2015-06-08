/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import modelo.dao.TipoVentaDao;
import modelo.entidad.TipoVenta;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


/**
 *
 * @author USUARIO
 */
public class TipoVentaDaoImpl implements TipoVentaDao
{

    @Override
    public boolean insertarTipoVenta(TipoVenta tipoventa) 
    {
    boolean estado = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(tipoventa);
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
    public List<TipoVenta> listarTipoVenta() 
    {
    
        List<TipoVenta> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<TipoVenta>();
            Query query = session.createQuery("FROM TipoVenta");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista; 
    }
 }

   
