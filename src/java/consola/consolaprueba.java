/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consola;

import java.sql.Statement;
import modelo.dao.ClienteDao;
import modelo.dao.ContratoDao;
import modelo.dao.ControlDao;
import modelo.dao.DetalleVentaDao;
import modelo.dao.Impl.ClienteDaoImpl;
import modelo.dao.Impl.ContratoDaoImpl;
import modelo.dao.Impl.ControlDaoImpl;
import modelo.dao.Impl.DetalleVentaDaoImpl;
import modelo.dao.Impl.OcupacionDaoImpl;
import modelo.dao.Impl.PersonaDaoImpl;
import modelo.dao.Impl.RestaurantDaoImpl;
import modelo.dao.Impl.TipoUsuarioDaoImpl;
import modelo.dao.Impl.TipoVentaDaoImpl;
import modelo.dao.Impl.UsuarioDaoImpl;
import modelo.dao.Impl.VentaDaoImpl;
import modelo.dao.OcupacionDao;
import modelo.dao.PersonaDao;
import modelo.dao.RestaurantDao;
import modelo.dao.TipoUsuarioDao;
import modelo.dao.TipoVentaDao;
import modelo.dao.UsuarioDao;
import modelo.dao.VentaDao;
import modelo.entidad.Cliente;
import modelo.entidad.Contrato;
import modelo.entidad.Control;
import modelo.entidad.DetalleVenta;
import modelo.entidad.Ocupacion;
import modelo.entidad.Persona;
import modelo.entidad.TipoUsuario;
import modelo.entidad.TipoVenta;
import modelo.entidad.Usuario;
import modelo.entidad.Venta;

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
        //d.insertPrecio();
        //d.buscarcliente();
        //d.InsertContrato();
        //d.listartipousuario();
        //d.listarventa();
        //d.listarUsuario();
        //d.realizarventa();
        //d.DetalleVenta();
//        d.detalleConsumo();
        d.listarVentas();

    }

    public void Insert() {
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
            System.out.println("" + p.getNombres());
            System.out.println("Se agrego el cliente...");

        } else {
            System.out.println("No se agrego el cliente");
            System.out.println("" + p.getNombres());
        }
    }

    public void Update() {
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

    public void InsertCliente() {
        RestaurantDao rest = new RestaurantDaoImpl();
        PersonaDao per = new PersonaDaoImpl();
        ContratoDao cntr = new ContratoDaoImpl();
        OcupacionDao ocp = new OcupacionDaoImpl();
        ClienteDao cld = new ClienteDaoImpl();
        Persona p = new Persona();
        Cliente c = new Cliente();

        c.setIdCliente(p.getIdPersona());

        if (cld.insertarCliente(c)) {
            System.out.println("" + c.getIdCliente());
            System.out.println("Se agrego el cliente...");

        } else {
            System.out.println("No se agrego el cliente");
            System.out.println("" + p.getNombres());

        }
    }

    public void insertPrecio() {
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

    public void buscarcliente() {
        ClienteDao cd = new ClienteDaoImpl();

        Cliente cl = new Cliente();
        Persona p = new Persona();
        String documento = "71269029";

        p.setDocumento(documento);

        if (!documento.equals("")) {
            cd.buscarCliente(documento);
            if (cl != null) {
                p.getNombres();
                p.getApPat();
                p.getApMat();
                p.getDocumento();
            }
        }

        System.out.println("persona:" + p.getNombres() + "" + p.getApPat());

    }

    public void InsertContrato() {
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

            System.out.println("" + c.getIdCliente());
            System.out.println("Se agrego el cliente...");

        } else {
            System.out.println("No se agrego el cliente");
            System.out.println("" + p.getNombres());

        }
    }

    public void listartipousuario() {
        TipoUsuarioDao tipo = new TipoUsuarioDaoImpl();
        for (TipoUsuario p : tipo.listarTipoUsuario()) {
            System.out.println("id: " + p.getIdTipoUsuario() + "\n nombre: " + p.getNombreUsuario());
        }
    }

    public void listarventa() {
        TipoVentaDao tventa = new TipoVentaDaoImpl();
        for (TipoVenta tv : tventa.listarTipoVenta()) {
            System.out.println("id: " + tv.getIdTipoventa() + "\n nombre: " + tv.getNombreVenta());
        }
    }

    /* public void listarUsuario() {
     UsuarioDao udao = new UsuarioDaoImpl();
     for (Usuario u : udao.validarDatos(null, null)) {
     System.out.println("id: " + u.getLogin());
     }
     }*/
    public void realizarventa() {
        VentaDao vdao = new VentaDaoImpl();
        Venta venta = new Venta();
        String opcion = "b";
        String idVenta = "";

        venta.setIdCliente("P-PE63762GOREN");
        venta.setIdUsuario("P-MA71673PAREN");
        venta.setIdTipoventa("TVE-001");
        venta.setComidaDAC("-");
        venta.getIdVenta();

        if (vdao.realizarVenta(venta)) {

            System.out.println("Se realizo la venta...");
            if (idVenta.equals("")) {
                idVenta = venta.getIdVenta();
                System.out.println("id" + idVenta);
            }
        } else {
            System.out.println("No se pudo realizar la venta");
            System.out.println("" + venta.getIdCliente());

        }

    }

    public void DetalleVenta() {
        DetalleVentaDao detv = new DetalleVentaDaoImpl();
        DetalleVenta dv = new DetalleVenta();
        Venta venta = new Venta();
        String idCliente = "P-IS34567BUSAN";
        String idPlato = "PLAT-0002";
        String cantidad = "1";
        String idVenta = "";
        venta = detv.obtenerIdVenta(idCliente);
        idVenta = venta.getIdVenta();
        dv.setIdVenta(idVenta);
        dv.setIdPlato(idPlato);
        dv.setPrecio("4");
        dv.setCantidad(cantidad);

        if (detv.insertDetalleVenta(dv)) {
            detv.ejecutarActStock(idPlato, cantidad);

            System.out.println("Se realizo la venta");
        } else {
            System.out.println("No se pudo realizar la venta");
        }

        for (DetalleVenta ddv : detv.listarDetalle(idVenta)) {
            System.out.println("plato:" + ddv.getNombre());
        }

    }
    
    public void detalleConsumo()
    {
        
        ControlDao dao = new ControlDaoImpl();
        String idCliente = "P-IS34567BUSAN";
        String fecha = "18/06/2015";
        for (Control control : dao.listarDetalleConsumo(idCliente, fecha)) {
            System.out.println(" "+control.getPlato());
        }
        
    }
    
    public void listarVentas()
    {
    ControlDao ct = new ControlDaoImpl();
        
        String fecha1 = "06/06/2015";
        String fecha2 = "30/06/2015";
        
        for(DetalleVenta dv : ct.listarVentas(fecha1, fecha2)){
            System.out.println("nombre: "+ dv.getNombre()+" "+dv.getCantidad());
        }
    
    }
}
