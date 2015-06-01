<%@page import="modelo.dao.Impl.OcupacionDaoImpl"%>
<%@page import="modelo.dao.OcupacionDao"%>
<%@page import="modelo.dao.Impl.ContratoDaoImpl"%>
<%@page import="modelo.dao.ContratoDao"%>
<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.entidad.Contrato"%>
<%@page import="modelo.dao.Impl.RestaurantDaoImpl"%>
<%@page import="modelo.dao.RestaurantDao"%>
<%@page import="modelo.entidad.Ocupacion"%>
<%@page import="modelo.entidad.Cliente"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>
        <%
            RestaurantDao rest = new RestaurantDaoImpl();
            ContratoDao codao = new ContratoDaoImpl();
            OcupacionDao ocp = new OcupacionDaoImpl();
            Cliente c = new Cliente();
            Ocupacion o = new Ocupacion();
            Contrato contrato = new Contrato();
            Persona persona = new Persona();
                    
            
            String idCliente = request.getParameter("idCliente");
            idCliente = idCliente == null ? "" : idCliente;
            
            out.println(idCliente);
            
            String cliente = request.getParameter("cliente");
            cliente = cliente == null ? "" : cliente;
            
            String idOcupacion = request.getParameter("idOcupacion");
            idOcupacion = idOcupacion == null ? "" : idOcupacion;
            
            String precio = request.getParameter("precio");
            precio = precio == null ? "" : precio;
            
            
            
            String mensaje = "";
            String opcion= request.getParameter("opcion");
            opcion = opcion == null ? "contratar" : opcion;
            
            if(!idOcupacion.equals(null))
            {
                o.setIdOcupacion(idOcupacion);
                contrato.setPrecio(precio);
                codao.ejecutar1(idCliente, idOcupacion, precio);
                //rest.crearContrato(contrato);
               
               
            }
            
                    
        %>
        
        <form action="contratar.jsp">
            <input type="hidden" name="idCliente" value="<%=idCliente%>" size="20">
            <table> 
                <tr>
                    <td>Ocupacion</td>
                    <td>
                        <select name="idOcupacion">
                            <option>Seleccione</option>
                            <%
                            for (Ocupacion ocupa : ocp.listarOcupacion()){
                                
                            %>
                            <option value="<%=ocupa.getIdOcupacion()%>"><%=ocupa.getNombre()%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="text" name="precio" placeholder="precio"></td>
                </tr>
                
                <tr>
                    <td>
                        <input type="submit" value="Finalizar Contrato">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>