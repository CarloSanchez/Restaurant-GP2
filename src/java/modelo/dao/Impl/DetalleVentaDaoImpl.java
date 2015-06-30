/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao.Impl;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.dao.DetalleVentaDao;
import modelo.entidad.DetalleVenta;
import modelo.entidad.Venta;
import modelo.util.ConexionOracle;

/**
 *
 * @author ADMIN
 */
public class DetalleVentaDaoImpl implements DetalleVentaDao {

    public Connection conecta() {
        return ConexionOracle.conectar();
    }

    @Override
    public boolean insertDetalleVenta(DetalleVenta dv) {
        Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO detalle_venta(id_venta, id_plato, fecha, precio, cantidad) "
                + "values('" + dv.getIdVenta() + "','" + dv.getIdPlato() + "',to_char(sysdate,'dd/mm/yyyy'),'" + dv.getPrecio() + "','" + dv.getCantidad() + "')";
        System.out.println(query);
        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            out.println();
            try {
                conecta().rollback();
                conecta().close();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public boolean ejecutarActStock(String idPlato, String cantidad) {
        Statement st = null;
        boolean flat = false;
        String query = " begin actStock('" + idPlato + "','"+cantidad+"'); end; ";
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
    public Venta obtenerIdVenta(String idCliente) {

        Venta venta = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select max(v.id_venta)idVenta from venta v, cliente c "
                + "where c.id_cliente=v.id_cliente and c.id_cliente='" + idCliente + "'";
        System.out.println(query);
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            if (rs.next()) {

                venta = new Venta();
                venta.setIdVenta(rs.getString("idVenta"));
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
        return venta;
    }

    @Override
    public List<DetalleVenta> listarDetalle(String idVenta) {
        List<DetalleVenta> lista = new ArrayList<DetalleVenta>();
        DetalleVenta dv = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select v.numero_venta, p.nombre, dv.fecha, dv.precio,"
                + " 'S/.'||(dv.precio*dv.cantidad)||',00' as total, "
                + "dv.cantidad from plato p, detalle_venta dv, venta v "
                + "where p.id_plato=dv.id_plato and dv.id_venta=v.id_venta "
                + "and v.id_venta='" + idVenta + "'";
        System.out.println(query);
        try {

            st = conecta().createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {
                dv = new DetalleVenta();
                dv.setFecha(rs.getString("fecha"));
                dv.setPrecio(rs.getString("precio"));
                dv.setNumeroVenta(rs.getString("numero_venta"));
                dv.setNombre(rs.getString("nombre"));
                dv.setCantidad(rs.getString("cantidad"));
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
    public List<DetalleVenta> listarVentas() 
    {
       List<DetalleVenta> lista = new ArrayList<DetalleVenta>();
        DetalleVenta dv = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select v.numero_venta, p.nombre, dv.fecha, dv.precio, "
                + "dv.cantidad from plato p, detalle_venta dv, venta v "
                + "where p.id_plato=dv.id_plato and dv.id_venta=v.id_venta "
                + "and v.id_venta=''";
        System.out.println(query);
        try {

            st = conecta().createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {
                dv = new DetalleVenta();
                dv.setFecha(rs.getString("fecha"));
                dv.setPrecio(rs.getString("precio"));
                dv.setNumeroVenta(rs.getString("numero_venta"));
                dv.setNombre(rs.getString("nombre"));
                dv.setCantidad(rs.getString("cantidad"));
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
    public boolean eliminarDetalleVenta(String idVenta, String idPlato) 
    {
        Statement st = null;
        boolean flat = false;
        String query = "delete from detalle_venta where id_venta='"+idVenta+"' and id_plato='"+idPlato+"'";
        System.out.println(query);
        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            out.println();
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
