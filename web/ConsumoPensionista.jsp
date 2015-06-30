<%@page import="modelo.entidad.Control"%>
<%@page import="modelo.dao.Impl.ControlDaoImpl"%>
<%@page import="modelo.dao.ControlDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>
        <form action="ocultar?option=reporte" method="POST">
            <input type="submit" value="Regresar">
        </form>
        <div class="container">   
            <div class="row">          
                <div class="jumbotron">                              
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <div class="box">
                                <div class="center gap">
                                    <table class="table" align="center">
                                        <thead> 

                                        <td>Nº</td>
                                        <td>Pensionista</td>  
                                        <td>Fecha</td>
                                        <td>Turno</td>

                                        <td></td>
                                        <%                ControlDao ctdao = new ControlDaoImpl();
                                            int count = 0;
                                            for (Control cn : ctdao.listarControl()) {
                                                count++;
                                        %>
                                        <tr>    
                                            <td><%=count%></td>
                                            <%
                                                String idCliente = cn.getIdCliente();
                                                String persona = cn.getPensionista();
                                            %>
                                            <td><%=cn.getPensionista()%></td>
                                            <td><%=cn.getFecha()%></td>
                                            <td><%=cn.getTurno()%></td>
                                            <%

                                            %>
                                            <td><a href="DetalleConsumoPensionista.jsp?idCliente=<%=idCliente%>&fecha=<%=cn.getFecha()%>">Detalles</a></td>
                                            <%}%>
                                        </tr>       
                                        </thead>
                                    </table>
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