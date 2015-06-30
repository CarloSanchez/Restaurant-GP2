<%@page import="modelo.entidad.Cliente"%>
<%@page import="modelo.dao.Impl.ClienteDaoImpl"%>
<%@page import="modelo.dao.ClienteDao"%>
<%@page import="modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="modelo.dao.PersonaDao"%>
<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.dao.Impl.RestaurantDaoImpl"%>
<%@page import="modelo.dao.RestaurantDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>
<html>
    <body><jsp:useBean id="mensaje" scope="request" class="java.lang.String" />  

        <section aling="center">
                 <br>
                 <br>
                 <br>
                 <br>
                 <br>
            <div class="container">               
            <div class="fondo">
            <div class="row">          
            <div class="col-md-8">
            <div class="jumbotron">
            <div class="container">
            <div class="container">            
                <div class="panel panel-info">
                    <div class="panel-body">
                        <div class="box">

                            <div class="center gap">

                                <form method="POST" action="acciones" class="form-horizontal">  
                                    <input type="hidden" name="option" value="agregarp" class="btn btn-primary">
                                    <table class="table" align="center">
                                        
                                            <tr>
                                                <td>NOMBRES:</td>
                                                <td><input type="text" name="nombres" placeholder="Nombres"></td>
                                            </tr>
                                            <tr>
                                                <td>APELLIDO PATERNO:</td>
                                                <td><input type="text" name="ap_pat" placeholder="Apellido Paterno" ></td>
                                            </tr>
                                            <tr>
                                                <td>APELLIDO MATERNO:</td>
                                                <td><input type="text" name="ap_mat" placeholder="Apellido materno" ></td>
                                            </tr>
                                            <tr>
                                                <td>DNI:</td>
                                                <td><input type="text" name="documento" placeholder="DNI" maxlength="8"></td>
                                            </tr>
                                            <tr>
                                                <td>SEXO:</td>
                                                <td>
                                                    <select name="genero">
                                                        <option>Seleccione</option>
                                                        <option value="M">Masculino</option>
                                                        <option value="F">Femenino</option>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2">${mensaje}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <input type="submit" value="Registrar" class="btn btn-primary">
                                                </td>
                                            </tr>
                                        
                                    </table>

                                </form>                                    
                            </div>
                        </div>
                    </div></div>                                        

            </div>       
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
        </section>
   
    </body>
</html>
<%@include file="WEB-INF/jspf/bottom.jspf"%>
