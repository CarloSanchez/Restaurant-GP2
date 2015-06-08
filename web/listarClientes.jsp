
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
        
  <div class="container">   
 <div class="row">          
 <div class="jumbotron">
        <table class="table" aling="canter">
            <tr>
               
                    <h1>PENSIONISTAS</h1> 
               
                
            </tr>
            <tr>    <td>       
                    <td>Nombres  </td>
                    <td>Apellido Paterno  </td>
                    <td>Apellido Materno </td>
                    <td>Documento   </td>
                    <td>Fecha Inicio </td>
                    <td>Fecha Termino </td>
                                    </td>
                    
                    
            
            <%
                
              
          
                
                ClienteDao client = new ClienteDaoImpl();
               int count = 0;
                 
                for (Cliente cliente: client.listarPensionista()) {
                    count++;
              
                    
                     
                   
            %>
            
            </tr>
            <tr>
           
                
                <td> <%=count%>.-</td>
                <td><%=cliente.getNombres()%></td>
                <td><%=cliente.getApPat()%></td>
                <td><%=cliente.getApMat()%></td>
                <td><%=cliente.getDocumento()%></td>
                <td><%=cliente.getFechaIni()%></td>
                <td><%=cliente.getFechaTerm()%></td>
                 </div>
                 
                <td><a href="modificarCliente.jsp">Modificar</a></td><td></td>
                <td><a href="eliminarCliente.jsp">Eliminar</a></td>  
                
            
                
                
            </tr>
            <tr>
            </tr>     
            
            <%}%>
        </table>
    
 </div>
 </div>
  </div>
    </body>
</html>

<%@include file="WEB-INF/jspf/bottom.jspf"%>
