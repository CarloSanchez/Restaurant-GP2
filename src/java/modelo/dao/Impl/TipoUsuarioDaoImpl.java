/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import modelo.dao.TipoUsuarioDao;
import modelo.entidad.TipoUsuario;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author USUARIO
 */
public class TipoUsuarioDaoImpl implements TipoUsuarioDao
{

    @Override
    public boolean agregarTipoUsuario(TipoUsuario tipousuario) 
    {
     boolean estado = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(tipousuario);
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
    public List<TipoUsuario> listarTipoUsuario() 
    {
    List<TipoUsuario> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<TipoUsuario>();
            Query query = session.createQuery("FROM TipoUsuario");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }
     
    }
    

