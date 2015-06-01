/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import java.sql.Connection;
import java.sql.Statement;
import modelo.dao.ContratoDao;
import modelo.entidad.Contrato;
import modelo.util.ConexionOracle;
import static modelo.util.ConexionOracle.conectar;

/**
 *
 * @author ADMIN
 */
public class ContratoDaoImpl implements ContratoDao{
    
     public Connection conecta()
    {
        return ConexionOracle.conectar();
    }

    @Override
    public boolean ejecutar1(String idCliente, String idOcupacion, String precio) 
    {
        Statement st = null;
        boolean flat = false;
        String query = " begin crearContrato('"+idCliente+"','"+idOcupacion+"','"+precio+"'); end; "; 
        System.out.println(query);
        try {
            st = conectar().createStatement();
            st.executeUpdate(query);
            conectar().commit();//metodo que contiene el commit();
            conectar().close();//metodo que contiene el .Close(); para cerrar conexion
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conectar().rollback();//metodo que contiene el rollback();
                conectar().close();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public boolean crearContrato(Contrato contrato) 
    {
        Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO Contrato(id_cliente, id_ocupacion,fecha, fecha_ini, fecha_term, precio, id_usuario) "
                + "VALUES('"+contrato.getIdCliente()+"','"+contrato.getIdOcupacion()+"',to_char(sysdate),'"+contrato.getFechaIni()+"','"+contrato.getFechaTerm()+"','"+contrato.getPrecio()+"','')";
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
    }
    

