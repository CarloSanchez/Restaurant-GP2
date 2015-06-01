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
            Persona persona = new Persona();
            Cliente client = new Cliente(); 
            Ocupacion op = new Ocupacion();
            Contrato contrato = new Contrato();
            PersonaCliente pc = new PersonaCliente();
                    
            
            String idPersona = request.getParameter("idPersona");
            idPersona = idPersona == null ? "" : idPersona;
            out.println(idPersona);
            
            String idCliente = request.getParameter("idcliente");
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

            String opcion = request.getParameter("opcion");
            opcion = opcion == null ? "buscar" : opcion;

            String mensaje = "";
            String mensaje2="";
            String mensajeError = "";
            
             if(opcion.equals("buscar")){
            if (!buscarDni.equals("")) {
                persona = per.buscarPersona(buscarDni);
                if (persona != null) {
                    idPersona = persona.getIdPersona();
                    nombres = persona.getNombres();
                    ap_pat = persona.getApPat();
                    ap_mat = persona.getApMat();
                    documento = persona.getDocumento();
                    opcion="registrar";
                } else {
                    mensaje = "La persona no esta registrado <a href='registrarPersona.jsp'> Registrar Aqui</a>";
                }
                }
            }
                if(!opcion.equals("registrar")){
                  client.setIdCliente(idPersona);
                   
                   if(cl.insertarCliente(client)){
                       response.sendRedirect("ContratoCliente.jsp?idCliente="+client.getIdCliente());
                   }
                   }else {
                    mensajeError = "No se pudo registrar el cliente";
                    mensaje2 = "<a href='ContratoCliente.jsp'>Intentar Nuevamente</a>";
                }
                
                
            
        %>
        
        <form action="buscarPersona.jsp" method="POST"> 
            
           
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
        
        <%=idPersona%>
        <form action="buscarPersona.jsp">
            <input type="hidden" name="idPersona" value="<%=idPersona%>" size="20">
            <input type="hidden" name="opcion" value="resgitrar" class="from-horizontal">
            <table> 
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
                
                <%if(mensajeError.equals("")){%>
                <tr>
                    <td colspan="2"><%=mensajeError%></td>
                </tr>
                
                <%}%>
                <tr>
                    <td>
                        <input type="submit" value="Registrar">
                    </td>
                </tr>
            </table>
        </form>
        
        
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>