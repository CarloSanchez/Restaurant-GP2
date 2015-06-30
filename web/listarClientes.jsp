
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
        <br>
        <br>
        <div class="container">   
            <div class="row">          
                <div class="jumbotron">
                    <h3>Clientes</h3> 
                    <div class="container">            
                        <div class="panel panel-info">
                            <div class="panel-body">
                                <div class="box">
                                    <div class="center gap">                    
                                        <table class="table" aling="canter">
                                            <tr>
                                            </tr>
                                            <tr><td>       
                                                <td>Nombres  </td>
                                                <td>Apellido Paterno  </td>
                                                <td>Apellido Materno </td>
                                                <td>Documento   </td>




                                                <%

                                                    ClienteDao client = new ClienteDaoImpl();
                                                    int count = 0;

                                                    for (Cliente cliente : client.listarCliente()) {
                                                        count++;


                                                %>

                                            </tr>
                                            <tr>


                                                <td> <%=count%>.-</td>
                                                <td><%=cliente.getNombres()%></td>
                                                <td><%=cliente.getApPat()%></td>
                                                <td><%=cliente.getApMat()%></td>
                                                <td><%=cliente.getDocumento()%></td>
                                                </div>

                                                <td> 
                                            <li>
                                                <a href="#">
                                                    <span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>Actualizar
                                                </a>
                                            </li>                       
                                            </td> 



                                            </tr>
                                            <tr>
                                            </tr>     

                                            <%}%>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>


<%@include file="WEB-INF/jspf/bottom.jspf"%>

