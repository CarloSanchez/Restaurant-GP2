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
public class Plato {
    
    private String idPlato;
    private String idCategoria;
    private String nombre;
    private String descripcion;
    private String stock;
    private String precioPensionista;
    private String precioNormal;

    public Plato() {
        this.idPlato="";
    }

    public String getIdPlato() {
        return idPlato;
    }

    public void setIdPlato(String idPlato) {
        this.idPlato = idPlato;
    }

    public String getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getPrecioPensionista() {
        return precioPensionista;
    }

    public void setPrecioPensionista(String precioPensionista) {
        this.precioPensionista = precioPensionista;
    }

    public String getPrecioNormal() {
        return precioNormal;
    }

    public void setPrecioNormal(String precioNormal) {
        this.precioNormal = precioNormal;
    }

   
}
