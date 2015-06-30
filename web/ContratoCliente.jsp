


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
    <body><jsp:useBean id="mensaje" scope="request" class="java.lang.String" />
        <jsp:useBean id="idPersona" scope="request" class="java.lang.String" />
        <jsp:useBean id="nombres" scope="request" class="java.lang.String" />
        <jsp:useBean id="ap_pat" scope="request" class="java.lang.String" />
        <jsp:useBean id="ap_mat" scope="request" class="java.lang.String" />
        <jsp:useBean id="documento" scope="request" class="java.lang.String" />
        <jsp:useBean id="mensaje2" scope="request" class="java.lang.String" />
        <jsp:useBean id="opcion" scope="request" class="java.lang.String" />
        <%            
            
            OcupacionDao ocp = new OcupacionDaoImpl();
            
            Ocupacion op = new Ocupacion();
            


        %>
        <br>
        <br>
        <div class="container">   
            <div class="row">          
                <div class="jumbotron">
                    <h3 aling="center"> CONTRATO CLIENTE</h3> 
                    <div class="container">            
                        <div class="panel panel-info">
                            <div class="panel-body">
                                <div class="box">
                                    <div class="center gap">                                                                                             
                                        <div class="container" >
                                            <div class="row" >
                                                <div class="col-md-3"></div>
                                                <div class="col-md-6">
                                                    <form action="acciones" method="POST" aling="center">
                                                        <input type="hidden" name="opcion" value="buscar">
                                                        <input type="hidden" name="option" value="busca">
                                                        <table>
                                                            <tr>
                                                                <td>DNI:</td>
                                                                <td><input type="text" name="buscarDni" placeholder="Ingrese DNI" maxlength="8"></td>
                                                                <td><input type="submit" value="Buscar" class="btn-primary "></td>
                                                            </tr> 

                                                            <tr>
                                                                <td colpan="3">${mensaje}</td>
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
                                                    <form method="POST" action="acciones" aling="center">
                                                        <input type="hidden" name="option" value="contratos">
                                                        <input type="hidden" name="idCliente" value="<%=idPersona%>" size="20">
                                                        <input type="hidden" name="opcion" value="registrar" class="from-horizontal">
                                                        <table aling=""> 
                                                            <tr>${idPersona}
                                                                <td>Nombres:</td>
                                                                <td><input type="text" name="nombres" placeholder="Nombres" value="<%=nombres%>" readonly="true"></td>
                                                            </tr> <br><br>
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
                                                                <td><input type="text" name="precio" placeholder="Precio" value=""></td>
                                                            </tr> 
                                                            <tr>
                                                                <td>Inicio:</td>
                                                                <td><input type="text" name="fechaini" placeholder="DD/MM/YY" value=""></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Termino</td>
                                                                <td><input type="text" name="fechaterm" placeholder="DD/MM/YY" value=""></td>
                                                            </tr>

                                                            <tr>
                                                                <td colspan="2">${mensaje2}</td>
                                                            </tr>


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
            </div>
        </div>



        <%@include file="WEB-INF/jspf/bottom.jspf"%>
