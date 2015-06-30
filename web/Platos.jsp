<%@page import="modelo.entidad.Categoria"%>
<%@page import="modelo.dao.Impl.CategoriaDaoImpl"%>
<%@page import="modelo.dao.CategoriaDao"%>
<%@page import="modelo.dao.Impl.PlatoDaoImpl"%>
<%@page import="modelo.dao.PlatoDao"%>
<%@page import="modelo.entidad.Plato"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body> 
        <%            PlatoDao pdao = new PlatoDaoImpl();
            CategoriaDao cdao = new CategoriaDaoImpl();

        %>
        <br>
        <br>
        
        <section>
           
            <div class="container">   
                <div class="row">   
                    <div clas="col-md-7">
                        <section class="well" id="back0">
                            <div class="jumbotron">
                                <div class="container">            
                                    <div class="panel panel-info">
                                        <div class="panel-body">
                                            <div class="box">
                                                  <br>
                                                  <section class="table">
               <form action="ocultar?option=platos" method="POST">
                <input type="submit" value="Registrar Plato">
                <input type="hidden" name="option" value="platos">
              </form>
           </section>
                                                <div class="center gap">
                                                    <table class="table table-bordered" >
                                                        <thead>    
                                                        <td></td>
                                                        <td><h3>Plato</h3></td>
                                                        <td><h3>Precio Pensionista</h3></td>
                                                        <td><h3>Precio Normal</h3></td>
                                                        <%                                                        int count = 0;

                                                            for (Plato plat : pdao.listaPlato()) {
                                                                count++;
                                                        %>
                                                        <tr>
                                                            <td> <%=count%>.-</td>
                                                            <td><%=plat.getNombre().toUpperCase()%></td>
                                                            <td><%=plat.getPrecioNormal()%></td>
                                                            <td><%=plat.getPrecioPensionista()%></td>
                                                            <td><a href="#">Modificar</a></td>
                                                            <%}%>
                                                        </tr>

                                                        </thead>
                                                        <br>

                                                    </table> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>

        </section>

        <%@include file="WEB-INF/jspf/bottom.jspf"%>
