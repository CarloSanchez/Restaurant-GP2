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
import modelo.dao.ControlDao;
import modelo.dao.DetalleVentaDao;
import modelo.entidad.Control;
import modelo.entidad.DetalleVenta;
import modelo.entidad.Persona;
import modelo.util.ConexionOracle;

/**
 *
 * @author ADMIN
 */
public class ControlDaoImpl implements ControlDao {

    public Connection conecta() 
    {
        return ConexionOracle.conectar();
    }

    @Override
    public boolean ejecutarControl(String idCliente) {
        Statement st = null;
        boolean flat = false;
        String query = " begin TurnoComida('" + idCliente + "'); end;";
        System.out.println(query);
        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();//metodo que contiene el commit();
            conecta().close();//metodo que contiene el .Close(); para cerrar conexion
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();//metodo que contiene el rollback();
                conecta().close();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public List<Control> listarControl() 
    {
        List<Control> lista = new ArrayList<Control>();
        Control control = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select c.id_cliente, p.nombres||', '||p.ap_pat||' '|| p.ap_mat "
                + "as pensionista, ct.control_comida as turno, ct.fecha as fecha "
                + "from persona p, cliente c, contrato cn, control ct "
                + "where p.id_persona=c.id_cliente and c.id_cliente=cn.id_cliente "
                + "and c.id_cliente=ct.id_cliente and cn.id_contrato=ct.id_contrato order by ct.fecha";
        System.out.println(query);
        try {

            st = conecta().createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {
                control = new Control();
                control.setIdCliente(rs.getString("id_cliente"));
                control.setPensionista(rs.getString("pensionista"));
                control.setTurno(rs.getString("turno"));
                control.setFecha(rs.getString("fecha"));
                lista.add(control);
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
    public List<Control> listarDetalleConsumo(String idCliente, String fecha) 
    {
        List<Control> lista = new ArrayList<Control>();
        Control control = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select p.nombre as plato, "
            + "decode(v.COMIDA_DAC,'D','DESAYUNO','A','ALMUERZO','C','CENA') "
            + "as turno from plato p, detalle_venta dv, venta v, control ct, "
            + "cliente c where ct.id_cliente=c.id_cliente and c.id_cliente=v.id_cliente "
            + "and v.id_venta=dv.id_venta and dv.id_plato=p.id_plato and "
            + "c.id_cliente='"+idCliente+"' and ct.fecha='"+fecha+"' order by ct.fecha";
        System.out.println(query);
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                control = new Control();
                control.setPlato(rs.getString("plato"));
                control.setTurno(rs.getString("turno"));
                lista.add(control);
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
    public List<DetalleVenta> listarVentas(String fecha1, String fecha2) 
    {
        List<DetalleVenta> lista = new ArrayList<DetalleVenta>();
        DetalleVenta dv = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select v.id_venta, sum(dv.cantidad) as cantidad, dv.precio,"
                + " 'S/.'||(sum(dv.precio*dv.cantidad)) as total "
                + "from detalle_venta dv, plato p, venta v, cliente c, contrato cnt "
                + "where cnt.id_cliente=c.id_cliente and c.id_cliente=v.id_cliente and "
                + "v.id_venta=dv.id_venta and  dv.id_plato=p.id_plato and "
                + "v.fecha between to_char('"+fecha1+"') "
                + "and to_char('"+fecha2+"') and SYSDATE>cnt.fecha_term group by v.id_venta,dv.precio";
        
        System.out.println(query);
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                dv = new DetalleVenta();
                dv.setIdVenta(rs.getString("id_venta"));
                dv.setCantidad(rs.getString("cantidad"));
                dv.setPrecio(rs.getString("precio"));
                dv.setTotal(rs.getString("total"));
                lista.add(dv);
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
    public List<DetalleVenta> listarTotal(String fecha1, String fecha2) 
    {
        List<DetalleVenta> lista = new ArrayList<DetalleVenta>();
        DetalleVenta dv = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select sum(cantidad*precio) as ttotal from detalle_venta "
                + "fecha between to_char('"+fecha1+"') "
                + "and to_char('"+fecha2+"') and SYSDATE>cnt.fecha_term group by v.id_venta,dv.precio";
        
        System.out.println(query);
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                dv = new DetalleVenta();
                
                dv.setTtotal(rs.getString("ttotal"));
                lista.add(dv);
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

}
