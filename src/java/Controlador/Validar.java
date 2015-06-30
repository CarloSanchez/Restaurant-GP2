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
import javax.servlet.http.HttpSession;
import modelo.dao.Impl.UsuarioDaoImpl;
import modelo.dao.UsuarioDao;
import modelo.entidad.Persona;
import modelo.entidad.Usuario;

/**
 *
 * @author ADMIN
 */
public class Validar extends HttpServlet {

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
        
        String login  = request.getParameter("login");
        login = login == null? "" : login;
        
        String password  = request.getParameter("password");
        password = password == null? "" : password;
        
        String mensaje = "";
        
        UsuarioDao dao = new UsuarioDaoImpl();
        Usuario usuarioo = new Usuario();
        String id = "";
        
        if (dao.validarDatos(login, password)!=null) {
            
            HttpSession session = request.getSession();//ya puedo trabajar con sesiones
            session.setAttribute("usuario", dao.validarDatos(login, password));//aqui envio y mantengo la session
            //con esto he puedo el id_ en session
            
            id = dao.validarDatos(login, password);
            
            request.setAttribute("usuarios", dao.mostrarUsuario(id));// seteo un atributo de tipo usuario: bean
            request.setAttribute("login", login);// el nombre de la caja de texto y la variable,
            //seteo de atributos desde un formulario
            
            request.setAttribute("dato", mensaje);// seteo de atributos de una variable cualquiera no recibida de un formulario
            
            request.getRequestDispatcher("inicio.jsp").forward(request, response);
            
        }else{
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
