
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
            <div class="container">   
                 <div class="row">          
                    <div class="jumbotron">
                       <h3 aling="center"> RENOVAR CONTRATO</h3> 
                         <div class="container">            
                            <div class="panel panel-info">
                                <div class="panel-body">
                                    <div class="box">
                                        <div class="center gap"> 
           
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <form action="acciones" method="POST" aling="center"> 
                                    <input type="hidden" name="option" value="buscar">
                                    <table>
                                        <tr>
                                            <td>DNI:</td>
                                            <td><input type="text" name="buscarDni" placeholder="Ingrese DNI" maxlength="8"></td>
                                            <td><input type="submit" value="Buscar" class=" btn-primary "></td>
                                        </tr> 

                                        <tr>
                                            <td colpan="3"><%=mensaje%></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div>

                    <div class="container" >
                        <div class="row" >
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <form action="ContratoCliente.jsp" aling="center">
                                    <input type="hidden" name="idPersona" value="<%=idPersona%>" size="20">
                                    <input type="hidden" name="opcion" value="resgitrar" class="from-horizontal">
                                    <table class="" aling="center"> 
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
                                            <td><input type="text" name="precio" placeholder="0,00" value=""></td>
                                        </tr> 
                                        <tr>
                                            <td>Inicio:</td>
                                            <td><input type="date" name="fechaini" value=""></td>
                                        </tr>
                                        <tr>
                                            <td>Termino</td>
                                            <td><input type="date" name="fechaterm" value=""></td>
                                        </tr>
                                        <%if (mensajeError.equals("")) {%>
                                        <tr>
                                            <td colspan="2"><%=mensajeError%></td>
                                        </tr>

                                        <%}%>
                                        <tr>
                                            <td>
                                                <input type="submit" value="Guardar" class=" btn-primary ">
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                    </div>   
                </div>
            </div>
        </div>
            </div>
                </div>
                     </div>
                                        
  >
<%@include file="WEB-INF/jspf/bottom.jspf"%>
