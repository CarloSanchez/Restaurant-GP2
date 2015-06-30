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
    <body><jsp:useBean id="mensaje" scope="request" class="java.lang.String" />
        <jsp:useBean id="idPersona" scope="request" class="java.lang.String" />
        <jsp:useBean id="nombres" scope="request" class="java.lang.String" />
        <jsp:useBean id="ap_pat" scope="request" class="java.lang.String" />
        <jsp:useBean id="ap_mat" scope="request" class="java.lang.String" />
        <jsp:useBean id="documento" scope="request" class="java.lang.String" />
        <jsp:useBean id="mensaje2" scope="request" class="java.lang.String" />
        
         <section>
                 <br>
                 <br>
                 <br>
                 <br>
                 <br>
            <div class="container">               
            <div class="fondo">
            <div class="row">          
            <div class="col-md-6">
            <div class="jumbotron">
            <div class="container">
       
        <form action="acciones" method="POST"> 
            <input type="hidden" name="option" value="buscacli">
            <input type="hidden" name="opcion" value="buscar">
            <table>
                <tr>
                    <td>DNI:</td>
                    <td><input type="text" name="buscarDni" placeholder="Ingrese DNI" maxlength="8"></td>
                    <td><input type="submit" value="Buscar"></td>
                </tr> </table>
                <tr>
                    <td colpan="3">${mensaje}</td>
                </tr>
            
        </form>
        
        <%=idPersona%>
        <form method="POST" action="acciones" >
            <input type="hidden" name="idCliente" value="<%=idPersona%>">
            <input type="hidden" name="option" value="regcliente"
            <input type="hidden" name="opcion" value="registra">
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
                
                
                <tr>
                    <td colspan="2">${mensaje2}</td>
                </tr>
                
                
                <tr>
                    <td>
                        <input type="submit" value="Realizar Contrato">
                    </td>
                </tr>
            </table>
        </form>
      
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
         </section>
                
        
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>