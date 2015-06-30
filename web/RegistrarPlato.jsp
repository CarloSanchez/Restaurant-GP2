
<%@page import="modelo.entidad.Plato"%>
<%@page import="modelo.dao.Impl.PlatoDaoImpl"%>
<%@page import="modelo.entidad.Categoria"%>
<%@page import="modelo.dao.Impl.CategoriaDaoImpl"%>
<%@page import="modelo.dao.CategoriaDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body> <jsp:useBean id="mensaje" scope="request" class="java.lang.String" />
        <%            PlatoDaoImpl pdao = new PlatoDaoImpl();
            CategoriaDao cdao = new CategoriaDaoImpl();

        %>
        <br>
        <br>
        <div class="container">   
            <div class="row">  
                <div clas="col-md-5 offset-1">
                    <section class="well" id="back1">
                        <div class="jumbotron">                                     
                            <div class="panel panel-info">
                                <div class="panel-body">
                                    <div class="box">

                                        <div class="center gap">

                                            <form name="form1" method="POST" action="acciones" class="form-vertical"> 
                                                <input type="hidden" name="option" value="platos">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>Nombre:</td>
                                                            <td><input type="text" name="nombre" placeholder="Plato"></td>
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
                                                            <td>Precio Normal:</td>
                                                            <td><input type="text" name="precioNormal" placeholder="Precio" ></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Precio Pensionista:</td>
                                                            <td><input type="text" name="precioPensionista" placeholder="Precio Pensionista"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2"><%=mensaje%></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <input type="submit" value="Agregar" class="btn-primary ">
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </form>                                    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                        
                    </section>
                </div>                            

            </div>
        </div>
    </div>

</body>
</html>



<%@include file="WEB-INF/jspf/bottom.jspf"%>
