 <%@include file="WEB-INF/jspf/top.jspf"%>
        <section>
        <div class="container">            
            <div class="panel panel-info">
                <div class="panel-body">
            <div class="box">
                           
                <div class="center gap">
                    
                <form name="form1" method="post" action="accCliente.jsp" class="form-horizontal">                                         
                    <table class="table" align="center">
                        <tbody>
                            <tr>
                                <td>
                                    
                                    <h4 class="text-success">Datos de Cliente</h4>                                                                        
                                    <div class="form-group center">
                                        
                                        <div class="col-xs-12">
                                            <input type="text" required="" class="form-control" placeholder="Nombres *" name="f_nombres">
                                        </div>
                                        <div class="col-lg-6"></div>
                                        <div class="col-xs-12">
                                            <input type="text" required="" class="form-control" placeholder="Apellido Paterno *" name="f_ape_pa">
                                        </div>
                                        <div class="col-lg-6"></div>
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" placeholder="Apellido Materno" name="f_ape_mat" >
                                        </div>
                                        <div class="col-xs-6">
                                            <input type="text" class="form-control" placeholder="DNI-Cliente *" onKeyDown="return validar(event)" name="f_dni" maxlength="8">                                            
                                        </div>
                                        
                                        <div class="col-xs-3">
                                            <input type="text" class="form-control" placeholder="Cant. Hijos" onKeyDown="return validar(event)" name="f_num_hijos">
                                        </div>                                          
                                        <div class="col-xs-3">
                                            <input type="text" class="form-control" placeholder="Ingreso Aprox" onKeyDown="return validar(event)" name="f_ingresos">                                            
                                        </div> 
                                                                                                                        
                                    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                </td>
                               
                                <td></td><td></td>
                                <td>                                                                                                          
                                    <br>                                                                        
                                    <br>
                                                                            
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" placeholder="RUC" maxlength="11" onKeyDown="return validar(event)" name="f_ruc">
                                        </div>                                                                                                                        
                                    
                                        <div class="col-xs-6">
                                            <input type="text" class="form-control" placeholder="Telefono" maxlength="12" onKeyDown="return validar(event)" name="f_telefono">
                                        </div>
                                        <div class="col-lg-6"></div>
                                        <div class="col-xs-6">
                                            <input type="text" class="form-control" placeholder="Direccion" name="f_direccion">
                                        </div><div class="col-lg-6"></div>
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" placeholder="E-mail" name="f_email">
                                        </div>
                                        
                                        <div class="col-xs-12">
                                            <center><br>
                                        <input type="submit" class="btn btn-warning alert-link" value="Aceptar" />
                                        <input type="hidden" name="f_robot" value="<>"/>
                                        <input type="hidden" name="f_cliente_id" value="<>"/>                                                                                                                       
                                        </center>
                                        </div>
                                                                                                            
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
        
        <%@include file="WEB-INF/jspf/bottom.jspf"%>