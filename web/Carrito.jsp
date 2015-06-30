<%@page import="modelo.entidad.DetalleVenta"%>
<%@page import="modelo.entidad.Venta"%>
<%@page import="modelo.dao.Impl.VentaDaoImpl"%>
<%@page import="modelo.dao.VentaDao"%>
<%@page import="modelo.dao.Impl.DetalleVentaDaoImpl"%>
<%@page import="modelo.dao.DetalleVentaDao"%>
<%@page import="modelo.entidad.Plato"%>
<%@page import="modelo.dao.Impl.PlatoDaoImpl"%>
<%@page import="modelo.dao.PlatoDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body>

        <%  
            DetalleVentaDao ddao = new DetalleVentaDaoImpl();
            PlatoDao pdao = new PlatoDaoImpl();
            VentaDao vdao = new VentaDaoImpl();

            Venta venta = new Venta();
            DetalleVenta dv = new DetalleVenta();

            String idCliente = request.getParameter("idCliente");
            idCliente = idCliente == null ? "" : idCliente;
            //out.println(idVenta);

            String idVenta = request.getParameter("idVenta");
            idVenta = idVenta == null ? "" : idVenta;
            //out.println(idVenta);

            String idPlato = request.getParameter("idPlato");
            idPlato = idPlato == null ? "" : idPlato;

            String precio = request.getParameter("precio");
            precio = precio == null ? "" : precio;
            //out.println(precio);

            String cantidad = request.getParameter("cantidad");
            cantidad = cantidad == null ? "" : cantidad;
            //out.println(cantidad);

            String valor = request.getParameter("valor");
            valor = valor == null ? "" : valor;
            out.println(valor);

            String opcion = request.getParameter("opcion");
            opcion = opcion == null ? "vender" : opcion;

            String option = request.getParameter("option");
            option = option == null ? "" : option;

            if (opcion.equals("vender")) {
                if (idVenta.equals("")) {
                    venta = ddao.obtenerIdVenta(idCliente);
                    idVenta = venta.getIdVenta();
                } else {
                    dv.setIdVenta(idVenta);
                    dv.setIdPlato(idPlato);
                    dv.setPrecio(precio);
                    dv.setCantidad(cantidad);
                    if (ddao.insertDetalleVenta(dv)) {
                        
                        response.sendRedirect("Carrito.jsp?idVenta="+idVenta);

                    }
                }

            }


        %>


        <section>
            <div class="container">   
                <div class="row">          
                    <div class="jumbotron">
                        <form action="Carrito.jsp" method="POST"><h3>Ventas</h3>
                            <input type="hidden" name="idVenta" value="<%=idVenta%>">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Plato: </td>
                                        <td>
                                            <select name="idPlato">
                                                <option>Plato</option>
                                                <%
                                                    for (Plato plato : pdao.listarPlato()) {

                                                %>
                                                <option value="<%=plato.getIdPlato()%>"><%=plato.getNombre().toUpperCase()%></option>

                                                <%}%>
                                            </select>
                                        </td>

                                    </tr>
                                <br><br>

                                <tr>
                                    <td>Cantidad:</td>
                                    <td>
                                        <input type="text" name="cantidad" value="" maxlength="10">
                                    </td>
                                <tr>
                                    <td>Precio:</td>
                                    <td>
                                        <input type="text" name="precio" value="" maxlength="10">
                                    </td>
                                </tr>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="submit" value="Agregar">
                                    </td>
                                </tr>
                                </tbody>
                            </table> 
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="container">   
                <div class="row">          
                    <div class="jumbotron">
                        <h4 align="center"></h4><br>
                        <form action="Carrito.jsp" method="POST">
                            <input type="hidden" name="idVenta" value="<%=idVenta%>">
                            <input type="hidden" name="idPlato" value="<%=idPlato%>">
                            <table>
                                 
                                <thead>
                                    <tr>

                                        <td width="5%"><strong>Nº</strong></td>
                                        <td width="25%"><strong>Plato</strong></td>
                                        <td width="8%"><strong>Precio</strong></td>
                                        <td width="8%"><strong>Cantidad</strong></td>
                                        <td width="8%"><strong>Total</strong></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        
                                        int count = 0;
                                        DetalleVentaDao dao = new DetalleVentaDaoImpl();
                                        for (DetalleVenta detv : dao.listarDetalle(idVenta)) {
                                            count++;
                                            
                                            

                                    %>
                                    <tr> 
                                        <td aling="center"><%=count%></td>
                                        <td align=""><%=detv.getNombre().toUpperCase()%></td>
                                        <td align=""><%=detv.getPrecio()%></td>
                                        <td align=""><%=detv.getCantidad()%></td>
                                        <td align=""><%=detv.getTotal()%></td>
                                        
                                    </tr>
                                    
                                    <%}%>                   
                                </tbody>

                            </table>
                        </form>
                        
                        <form action="inicio.jsp" method="POST">
                            <table class="table table-hover table-striped table-bordered">
                                <tbody>
                                    <tr>
                                        <td colspan="6" align="center">
                                            <input type="submit" name="option" class="btn btn-primary" value="Terminar">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>

                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>

        </section>
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>