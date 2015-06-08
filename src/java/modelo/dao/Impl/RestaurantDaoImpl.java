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
    
    }