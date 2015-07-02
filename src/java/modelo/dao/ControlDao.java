/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import modelo.entidad.Control;
import modelo.entidad.DetalleVenta;
import modelo.entidad.Persona;

/**
 *
 * @author ADMIN
 */
public interface ControlDao {
    public boolean ejecutarControl(String idCliente);
    public List<Control> listarControl();
    public List<Control> listarDetalleConsumo(String idCliente, String fecha);
    public List<DetalleVenta> listarVentas(String fecha1, String fecha2);
    public List<DetalleVenta> listarTotal(String fecha1, String fecha2); 
}
