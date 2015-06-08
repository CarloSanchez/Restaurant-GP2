
<%@page import="modelo.entidad.Contrato"%>
<%@page import="modelo.entidad.Cliente"%>
<%@page import="modelo.dao.Impl.ClienteDaoImpl"%>
<%@page import="modelo.dao.ClienteDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.dao.Impl.RestaurantDaoImpl"%>
<%@page import="modelo.dao.RestaurantDao"%>
<%@page import="modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="modelo.dao.PersonaDao"%>
<html>
    <body>
        <table>
            <tr>
                <td>
                    <h3>Clientes</h3> 
                </td>
                
            </tr>
            <tr>
                    <td>Nombres  </td>
                    <td>Apellido Paterno </td>
                    <td>Apellido Materno </td>
                    <td>Documento   </td>
                    <td>Fecha Inicio </td>
                    <td>Fecha Termino </td>
                    
                    
            </tr>
            <%
                
              
          
                
                ClienteDao client = new ClienteDaoImpl();
               int count = 0;
                 
                for (Cliente cliente: client.listarPensionista()) {
                    count++;
              
                    
                     
                   
            %>
            

            <tr>
                <td> <%=count%>.-</td>
                <td><%=cliente.getNombres()%></td>
                <td><%=cliente.getApPat()%></td>
                <td><%=cliente.getApMat()%></td>
                <td><%=cliente.getDocumento()%></td>
                <td><%=cliente.getFechaIni()%></td>
                <td><%=cliente.getFechaTerm()%></td>
                <td><a href="modificarCliente.jsp">Modificar</a></td><td></td>
                <td><a href="eliminarCliente.jsp">Eliminar</a></td>
            </tr>
            <tr></tr>
            <%}%>
        </table>
    
        
    </body>
</html>

<%@include file="WEB-INF/jspf/bottom.jspf"%>
