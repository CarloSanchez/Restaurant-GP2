/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entidad;


import java.sql.Date;



/**
 *
 * @author ADMIN
 */
public class Contrato {
    
    private String idContrato;
    private String idCliente;
    private String idOcupacion;
    private String fecha;
    private String fechaIni;
    private String fechaTerm;
    private String precio;
    private String idUsuario;
    
    

    public Contrato() {
        this.idContrato="";
    }

    public String getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(String idContrato) {
        this.idContrato = idContrato;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public String getIdOcupacion() {
        return idOcupacion;
    }

    public void setIdOcupacion(String idOcupacion) {
        this.idOcupacion = idOcupacion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getFechaIni() {
        return fechaIni;
    }

    public void setFechaIni(String fechaIni) {
        this.fechaIni = fechaIni;
    }

    public String getFechaTerm() {
        return fechaTerm;
    }

    public void setFechaTerm(String fechaTerm) {
        this.fechaTerm = fechaTerm;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    
    
}
