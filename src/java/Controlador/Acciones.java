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
import modelo.dao.CategoriaDao;
import modelo.dao.ClienteDao;
import modelo.dao.ContratoDao;
import modelo.dao.DetalleVentaDao;
import modelo.dao.Impl.CategoriaDaoImpl;
import modelo.dao.Impl.ClienteDaoImpl;
import modelo.dao.Impl.ContratoDaoImpl;
import modelo.dao.Impl.DetalleVentaDaoImpl;
import modelo.dao.Impl.OcupacionDaoImpl;
import modelo.dao.Impl.PersonaDaoImpl;
import modelo.dao.Impl.PlatoDaoImpl;
import modelo.dao.OcupacionDao;
import modelo.dao.PersonaDao;
import modelo.dao.PlatoDao;
import modelo.entidad.Cliente;
import modelo.entidad.Contrato;
import modelo.entidad.Ocupacion;
import modelo.entidad.Persona;
import modelo.entidad.Plato;

/**
 *
 * @author ADMIN
 */
public class Acciones extends HttpServlet {

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

        PersonaDao pdao = new PersonaDaoImpl();
        ClienteDao client = new ClienteDaoImpl();
        ContratoDao cont = new ContratoDaoImpl();
        OcupacionDao ocupadao = new OcupacionDaoImpl();
        PlatoDao pldao = new PlatoDaoImpl();
        CategoriaDao cdao = new CategoriaDaoImpl();
        DetalleVentaDao dtdao = new DetalleVentaDaoImpl();
        Plato plato = new Plato();
        Ocupacion ocup = new Ocupacion();
        Persona persona = null;
        Contrato contrato = null;
        Cliente cliente = null;

        String option = request.getParameter("option");
        option = option == null ? "" : option;

        String idPersona = request.getParameter("idPersona");
        idPersona = idPersona == null ? "" : idPersona;

        String idCliente = request.getParameter("idCliente");
        idCliente = idCliente == null ? "" : idCliente;

        String nombres = request.getParameter("nombres");
        nombres = nombres == null ? "" : nombres;

        String idOcupacion = request.getParameter("idOcupacion");
        idOcupacion = idOcupacion == null ? "" : idOcupacion;

        String ap_pat = request.getParameter("ap_pat");
        ap_pat = ap_pat == null ? "" : ap_pat;

        String ap_mat = request.getParameter("ap_mat");
        ap_mat = ap_mat == null ? "" : ap_mat;

        String buscarDni = request.getParameter("buscarDni");
        buscarDni = buscarDni == null ? "" : buscarDni;

        String documento = request.getParameter("documento");
        documento = documento == null ? "" : documento;
        
        String genero = request.getParameter("genero");
        genero = genero == null ? "" : genero;

        String precio = request.getParameter("precio");
        precio = precio == null ? "" : precio;

        String fechaIni = request.getParameter("fechaini");
        fechaIni = fechaIni == null ? "" : fechaIni;

        String fechaTerm = request.getParameter("fechaterm");
        fechaTerm = fechaTerm == null ? "" : fechaTerm;

        String opcion = request.getParameter("opcion");
        opcion = opcion == null ? "" : opcion;

        String nombre = request.getParameter("nombre");
        nombre = nombre == null ? "" : nombre;

        String idCategoria = request.getParameter("idCategoria");
        idCategoria = idCategoria == null ? "" : idCategoria;

        String precioNormal = request.getParameter("precioNormal");
        precioNormal = precioNormal == null ? "" : precioNormal;

        String precioPensionista = request.getParameter("precioPensionista");
        precioPensionista = precioPensionista == null ? "" : precioPensionista;
        
        String idVenta = request.getParameter("idVenta");
        idVenta = idVenta == null ? "" : idVenta;
        
        String idPlato = request.getParameter("idPlato");
        idPlato = idPlato == null ? "" : idPlato;

        String mensaje = "";
        String mensaje2 = "";
        String mensajeError = "";

        switch (option) {
            case "busca":
                persona = new Persona();
                if (opcion.equals("buscar")) {
                    if (!buscarDni.equals("")) {
                        persona = client.buscarCliente(buscarDni);
                        if (persona != null) {
                            idPersona = persona.getIdPersona();
                            nombres = persona.getNombres();
                            ap_pat = persona.getApPat();
                            ap_mat = persona.getApMat();
                            documento = persona.getDocumento();
                            opcion = "registrar";
                        } else {
                            mensaje = "El cliente no esta registrado <a href='ocultar?option=bcliente'> Registrar Aqui</a>";
                        }
                    }
                }
                request.setAttribute("idPersona", idPersona);
                request.setAttribute("mensaje", mensaje);
                request.setAttribute("nombres", nombres);
                request.setAttribute("ap_pat", ap_pat);
                request.setAttribute("ap_mat", ap_mat);
                request.setAttribute("documento", documento);
                request.setAttribute("opcion", opcion);
                request.getRequestDispatcher("ContratoCliente.jsp").forward(request, response);
                request.setAttribute("ocupaciones", ocupadao.listarOcupacion());
                break;
            case "contratos":
                contrato = new Contrato();
                if (opcion.equals("registrar")) {
                    contrato.setIdCliente(idCliente);
                    contrato.setIdOcupacion(idOcupacion);
                    contrato.setFechaIni(fechaIni);
                    contrato.setFechaTerm(fechaTerm);
                    contrato.setPrecio(precio);

                    if (cont.crearContrato(contrato)) {
                        request.getRequestDispatcher("ocultar?option=ini").forward(request, response);

                    } else {
                        mensaje2 = "<a href='ContratoCliente.jsp'>Intentar Nuevamente</a>";
                        request.getRequestDispatcher("ContratoCliente.jsp").forward(request, response);
                        request.setAttribute("mensaje2", mensaje2);

                    }
                }
                break;
            case "buscacli":
                persona = new Persona();
                if (opcion.equals("buscar")) {
                    if (!buscarDni.equals("")) {
                        persona = pdao.buscarPersona(buscarDni);
                        if (persona != null) {
                            idPersona = persona.getIdPersona();
                            nombres = persona.getNombres();
                            ap_pat = persona.getApPat();
                            ap_mat = persona.getApMat();
                            documento = persona.getDocumento();
                            opcion = "registrar";
                        } else {
                            mensaje = "La persona no esta registrado <a href='ocultar?option=agregarper'> Registrar Aqui</a>";
                        }
                    }
                }
                request.setAttribute("idPersona", idPersona);
                request.setAttribute("mensaje", mensaje);
                request.setAttribute("nombres", nombres);
                request.setAttribute("ap_pat", ap_pat);
                request.setAttribute("ap_mat", ap_mat);
                request.setAttribute("documento", documento);
                request.setAttribute("opcion", opcion);
                request.getRequestDispatcher("buscarPersona.jsp").forward(request, response);
                break;
            case "regcliente":
                cliente = new Cliente();
                if (!opcion.equals("registra")) {
                    cliente.setIdCliente(idCliente);

                    if (client.insertarCliente(cliente)) {
                        request.getRequestDispatcher("ocultar?option=contratar").forward(request, response);
                    }
                } else {

                    mensaje2 = "<a href='buscarPersona.jsp'>Intentar Nuevamente</a>";
                }
                request.setAttribute("idPersona", idPersona);
                request.setAttribute("mensaje", mensaje);
                request.setAttribute("nombres", nombres);
                request.setAttribute("ap_pat", ap_pat);
                request.setAttribute("ap_mat", ap_mat);
                request.setAttribute("documento", documento);
                break;
            case "agregarp":
                persona = new Persona();
                if (!nombres.equals("") & !ap_pat.equals("") & !ap_mat.equals("") & !documento.equals("") & !genero.equals("")) {

                    persona.setNombres(nombres);
                    persona.setApPat(ap_pat);
                    persona.setApMat(ap_mat);
                    persona.setDocumento(documento);
                    persona.setGenero(genero);

                    if (pdao.agregarPersona(persona)) {
                        request.getRequestDispatcher("ocultar?option=bcliente").forward(request, response);

                    } else {
                        mensaje = "No se pudo registrar";
                        //System.out.println("NO registro");
                        request.getRequestDispatcher("registraPersona.jsp").forward(request, response);

                    }
                }
                break;
            case "platos":
                if (!idCategoria.equals("") & !nombre.equals("") & !precioNormal.equals("") & !precioPensionista.equals("")) {

                    plato.setIdCategoria(idCategoria);
                    plato.setNombre(nombre);
                    plato.setPrecioNormal(precioNormal);
                    plato.setPrecioPensionista(precioPensionista);

                    if (pldao.insertarPlato(plato)) {
                        mensaje = "Plato agregado Correctamente";

                    } else {
                        mensaje = "No se pudo registrar";
                    }
                }
                request.getRequestDispatcher("Platos.jsp").forward(request, response);
                break;
            case "eliminar":
                dtdao.eliminarDetalleVenta(idVenta, idPlato);
                request.getRequestDispatcher("Carrito.jsp?idVenta="+idVenta+"").forward(request, response);
                break;
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
