package modelo.entidad;
// Generated 30/05/2015 10:45:59 PM by Hibernate Tools 4.3.1



/**
 * Ocupacion generated by hbm2java
 */
public class Ocupacion  implements java.io.Serializable {


     private String idTipoCliente;
     private String nombre;

    public Ocupacion() {
    }

	
    public Ocupacion(String idTipoCliente) {
        this.idTipoCliente = idTipoCliente;
    }
    public Ocupacion(String idTipoCliente, String nombre) {
       this.idTipoCliente = idTipoCliente;
       this.nombre = nombre;
    }
   
    public String getIdTipoCliente() {
        return this.idTipoCliente;
    }
    
    public void setIdTipoCliente(String idTipoCliente) {
        this.idTipoCliente = idTipoCliente;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }




}

