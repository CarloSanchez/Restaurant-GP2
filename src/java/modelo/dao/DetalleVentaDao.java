/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import modelo.entidad.DetalleVenta;
import modelo.entidad.Venta;

/**
 *
 * @author ADMIN
 */
public interface DetalleVentaDao {
     
    public boolean insertDetalleVenta(DetalleVenta dv);
    public boolean ejecutarActStock(String idPlato, String cantidad);
    public Venta obtenerIdVenta(String idCliente);
    public List<DetalleVenta> listarDetalle(String idVenta);
    public List<DetalleVenta> listarVentas();
    public boolean eliminarDetalleVenta(String idVenta, String idPlato);
    
}
