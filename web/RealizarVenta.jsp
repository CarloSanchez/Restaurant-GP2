
<%@page import="modelo.dao.Impl.ControlDaoImpl"%>
<%@page import="modelo.dao.ControlDao"%>
<%@page import="modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="modelo.dao.PersonaDao"%>
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
        <jsp:useBean id="idCliente" scope="request" class="java.lang.String" />
        <jsp:useBean id="nombres" scope="request" class="java.lang.String" />
        <jsp:useBean id="ap_pat" scope="request" class="java.lang.String" />
        <jsp:useBean id="ap_mat" scope="request" class="java.lang.String" />
        <jsp:useBean id="valor" scope="request" class="java.lang.String" />
        <jsp:useBean id="mensaje" scope="request" class="java.lang.String" />
        <jsp:useBean id="mensaje2" scope="request" class="java.lang.String" />
        <%  
            TipoVentaDao tpdao = new TipoVentaDaoImpl();
            UsuarioDao udao = new UsuarioDaoImpl();
        %>
        <br>
        <br>
        
        <section>
            <div class="container" >   
                <div class="row">          
                    <div class="jumbotron">
                        <form action="ventas" method="POST" aling="center">
                            <input type="hidden" name="option" value="buscarp">
                            <input type="hidden" name="opcion" value="buscar">
                            <table>
                                <tr>
                                    <td>DNI:</td>
                                    <td><input type="text" name="buscarDni" placeholder="Ingrese DNI" maxlength="8"></td>
                                    <td><input type="submit" value="Buscar" class="btn-primary "></td>
                                </tr> 
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2">${mensaje}</td>
                                </tr>
                            </table>

                            </form>
                            <form action="ventas" method="POST">
                            <input type="hidden" name="idCliente" value="<%=idCliente%>">
                            <input type="hidden" name="option" value="ventaa">
                            <input type="hidden" name="opcion" value="vender">
                            <div class="container">            
                                <div class="panel panel-info">
                                    <div class="panel-body">
                                        <div class="box">
                                            <div class="center gap">
                                                <table>
                                                        <tr>
                                                            <%=valor%>
                                                        </tr>
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
                                                                        for (Usuario usu : udao.listarUsuario()) {

                                                                    %>
                                                                    <option value="<%=usu.getIdUsuario()%>"><%=usu.getLogin()%></option>
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
                                                        <%if (valor.equals("Pensionista")) {%>
                                                        <tr>
                                                            <td>Turno: </td>
                                                            <td>
                                                                <select name="comidaDAC" >
                                                                    <option>Seleccione</option>
                                                                    <option value="D">Desayuno</option>
                                                                    <option value="A">Almuerzo</option>
                                                                    <option value="C">Cena</option>
                                                                </select>
                                                            </td>
                                                        </tr><%}%>

                                                        <tr>
                                                            <td colspan="2">${mensaje2}</td>
                                                        </tr>


                                                        <tr>
                                                            <td>
                                                                <input type="submit" value="Continuar" class="btn-primary ">
                                                            </td>
                                                        </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                        
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>