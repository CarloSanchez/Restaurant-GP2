
<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.entidad.Usuario"%>
<%@page import="modelo.entidad.Cliente"%>
<%@page import="modelo.dao.Impl.UsuarioDaoImpl"%>
<%@page import="modelo.dao.UsuarioDao"%>
<%@page import="modelo.dao.Impl.TipoVentaDaoImpl"%>
<%@page import="modelo.dao.TipoVentaDao"%>
<%@page import="modelo.entidad.TipoVenta"%>
<%@page import="modelo.entidad.TipoUsuario"%>
<%@page import="modelo.dao.Impl.ClienteDaoImpl"%>
<%@page import="modelo.dao.ClienteDao"%>
<%@page import="modelo.entidad.Venta"%>
<%@page import="modelo.dao.Impl.VentaDaoImpl"%>
<%@page import="modelo.dao.VentaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>
        <%
            VentaDao dao = new VentaDaoImpl();
            ClienteDao cdao = new ClienteDaoImpl();
            TipoVentaDao tpdao = new TipoVentaDaoImpl();
            UsuarioDao udao = new UsuarioDaoImpl();
            Venta venta = new Venta();
            Persona persona = new Persona();

            String idCliente = request.getParameter("idCliente");
            idCliente = idCliente == null ? "" : idCliente;

            String idTipoventa = request.getParameter("idTipoventa");
            idTipoventa = idTipoventa == null ? "" : idTipoventa;

            String idUsuario = request.getParameter("idUsuario");
            idUsuario = idUsuario == null ? "" : idUsuario;

            String comidaDAC = request.getParameter("comidaDAC");
            comidaDAC = comidaDAC == null ? "" : comidaDAC;

            String opcion = request.getParameter("opcion");
            opcion = opcion == null ? "buscar" : opcion;

            String buscarDni = request.getParameter("buscarDni");
            buscarDni = buscarDni == null ? "" : buscarDni;

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

            String mensaje = "";

            

            if (opcion.equals("buscar")) {
                if (!buscarDni.equals("")) {
                    persona = cdao.buscarPensionista(buscarDni);
                    if (persona != null) {
                        idPersona = persona.getIdPersona();
                        nombres = persona.getNombres();
                        ap_pat = persona.getApPat();
                        ap_mat = persona.getApMat();
                        valor ="Pensionista";
                        out.println(valor);
                    }
                    else{
                        persona = cdao.buscarCliente(buscarDni);
                        if(persona != null)
                        {
                        idPersona = persona.getIdPersona();
                        nombres = persona.getNombres();
                        ap_pat = persona.getApPat();
                        ap_mat = persona.getApMat();
                        valor ="Cliente";
                        out.println(valor);
                        }
                        
                    }
                }
            }
                    if (!idCliente.equals("") & !idUsuario.equals("") & !idTipoventa.equals("") & !comidaDAC.equals("")) {

                        venta.setIdCliente(idCliente);
                        venta.setIdUsuario(idUsuario);
                        venta.setIdTipoventa(idTipoventa);
                        venta.setComidaDAC(comidaDAC);
                        if (dao.realizarVenta(venta)) {
                            response.sendRedirect("Carrito.jsp");
                            out.println("Adentro");
                        } else {

                            mensaje = "No se pudo registrar";
                            //System.out.println("NO registro");
                            response.sendRedirect("RealizarVenta.jsp");

                        }
                    }
                
        %>
        <section>
            <form action="RealizarVenta.jsp" method="POST" aling="center"> 


                <table>
                    <tr>
                        <td>DNI:</td>
                        <td><input type="text" name="buscarDni" placeholder="Ingrese DNI" maxlength="8"></td>
                        <td><input type="submit" value="Buscar"></td>
                    </tr> 
                </table>
                
            </form>
            <form>
                <input type="hidden" name="idCliente" value="<%=idCliente%>" size="20">
                <input type="hidden" name="opcion" value="resgitrar" class="from-horizontal">
                <div class="container">            
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <div class="box">
                                <div class="center gap">
                                    <table>
                                        <tbody>
                                        <form action="RealizarVenta.jsp" method="post">
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
                                                <td>Usuario: </td>
                                                <td>
                                                    <select name="idUsuario">
                                                        <option>Seleccione</option>
                                                        <%
                                                            for (Usuario usuario : udao.listarUsuario()) {

                                                        %>
                                                        <option value="<%=usuario.getIdTipoUsuario()%>"><%=usuario.getLogin()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tipo de Venta: </td>
                                                <td>
                                                    <select name="idTipoventa">
                                                        <option>Seleccione</option>
                                                        <%
                                                            for (TipoVenta tipoventa : tpdao.listarTipoVenta()) {

                                                        %>
                                                        <option value="<%=tipoventa.getIdTipoventa()%>"><%=tipoventa.getNombreVenta()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                            </tr>
                                            <%if(valor.equals("Pensionista")){%><tr>
                                                <td>Turno: </td>
                                                <td>
                                                    <select name="comidaDAC">
                                                        <option>Seleccione</option>
                                                        <option value="D">Desayuno</option>
                                                        <option value="A">Almuerzo</option>
                                                        <option value="C">Cena</option>
                                                    </select>
                                                </td>
                                            </tr><%}%>
                                            <tr>
                                                <td>
                                                    <%=mensaje%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="submit" value="Enviar">
                                                </td>
                                            </tr>
                                        </form>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>                                        
                </div>
            </form>
        </section>
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>