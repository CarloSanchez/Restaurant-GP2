/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import modelo.dao.PersonaDao;
import modelo.entidad.Persona;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author ADMIN
 */
public class PersonaDaoImpl implements PersonaDao{

    @Override
    public boolean agregarPersona(Persona persona) {
    boolean estado = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(persona);
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
        return estado;    }

    @Override
    public List<Persona> listarpersona() {
     List<Persona> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Persona>();
            Query query = session.createQuery("FROM Persona");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;    }

    @Override
    public boolean modificarPersona(Persona persona) {
      boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session =  sf.openSession();
            transaction = session.beginTransaction();
            
            Persona cUpdate = (Persona)session.get(Persona.class, persona.getIdPersona());
            cUpdate.setIdPersona(persona.getIdPersona());
            cUpdate.setNombres(persona.getNombres());
            cUpdate.setApPat(persona.getApPat());
            cUpdate.setApMat(persona.getApMat());
            cUpdate.setDocumento(persona.getDocumento());
            cUpdate.setGenero(persona.getGenero());
            session.update(cUpdate);
            transaction.commit();
            session.close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
            flat = false;
        }
        return flat;    }

    @Override
    public boolean eliminarPersona(Persona persona) 
    {
        boolean estado = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction t = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            t = session.beginTransaction();
            session.save(persona);
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
    public Persona buscarPersona(String documento) 
    {
        Persona persona = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            Query query = session.createQuery("FROM Persona WHERE documento='"+documento+"'");
            persona = (Persona)query.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return persona;
    }
    
}
