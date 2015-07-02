<%@page import="modelo.entidad.DetalleVenta"%>
<%@page import="java.util.List"%>
<%@page import="modelo.dao.Impl.ControlDaoImpl"%>
<%@page import="modelo.dao.ControlDao"%>
<%@page import="modelo.dao.Impl.DetalleVentaDaoImpl"%>
<%@page import="modelo.dao.DetalleVentaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>

        <%            DetalleVenta dventa = new DetalleVenta();
            ControlDao cndao = new ControlDaoImpl();

            String fecha1 = request.getParameter("fecha1");
            fecha1 = fecha1 == null ? "" : fecha1;

            String fecha2 = request.getParameter("fecha2");
            fecha2 = fecha2 == null ? "" : fecha2;

        %> 
        <br>
        <br>
        <div class="container">   
            <div class="row">          
                <div class="jumbotron">
                    <div class="container">            
                        <div class="panel panel-info">
                            <div class="panel-body">
                                <div class="box">
                                    <div class=" gap">
                                        <table class="table table-striped" >                                  
                                            <form action="VentaDia.jsp" method="POST">

                                                <tr>
                                                    <td>De la Fecha: </td>                  
                                                    <td><input type="text" name="fecha1" value="" placeholder="DD/MM/AAAA"></td> 
                                                    <td></td>           
                                                    <td> Hasta la Fecha: </td>
                                                    <td><input type="text" name="fecha2" value="" placeholder="DD/MM/AAAA"></td>
                                                </tr>
                                                <tr>
                                                    <td><input type="submit" name="Mostrar" class=" btn btn-primary "></td>
                                                </tr>
                                            </form>
                                        </table>

                                        <div class="row">                                
                                            <div class="container">            
                                                <div class="panel panel-info">
                                                    <div class="panel-body">
                                                        <div class="box">

                                                            <table class="table table-bordered" >
                                                                <form>
                                                                    <%                if (!fecha1.equals("") & !fecha2.equals("")) {
                                                                    %>
                                                                    <h5><strong>De: <%=fecha1%> hasta: <%=fecha2%></strong></h5>
                                                                    <div>

                                                                        <thead>   
                                                                        <td></td>
                                                                        <td><strong>Venta</strong></td>
                                                                        <td><strong>Cantidad</strong></td>
                                                                        <td><strong>Precio</strong></td>
                                                                        <td><strong>Total</strong></td>
                                                                        </thead>
                                                                        <tbody>
                                                                            <%

                                                                                int count = 0;
                                                                                for (DetalleVenta dv : cndao.listarVentas(fecha1, fecha2)) {
                                                                                    count++;
                                                                            %>
                                                                            <tr>    

                                                                                <td></td>
                                                                                <td><%=dv.getIdVenta()%></td>
                                                                                <td><%=dv.getCantidad()%></td>
                                                                                <td><%=dv.getPrecio()%></td>
                                                                                <td><%=dv.getTotal()%></td>
                                                                            </tr>
                                                                            
                                                                            <%}%>
                                                                            

                                                                        </tbody>

                                                                    </div>
                                                                    <%}%>

                                                            </table>
                                                          <div>                                                        
                                                            <form action="ocultar?option=reporte" method="POST">
                                                               <input type="submit" value="Regresar">
                                                            </form>
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
                    </div>
                </div>
            </div>
        
        </div>

    </body>   
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
