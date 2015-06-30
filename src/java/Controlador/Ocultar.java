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

/**
 *
 * @author ADMIN
 */
public class Ocultar extends HttpServlet {

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

        String option = request.getParameter("option");
        option = option == null ? "" : option;

        switch (option) {

            case "contratar":
                request.getRequestDispatcher("ContratoCliente.jsp").forward(request, response);
                break;
            case "inicio":
                request.getRequestDispatcher("inicio.jsp").forward(request, response);
            case "bcliente":
                request.getRequestDispatcher("buscarPersona.jsp").forward(request, response);
                break;
            case "agregarper":
                request.getRequestDispatcher("registrarPersona.jsp").forward(request, response);
                break;
            case "plato":
                request.getRequestDispatcher("Platos.jsp").forward(request, response);
                break;
            case "platos":
                request.getRequestDispatcher("RegistrarPlato.jsp").forward(request, response);
                break;
            case "venta":
                request.getRequestDispatcher("RealizarVenta.jsp").forward(request, response);
            case "reporte":
                request.getRequestDispatcher("Reportes.jsp").forward(request, response);
                break;
            case "reportes":
                request.getRequestDispatcher("ConsumoPensionista.jsp").forward(request, response);
                break;
            case "vende":
                request.getRequestDispatcher("RealizarVenta.jsp").forward(request, response);
                break;
            case "pensionista":
                request.getRequestDispatcher("listarPensionistas.jsp").forward(request, response);
                break;
            case "cliente":
                request.getRequestDispatcher("listarClientes.jsp").forward(request, response);
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
