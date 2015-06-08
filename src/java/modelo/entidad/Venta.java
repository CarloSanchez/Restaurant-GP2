/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entidad;

/**
 *
 * @author ADMIN
 */
public class Venta {
     private String idVenta;
     private String idCliente;
     private String idUsuario;
     private String idTipoventa;
     private String numeroVenta;
     private String comidaDAC;
     private String fecha;

    public Venta() {
        this.idVenta="";
        this.numeroVenta="";
    }

    public String getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(String idVenta) {
        this.idVenta = idVenta;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getIdTipoventa() {
        return idTipoventa;
    }

    public void setIdTipoventa(String idTipoventa) {
        this.idTipoventa = idTipoventa;
    }

    public String getNumeroVenta() {
        return numeroVenta;
    }

    public void setNumeroVenta(String numeroVenta) {
        this.numeroVenta = numeroVenta;
    }

    public String getComidaDAC() {
        return comidaDAC;
    }

    public void setComidaDAC(String comidaDAC) {
        this.comidaDAC = comidaDAC;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
     
     
    
}
