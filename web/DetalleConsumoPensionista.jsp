
<%@page import="modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="modelo.dao.PersonaDao"%>
<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.entidad.Control"%>
<%@page import="modelo.dao.Impl.ControlDaoImpl"%>
<%@page import="modelo.dao.ControlDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>

        <%            
            ControlDao cdao = new ControlDaoImpl();
            Persona persona = new Persona();
            PersonaDao pdao = new PersonaDaoImpl();
                    
            String idCliente = request.getParameter("idCliente");
            idCliente = idCliente == null ? "" : idCliente;
            

            String fecha = request.getParameter("fecha");
            fecha = fecha == null ? "" : fecha;

            String person = request.getParameter("person");
            person = person == null ? "" : person;


        %>
        <form action="ocultar?option=reportes" method="POST">
            <input type="submit" value="Regresar">
        </form>
        <div>
            <div class="container">   
                <div class="row">          
                    <div class="jumbotron">
                        <div class="container">            
                            <div class="panel panel-info">
                                <div class="panel-body">

                                    <div class="center gap">
                                        <table class="table" align="center">
                                            <thead>
                                                <tr>
                                                    <td>Fecha:</td>
                                                    <td><%=fecha%></td>
                                            <br>
                                            </tr> 
                                            <tr>
                                                <td><h2>Plato</h2></td>
                                                <td><h2>Turno</h2></td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (Control control : cdao.listarDetalleConsumo(idCliente, fecha)) {
                                                        
                                                %>
                                                <tr>
                                                    <td><%=control.getPlato()%></td>  
                                                    <td><%=control.getTurno()%></td>
                                                </tr>
                                                <%}%>
                                            </tbody>


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