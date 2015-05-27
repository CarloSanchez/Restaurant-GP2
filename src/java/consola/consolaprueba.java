/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consola;

import modelo.dao.Impl.RestaurantDaoImpl;
import modelo.dao.RestaurantDao;
import modelo.entidad.Cliente;
import modelo.entidad.Persona;

/**
 *
 * @author JUAN
 */
public class consolaprueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        consolaprueba d = new consolaprueba();
        //d.Insert();
        //d.Update();
        d.InsertCliente();
        
    }
    
     public void Insert(){
        RestaurantDao rest = new RestaurantDaoImpl();
        Persona p = new Persona();
        
        p.setIdPersona(" ");
        p.setNombres("aaaaaaaaa");
        p.setApPat("aaa");
        p.setApMat("rrrrrrrrrrr");
        p.setDocumento("45353222");
        p.setGenero("F");
        
        if (rest.agregarPersona(p)) {
           System.out.println(""+p.getNombres());
            System.out.println("Se agrego el cliente...");
            
        } else {
            System.out.println("No se agrego el cliente");
           System.out.println(""+p.getNombres());
        }
    }
     
     public void Update(){
        RestaurantDao rest = new RestaurantDaoImpl();
        Persona p = new Persona();
        
        p.setIdPersona("P-LE938273CARUSTA");
        p.setNombres("Carmen Stefany");
        p.setApPat("Leyva");
        p.setApMat("Bustamante");
        p.setDocumento("72837283");
        p.setGenero("F");
        
        if (rest.modificarPersona(p)) {
            System.out.println("Se modifico el cliente...");
            
        } else {
            System.out.println("No se modifico el cliente");
        }
    }
     
     public void InsertCliente(){
        RestaurantDao rest = new RestaurantDaoImpl();
        Persona p = new Persona();
         Cliente c = new Cliente();
        
        c.setIdCliente(p.getIdPersona());
        
        if (rest.insertarCliente(c)) {
           System.out.println(""+c.getIdCliente());
            System.out.println("Se agrego el cliente...");
            
        } else {
            System.out.println("No se agrego el cliente");
           System.out.println(""+p.getNombres());
        }
    }
}
