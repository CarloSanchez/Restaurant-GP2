

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="modelo.dao.Impl.ContratoDaoImpl"%>
<%@page import="modelo.dao.ContratoDao"%>
<%@page import="modelo.entidad.PersonaCliente"%>
<%@page import="modelo.dao.Impl.OcupacionDaoImpl"%>
<%@page import="modelo.dao.OcupacionDao"%>
<%@page import="modelo.dao.Impl.ClienteDaoImpl"%>
<%@page import="modelo.dao.ClienteDao"%>
<%@page import="modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="modelo.dao.PersonaDao"%>
<%@page import="modelo.entidad.Contrato"%>
<%@page import="modelo.entidad.Ocupacion"%>
<%@page import="modelo.entidad.Cliente"%>
<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.dao.Impl.RestaurantDaoImpl"%>
<%@page import="modelo.dao.RestaurantDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>

        <%
            RestaurantDao rest = new RestaurantDaoImpl();
            PersonaDao per = new PersonaDaoImpl();
            ClienteDao cl = new ClienteDaoImpl();
            OcupacionDao ocp = new OcupacionDaoImpl();
            ContratoDao cd = new ContratoDaoImpl();
            Persona persona = new Persona();
            Cliente client = new Cliente();
            Ocupacion op = new Ocupacion();
            Contrato con = new Contrato();
            PersonaCliente pc = new PersonaCliente();

            String idPersona = request.getParameter("idPersona");
            idPersona = idPersona == null ? "" : idPersona;
            

            String idCliente = request.getParameter("idPersona");
            idCliente = idCliente == null ? "" : idCliente;
            out.println("idCliente");

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

            String precio = request.getParameter("precio");
            precio = precio == null ? "" : precio;

            String fechas = request.getParameter("fechas");
            fechas = fechas == null ? "" : fechas;

            String fechaIni = request.getParameter("fechaini");
            fechaIni = fechaIni == null ? "" : fechaIni;

            String fechaTerm = request.getParameter("fechaterm");
            fechaTerm = fechaTerm == null ? "" : fechaTerm;

            String opcion = request.getParameter("opcion");
            opcion = opcion == null ? "buscar" : opcion;

            String mensaje = "";
            String mensaje2 = "";
            String mensajeError = "";

            if (opcion.equals("buscar")) {
                if (!buscarDni.equals("")) {
                    persona = cl.buscarCliente(buscarDni);
                    if (persona != null) {
                        idPersona = persona.getIdPersona();
                        nombres = persona.getNombres();
                        ap_pat = persona.getApPat();
                        ap_mat = persona.getApMat();
                        documento = persona.getDocumento();
                        
                        opcion = "registrar";
                    } else {
                        mensaje = "El cliente no esta registrado <a href='buscarPersona.jsp'> Registrar Aqui</a>";
                    }
                }
            }
            
            if (!opcion.equals("registrar")) {
                con.setIdCliente(idPersona);
                con.setIdOcupacion(idOcupacion);
                con.setFecha(fechas);
                con.setFechaIni(fechaIni);
                con.setFechaTerm(fechaTerm);
                con.setPrecio(precio);
                
                if (cd.crearContrato(con)) {
                    response.sendRedirect("inicio.jsp");

                } else {
                    mensajeError = "No se pudo registrar el cliente";
                    mensaje2 = "<a href='ContratoCliente.jsp'>Intentar Nuevamente</a>";
                }

            }

        %>
        
        
            <form action="ContratoCliente.jsp" method="POST" aling="center"> 


                <table>
                    <tr>
                        <td>DNI:</td>
                        <td><input type="text" name="buscarDni" placeholder="Ingrese DNI" maxlength="8"></td>
                        <td><input type="submit" value="Buscar"></td>
                    </tr> </table>
                <tr>
                    <td colpan="3"><%=mensaje%></td>
                </tr>

            </form>


            <form action="ContratoCliente.jsp" aling="center">
                <input type="hidden" name="idPersona" value="<%=idPersona%>" size="20">
                <input type="hidden" name="opcion" value="resgitrar" class="from-horizontal">
                <table aling=""> 
                    <tr>
                        <td>Nombres:</td>
                        <td><input type="text" name="nombres" placeholder="Nombres" value="<%=nombres%>" readonly="true"></td>
                    </tr> 
                    <tr>
                        <td>Apellido Paterno:</td>
                        <td><input type="text" name="ap_pat" placeholder="Apellidos" value="<%=ap_pat%>" readonly="true"></td>
                    </tr> 
                    <tr>
                        <td>Apellido Materno:</td>
                        <td><input type="text" name="ap_mat" placeholder="Apellidos" value="<%=ap_mat%>" readonly="true"></td>
                    </tr> 
                    <tr>
                        <td>Dni:</td>
                        <td><input type="text" name="documento" placeholder="Dni" value="<%=documento%>" readonly="true"></td>
                    </tr> 
                    <tr>
                        <td>Ocupacion</td>
                        <td>
                            <select name="idOcupacion">
                                <option>Seleccione</option>
                                <%
                                    for (Ocupacion ocupa : ocp.listarOcupacion()) {

                                %>
                                <option value="<%=ocupa.getIdOcupacion()%>"><%=ocupa.getNombre()%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Precio:</td>
                        <td><input type="text" name="precio" placeholder="Precio" value=""></td>
                    </tr> 
                    <tr>
                        <td>Inicio:</td>
                        <td><input type="text" name="fechaini" placeholder="DD/MM/YY" value=""></td>
                    </tr>
                    <tr>
                        <td>Termino</td>
                        <td><input type="text" name="fechaterm" placeholder="DD/MM/YY" value=""></td>
                    </tr>
                    <%if (mensajeError.equals("")) {%>
                    <tr>
                        <td colspan="2"><%=mensajeError%></td>
                    </tr>

                    <%}%>
                    <tr>
                        <td>
                            <input type="submit" value="Guardar">
                        </td>
                    </tr>
                </table>
            </form>

        
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
