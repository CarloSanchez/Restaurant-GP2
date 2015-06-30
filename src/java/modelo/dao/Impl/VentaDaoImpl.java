/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;


import java.sql.Connection;
import java.sql.Statement;
import modelo.dao.VentaDao;
import modelo.entidad.Venta;
import modelo.util.ConexionOracle;

/**
 *
 * @author ADMIN
 */
public class VentaDaoImpl implements VentaDao{
    
    public Connection conecta()
    {
        return ConexionOracle.conectar();
    }

    @Override
    public boolean realizarVenta(Venta venta) 
    {
        Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO venta(id_cliente, id_usuario, id_tipoventa, comida_DAC, fecha) "
                + "VALUES ('"+venta.getIdCliente()+"','"+venta.getIdUsuario()+"',"
                + "'"+venta.getIdTipoventa()+"','"+venta.getComidaDAC()+"',"
                + "to_char(sysdate,'dd/mm/yyyy'))";
        System.out.println(query); 
       try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            try {
                System.out.println(e.getMessage());
                conecta().rollback();
                conecta().close();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }
    
}
