/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.ClienteDao;
import modelo.dao.ControlDao;
import modelo.dao.DetalleVentaDao;
import modelo.dao.Impl.ClienteDaoImpl;
import modelo.dao.Impl.ControlDaoImpl;
import modelo.dao.Impl.DetalleVentaDaoImpl;
import modelo.dao.Impl.PersonaDaoImpl;
import modelo.dao.Impl.TipoVentaDaoImpl;
import modelo.dao.Impl.UsuarioDaoImpl;
import modelo.dao.Impl.VentaDaoImpl;
import modelo.dao.PersonaDao;
import modelo.dao.TipoVentaDao;
import modelo.dao.UsuarioDao;
import modelo.dao.VentaDao;
import modelo.entidad.Cliente;
import modelo.entidad.DetalleVenta;
import modelo.entidad.Persona;
import modelo.entidad.Venta;

/**
 *
 * @author ADMIN
 */
public class ControlVenta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        VentaDao vdao = new VentaDaoImpl();
        ClienteDao cdao = new ClienteDaoImpl();
        TipoVentaDao tpdao = new TipoVentaDaoImpl();
        UsuarioDao udao = new UsuarioDaoImpl();
        PersonaDao pdao = new PersonaDaoImpl();
        ControlDao ctdao = new ControlDaoImpl();
        DetalleVentaDao ddao = new DetalleVentaDaoImpl();
        DetalleVenta dv = null;
        Venta venta = null;
        Persona persona = new Persona();
        Cliente cliente = new Cliente();

        String option = request.getParameter("option");
        option = option == null ? "" : option;

        String idCliente = request.getParameter("idCliente");
        idCliente = idCliente == null ? "" : idCliente;
        //out.println(idCliente);

        String idTipoventa = request.getParameter("idTipoventa");
        idTipoventa = idTipoventa == null ? "" : idTipoventa;
        //out.println(idTipoventa);

        String idUsuario = request.getParameter("idUsuario");
        idUsuario = idUsuario == null ? "" : idUsuario;
        //out.println(idUsuario);

        String comidaDAC = request.getParameter("comidaDAC");
        comidaDAC = comidaDAC == null ? "" : comidaDAC;
        //out.println(comidaDAC);

        String idVenta = request.getParameter("idVenta");
        idVenta = idVenta == null ? "" : idVenta;
        //out.println(idVenta);

        String fecha = request.getParameter("fecha");
        fecha = fecha == null ? "" : fecha;

        String opcion = request.getParameter("opcion");
        opcion = opcion == null ? "buscar" : opcion;

        String buscarDni = request.getParameter("buscarDni");
        buscarDni = buscarDni == null ? "" : buscarDni;
        //out.println(buscarDni);

        String idPersona = request.getParameter("idPersona");
        idPersona = idPersona == null ? "" : idPersona;

        String nombres = request.getParameter("nombres");
        nombres = nombres == null ? "" : nombres;

        String ap_pat = request.getParameter("ap_pat");
        ap_pat = ap_pat == null ? "" : ap_pat;

        String ap_mat = request.getParameter("ap_mat");
        ap_mat = ap_mat == null ? "" : ap_mat;

        String valor = request.getParameter("valor");
        valor = valor == null ? "" : valor;

        String idPlato = request.getParameter("idPlato");
        idPlato = idPlato == null ? "" : idPlato;

        String precio = request.getParameter("precio");
        precio = precio == null ? "" : precio;

        String cantidad = request.getParameter("cantidad");
        cantidad = cantidad == null ? "" : cantidad;

        String mensaje = "";
        String mensaje2 = "";

        switch (option) {
            case "buscarp":
                if (opcion.equals("buscar")) {
                    if (!buscarDni.equals("")) {
                        persona = cdao.buscarPensionista(buscarDni);
                        if (persona != null) {
                            idPersona = persona.getIdPersona();
                            nombres = persona.getNombres();
                            ap_pat = persona.getApPat();
                            ap_mat = persona.getApMat();
                            valor = "Pensionista";
                            idCliente = idPersona;
                            opcion = "vender";
                        } else {
                            persona = cdao.buscarCliente(buscarDni);
                            if (persona != null) {
                                idPersona = persona.getIdPersona();
                                nombres = persona.getNombres();
                                ap_pat = persona.getApPat();
                                ap_mat = persona.getApMat();
                                valor = "Cliente";
                                idCliente = idPersona;
                                opcion = "vender";
                            } else {

                                mensaje = "No esta registrado <a href='ocultar?option=agregarper'>Registrar Aqui</a>";
                            }

                        }
                    }
                }
                request.setAttribute("idCliente", idCliente);
                request.setAttribute("nombres", nombres);
                request.setAttribute("ap_pat", ap_pat);
                request.setAttribute("ap_mat", ap_mat);
                request.setAttribute("valor", valor);
                request.setAttribute("opcion", opcion);
                request.setAttribute("mensaje", mensaje);
                request.getRequestDispatcher("RealizarVenta.jsp").forward(request, response);
                break;
            case "ventaa":
                venta = new Venta();
                

                    venta.setIdCliente(idCliente);
                    venta.setIdTipoventa(idTipoventa);
                    venta.setIdUsuario(idUsuario);
                    venta.setComidaDAC(comidaDAC);
                    if (vdao.realizarVenta(venta)) {
                        ctdao.ejecutarControl(idCliente);
                        request.setAttribute("idCliente", idCliente);
                        
                    } else {
                        mensaje2 = "No se pudo registrar el cliente";
                        request.setAttribute("mensaje2", mensaje2);
                        
                    }request.getRequestDispatcher("Carrito.jsp?idCliente="+idCliente+"").forward(request, response);
            default:
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
