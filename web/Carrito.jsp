<%@page import="modelo.entidad.Plato"%>
<%@page import="modelo.dao.Impl.PlatoDaoImpl"%>
<%@page import="modelo.dao.PlatoDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>
        <%
            PlatoDao pdao = new PlatoDaoImpl();

            for (Plato plato : pdao.listarPlato()) {


        %>
        <section>
            <table>
                <tr>
                    <td>
                        <%=plato.getNombre()%>
                    </td>
                </tr><%}%>
            </table>
        </section>
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>