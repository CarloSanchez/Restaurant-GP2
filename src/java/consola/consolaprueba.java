/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consola;

import modelo.dao.ClienteDao;
import modelo.dao.ContratoDao;
import modelo.dao.Impl.ClienteDaoImpl;
import modelo.dao.Impl.ContratoDaoImpl;
import modelo.dao.Impl.OcupacionDaoImpl;
import modelo.dao.Impl.PersonaDaoImpl;
import modelo.dao.Impl.RestaurantDaoImpl;
import modelo.dao.OcupacionDao;
import modelo.dao.PersonaDao;
import modelo.dao.RestaurantDao;
import modelo.entidad.Cliente;
import modelo.entidad.Contrato;
import modelo.entidad.Ocupacion;
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
        //d.InsertCliente();
       // d.insertPrecio();
        //d.buscarcliente();
        d.InsertContrato();
        
    }
    
     public void Insert(){
       RestaurantDao rest = new RestaurantDaoImpl();
         PersonaDao per = new PersonaDaoImpl();
         ContratoDao cntr = new ContratoDaoImpl();
         OcupacionDao ocp = new OcupacionDaoImpl();
         ClienteDao cld = new ClienteDaoImpl();
                 
        Persona p = new Persona();
        
        p.setIdPersona(" ");
        p.setNombres("aaaaaaaaa");
        p.setApPat("aaa");
        p.setApMat("rrrrrrrrrrr");
        p.setDocumento("45353222");
        p.setGenero("F");
        
        if (per.agregarPersona(p)) {
           System.out.println(""+p.getNombres());
            System.out.println("Se agrego el cliente...");
            
        } else {
            System.out.println("No se agrego el cliente");
           System.out.println(""+p.getNombres());
        }
    }
     
     public void Update(){
        RestaurantDao rest = new RestaurantDaoImpl();
         PersonaDao per = new PersonaDaoImpl();
         ContratoDao cntr = new ContratoDaoImpl();
         OcupacionDao ocp = new OcupacionDaoImpl();
         ClienteDao cld = new ClienteDaoImpl();
        Persona p = new Persona();
        
        p.setIdPersona("P-LE938273CARUSTA");
        p.setNombres("Carmen Stefany");
        p.setApPat("Leyva");
        p.setApMat("Bustamante");
        p.setDocumento("72837283");
        p.setGenero("F");
        
        if (per.modificarPersona(p)) {
            System.out.println("Se modifico el cliente...");
            
        } else {
            System.out.println("No se modifico el cliente");
        }
    }
     
     public void InsertCliente(){
        RestaurantDao rest = new RestaurantDaoImpl();
         PersonaDao per = new PersonaDaoImpl();
         ContratoDao cntr = new ContratoDaoImpl();
         OcupacionDao ocp = new OcupacionDaoImpl();
         ClienteDao cld = new ClienteDaoImpl();
        Persona p = new Persona();
         Cliente c = new Cliente();
        
        c.setIdCliente(p.getIdPersona());
        
        if (cld.insertarCliente(c)) {
           System.out.println(""+c.getIdCliente());
            System.out.println("Se agrego el cliente...");
            
        } else {
            System.out.println("No se agrego el cliente");
           System.out.println(""+p.getNombres());

        }
    }
     
     public void insertPrecio()
     {
       RestaurantDao rest = new RestaurantDaoImpl();
         PersonaDao per = new PersonaDaoImpl();
         ContratoDao cntr = new ContratoDaoImpl();
         OcupacionDao ocp = new OcupacionDaoImpl();
         ClienteDao cld = new ClienteDaoImpl();
         Contrato con = new Contrato();
                 
        
        //con.setPrecio(270.00);
        con.setIdCliente("P-BU71JUSA");
        
        if (cntr.crearContrato(con)) {
            System.out.println("Se agregO...");
            
        } else {
            System.out.println("No se agrego");

        }
     
     }
     
   public void buscarcliente()
   {
       ClienteDao cd = new ClienteDaoImpl();
               
       Cliente cl = new Cliente();
       Persona p = new Persona();
       String documento="71269029";
       
       p.setDocumento(documento);
       
      
       if(!documento.equals("")){
        cd.buscarCliente(documento);
        if(cl != null){
           p.getNombres();
           p.getApPat();
           p.getApMat();
           p.getDocumento();
        }
       }
       
       System.out.println("persona:"+p.getNombres()+""+p.getApPat());
               
   }
   
  public void InsertContrato(){
        RestaurantDao rest = new RestaurantDaoImpl();
         PersonaDao per = new PersonaDaoImpl();
         ContratoDao cntr = new ContratoDaoImpl();
         OcupacionDao ocp = new OcupacionDaoImpl();
         ClienteDao cld = new ClienteDaoImpl();
         Persona p = new Persona();
         Cliente c = new Cliente();
         Contrato cn = new Contrato();
         Ocupacion o = new Ocupacion();
        
        cn.setIdCliente("P-JU26902BUSAN");
        cn.setIdOcupacion("OCP-002");
        cn.setFechaIni("04/06/2015");
        cn.setFechaTerm("18/06/2015");
        cn.setPrecio("270.00");
        
        if (cntr.crearContrato(cn)) {
            
           System.out.println(""+c.getIdCliente());
           System.out.println("Se agrego el cliente...");
            
            
        } else {
            System.out.println("No se agrego el cliente");
           System.out.println(""+p.getNombres());

        }
    }
}
