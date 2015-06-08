<%@page import="modelo.entidad.Categoria"%>
<%@page import="modelo.dao.Impl.CategoriaDaoImpl"%>
<%@page import="modelo.dao.CategoriaDao"%>
<%@page import="modelo.dao.Impl.PlatoDaoImpl"%>
<%@page import="modelo.dao.PlatoDao"%>
<%@page import="modelo.entidad.Plato"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body> 
        <%
            PlatoDao pdao = new PlatoDaoImpl();
            CategoriaDao cdao = new CategoriaDaoImpl();
            Plato plato = new Plato();
            
            String nombre = request.getParameter("nombre");
            nombre = nombre == null ? "" : nombre;

            String idCategoria = request.getParameter("idCategoria");
            idCategoria = idCategoria == null ? "" : idCategoria;

            String stock = request.getParameter("stock");
            stock = stock == null ? "" : stock;

            String precioNormal = request.getParameter("precioNormal");
            precioNormal = precioNormal == null ? "" : precioNormal;

            String precioPensionista = request.getParameter("precioPensionista");
            precioPensionista = precioPensionista == null ? "" : precioPensionista;

            String mensaje = "";
            out.println("nombre:" + nombre + "<br>" + "appP:" + stock + "<br>" + "appM:" + precioNormal + "<br>" + "dni:" + precioPensionista + "<br>");
            out.println("<br> Afuera");
            if (!nombre.equals("") & !stock.equals("") & !idCategoria.equals("") & !precioNormal.equals("") & !precioPensionista.equals("")) {

                plato.setNombre(nombre);
                plato.setIdCategoria(idCategoria);
                plato.setStock(stock);
                plato.setPrecioNormal(precioNormal);
                plato.setPrecioPensionista(precioPensionista);
                

                if (pdao.insertarPlato(plato)) {
                    response.sendRedirect("inicio.jsp");
                    out.println("Adentro");
                } else {
                    mensaje = "No se pudo registrar";
                    //System.out.println("NO registro");
                    response.sendRedirect("RegistrarPlato.jsp");

                }
            }
        %>
        <section>
            <div class="container">            
                <div class="panel panel-info">
                    <div class="panel-body">
                        <div class="box">

                            <div class="center gap">

                                <form name="form1" method="POST" action="RegistrarPlato.jsp" class="form-horizontal">                                         
                                    <table class="table" align="center">
                                        <tbody>
                                            <tr>
                                                <td>Nombre:</td>
                                                <td><input type="text" name="nombre" placeholder="Plato"></td>
                                            </tr>
                                            <tr>
                                                <td>Stock:</td>
                                                <td><input type="text" name="stock" placeholder="Stock" ></td>
                                            </tr>
                                            <tr>
                                                <td>Precio Normal:</td>
                                                <td><input type="text" name="precioNormal" placeholder="Precio" ></td>
                                            </tr>
                                            <tr>
                                                <td>Precio Pensionista:</td>
                                                <td><input type="text" name="precioPensionista" placeholder="Precio Pensionista"></td>
                                            </tr>
                                            <tr>
                                                <td>Categoria:</td>
                                                <td>
                                                    <select name="idCategoria">
                                                        <option>Seleccione</option>
                                                        <%
                                                            for (Categoria categoria : cdao.listarCategoria()) {

                                                        %>
                                                        <option value="<%=categoria.getIdCategoria()%>"><%=categoria.getNombre()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                            </tr>


                                            <tr>
                                                <td colspan="2"><%=mensaje%></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <input type="submit" value="Agregar">
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
