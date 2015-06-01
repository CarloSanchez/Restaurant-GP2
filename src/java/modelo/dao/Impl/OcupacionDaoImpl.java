/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import modelo.dao.OcupacionDao;
import modelo.entidad.Ocupacion;
import modelo.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author ADMIN
 */
public class OcupacionDaoImpl implements OcupacionDao{

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
    
}
