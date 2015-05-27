<%@page import="modelo.entidad.Cliente"%>
<%@page import="modelo.entidad.TipoCliente"%>
<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.dao.Impl.RestaurantDaoImpl"%>
<%@page import="modelo.dao.RestaurantDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>
        <%
            RestaurantDao rest = new RestaurantDaoImpl();
            Persona persona = new Persona();
            Cliente client = new Cliente();
            
            String idPersona = request.getParameter("idPersona");
            idPersona = idPersona == null ? "" : idPersona;
            
            String idTipoCliente = request.getParameter("tipo");
            idTipoCliente = idTipoCliente == null ? "" : idTipoCliente;

            String nombres = request.getParameter("nombres");
            nombres = nombres == null ? "" : nombres;
            
            String tipoCliente = request.getParameter("tipoCliente");
            tipoCliente = tipoCliente == null ? "" : tipoCliente;

            String ap_pat = request.getParameter("ap_pat");
            ap_pat = ap_pat == null ? "" : ap_pat;

            String ap_mat = request.getParameter("ap_mat");
            ap_mat = ap_mat == null ? "" : ap_mat;

            String buscarDni = request.getParameter("buscarDni");
            buscarDni = buscarDni == null ? "" : buscarDni;

            String documento = request.getParameter("documento");
            documento = documento == null ? "" : documento;

            String opcion = request.getParameter("opcion");
            opcion = opcion == null ? "buscar" : opcion;

            String mensaje = "";
            String mensajeError = "";
            
            if(opcion.equals("buscar")){
            if (!buscarDni.equals("")) {
                persona = rest.buscarPersona(buscarDni);
                if (persona != null) {
                    idPersona = persona.getIdPersona();
                    nombres = persona.getNombres();
                    ap_pat = persona.getApPat();
                    ap_mat = persona.getApMat();
                    documento = persona.getDocumento();
                    opcion="registrar";
                } else {
                    mensaje = "El cliente no esta registrado <a href='registrarPersona.jsp'> Registrar Aqui</a>";
                }
                }
            }
                if(!opcion.equals("registrar")){     
                
                   
                   
                   
                   
                       client.setIdCliente(idPersona);
                       client.setIdTipoCliente(idTipoCliente);
                       client.setTipoCliente(tipoCliente);
                   if(rest.insertarCliente(client)){
                   response.sendRedirect("inicio.jsp");
                   }else {
                    mensajeError = "No se pudo registrar el cliente";
                }
                }
            
        %>
        
        <form action="registrarCliente.jsp">  
            <table>
                <tr>
                    <td>DNI:</td>
                    <td><input type="text" name="buscarDni" placeholder="Ingrese DNI" size="8"></td>
                    <td><input type="submit" value="Buscar"></td>
                </tr> </table>
                <tr>
                    <td colpan="3"><%=mensaje%></td>
                </tr>
            
        </form>
        
        
        <form action="registrarCliente.jsp">
            <input type="hidden" name="idPersona" value="<%=idPersona%>" size="20">
            <input type="hidden" name="idTipoCliente" value="<%=idTipoCliente%>" size="20">

            <table> 
                <tr>
                    <td>Nombres:</td>
                    <td><input type="text" name="nombres" placeholder="Nombres" value="<%=nombres%>" readonly="true"></td>
                </tr> 
                <tr>
                    <td>Apellido Paterno:</td>
                    <td><input type="text" name="apellidos" placeholder="Apellidos" value="<%=ap_pat%>" readonly="true"></td>
                </tr> 
                <tr>
                    <td>Apellido Materno:</td>
                    <td><input type="text" name="apellidos" placeholder="Apellidos" value="<%=ap_mat%>" readonly="true"></td>
                </tr> 
                <tr>
                    <td>Dni:</td>
                    <td><input type="text" name="dni" placeholder="Dni" value="<%=documento%>" readonly="true"></td>
                </tr> 
                <tr>
                    <td>Ocupacion</td>
                    <td>
                        <select name="tipo">
                            <option>Seleccione</option>
                            <%
                                for (TipoCliente tipocliente : rest.listarTipocliente()) {
                            %>
                            <option value="<%=tipocliente.getIdTipoCliente()%>"><%=tipocliente.getNombre()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Pensionista:</td>
                        <td>
                            <select name="tipoCliente">
                                <option value="P">Seleccione</option>
                                <option value="P">Pensionista</option>
                                <option value="NP">No Pensionista</option>
                        </select>
                     </td>
                </tr>
                <tr>
                    <td colspan="2"><%=mensajeError%></td>
                </tr>
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
