<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.entidad.Ocupacion"%>
<%@page import="modelo.dao.Impl.OcupacionDaoImpl"%>
<%@page import="modelo.dao.OcupacionDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>
        <%
            OcupacionDao ocp = new OcupacionDaoImpl();
            Ocupacion ocupacion = new Ocupacion();
            Persona persona = new Persona();

            String nombre = request.getParameter("nombre");
            nombre = nombre == null ? "" : nombre;
            
            String idPersona = request.getParameter("idPersona");
            idPersona = idPersona == null ? "" : idPersona;

            String mensaje = "";

            if (!nombre.equals("")) {
                ocupacion.setNombre(nombre);

                if (ocp.insertarOcupacion(ocupacion)) {
                    response.sendRedirect("ContratoCliente.jsp");
                } else {
                    mensaje = "no se  pudo agregar la ocupacion";
                    response.sendRedirect("resgistrarOcupacion.jsp");
                }
            }
        %> 
        <%=idPersona%>
        <section>
            <div class="container">            
                <div class="panel panel-info">
                    <div class="panel-body">
                        <div class="box">

                            <div class="center gap">

                                <form name="form1" method="post" action="registrarOcupacion.jsp" class="form-horizontal">
                                    <input type="hidden" name="idPersona" value="<%=idPersona%>" size="20">
                                    <table class="table" align="center">
                                        <tbody>
                                            <tr>
                                                <td>Ocupacion:</td>
                                                <td><input type="text" name="nombre" placeholder="Nombre"></td>
                                            </tr>
                                            <tr>
                                                <%=mensaje%>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <input type="submit" value="Agregar Ocupacion">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </form>                                    
                            </div>
                        </div>
                    </div></div>                                        

            </div>                            


        </section>
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
