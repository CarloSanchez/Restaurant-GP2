<%@include file="WEB-INF/jspf/top.jspf"%>
<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.dao.Impl.RestaurantDaoImpl"%>
<%@page import="modelo.dao.RestaurantDao"%>

<html>
    <body>
        <table>
            <tr>
                <td>
                    <h3>Clientes</h3> 
                </td>
                
            </tr>
            <tr>
                    <th>Nombres</th>
                    <th>Apellido Paterno</th>
                    <th>Apellido Materno</th>
                    
                    
            </tr>
            <%
                int count = 0;
                RestaurantDao dao = new RestaurantDaoImpl();
                for (Persona persona : dao.listarpersona()) {
                    count++;


            %>

            <tr>
                <td><%=count%>.-<%=persona.getNombres()%> </td>
                <td><%=persona.getApPat()%></td>
                <td><%=persona.getApMat()%></td><td></td>
                <td><a href="modificarCliente.jsp">Modificar</a></td><td></td>
                <td><a href="eliminarCliente.jsp">Eliminar</a></td>
            </tr>
            <tr></tr>
            <%}%>
        </table>
    
        
    </body>
</html>

<%@include file="WEB-INF/jspf/bottom.jspf"%>
