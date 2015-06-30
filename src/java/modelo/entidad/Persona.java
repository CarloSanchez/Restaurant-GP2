package modelo.entidad;
// Generated 08/06/2015 03:44:10 PM by Hibernate Tools 4.3.1



/**
 * Persona generated by hbm2java
 */
public class Persona  implements java.io.Serializable {


     private String idPersona;
     private String nombres;
     private String apPat;
     private String apMat;
     private String documento;
     private String genero;
     private String person;

    public Persona() {
        this.idPersona="";
    }

	
    public Persona(String idPersona) {
        this.idPersona = idPersona;
    }
    public Persona(String idPersona, String nombres, String apPat, String apMat, String documento, String genero) {
       this.idPersona = idPersona;
       this.nombres = nombres;
       this.apPat = apPat;
       this.apMat = apMat;
       this.documento = documento;
       this.genero = genero;
    }
   
    public String getIdPersona() {
        return this.idPersona;
    }
    
    public void setIdPersona(String idPersona) {
        this.idPersona = idPersona;
    }
    public String getNombres() {
        return this.nombres;
    }
    
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    public String getApPat() {
        return this.apPat;
    }
    
    public void setApPat(String apPat) {
        this.apPat = apPat;
    }
    public String getApMat() {
        return this.apMat;
    }
    
    public void setApMat(String apMat) {
        this.apMat = apMat;
    }
    public String getDocumento() {
        return this.documento;
    }
    
    public void setDocumento(String documento) {
        this.documento = documento;
    }
    public String getGenero() {
        return this.genero;
    }
    
    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

}


