<%@include file="WEB-INF/jspf/top.jspf"%>
<!DOCTYPE html> <html lang="en">  
<%
    
%>
    <head>    
        <meta charset="utf-8">    
        <meta http-equiv="X-UA-Compatible" content="IE=edge">     
        <meta name="viewport" content="width=device-width, initial-scale=1">   
        <title>Bootstrap 101 Template</title>      <!-- Bootstrap --> 
        <link href="css/bootstrap.min.css" rel="stylesheet">    
        </head>  
        <body>   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->   
            
        <div>
            <section>
                 <br>
                 <br>
                 <br>
                 <br>
                 <br>
            <div class="container">               
            <div class="fondo">
            <div class="row">          
            <div class="col-md-6">
            <div class="jumbotron">
            <div class="container">
        <section class="well" id="center">
        <h3>PLATOS</h3>

                <div id="carousel-r" class=" carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li  data-target= "#carousel-r"  data-slide-to= "0"  class= "active" ></li>     
                        <li  data-target= "#carousel-r"  data-slide-to= "1" ></li>    
                        <li  data-target= "#carousel-r"  data-slide-to= "2" ></li> 
                        <li  data-target= "#carousel-r"  data-slide-to= "3" ></li> 
                        <li  data-target= "#carousel-r"  data-slide-to= "4" ></li> 
 
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img  src = "recursos/img/arroz1.jpg"  alt = "REST" >    
                            <div  class = "carrusel-caption" >  
                             
                           </div>                           
                        </div>
                        
                        <div class="item ">
                            <img  src = "recursos/img/arroz2.jpg"  alt = "REST" >    
                            <div  class = "carrusel-caption" >  
                             
                           </div>                           
                        </div>
                         
                        <div class="item ">
                            <img  src = "recursos/img/arroz3.jpg"  alt = "REST" >    
                            <div  class = "carrusel-caption" >  
                             
                           </div>                           
                        </div>  
                        
                        <div class="item ">
                            <img  src = "recursos/img/causa.jpg"  alt = "REST" >    
                            <div  class = "carrusel-caption" >  
                            
                           </div>                           
                        </div>  
                        
                        <div class="item ">
                            <img  src = "recursos/img/PEZ.jpg"  alt = "REST" >    
                            <div  class = "carrusel-caption" >  
                            
                           </div>                           
                        </div>  
                    </div>
                    <a class="left carousel-control" href="#carousel-ejemplo" role="button" data-slide="prev">
                        <samp class="glyphicon glyphicon-chevron-left" aria-hidden="true"></samp>
                        <samp class="sr-only">PREVIO</samp>                        
                    </a>
                    <a class="right carousel-control" href="#carousel-ejemplo" role="button" data-slide="next">
                        <samp class="glyphicon glyphicon-chevron-right" aria-hidden="true"></samp>
                        <samp class="sr-only">SIGUIENTE</samp>
                        
                    </a>
                </div> 
                </section>
                </div>
                </div>
                </did>
                  
 
    
    <script src="js/jquery-1.11.1.min.sj"></script>
    <script ser="js/bootstrap.sj"></script>
    <script>
        $('.carousel').carousel({
            interval=1000;
            pause="harver";
        });
    </script>
     </div>
 <div class="col-md-6 offset-1">
    <section class="well" id="back1">                                
                        <h2>Nuestra Mision</h2>
                        <p>Ofrecer a nuestros clientes productos alimenticios de calidad, nutritivos 
                           y saludables; en un ambiente agradable desarrollados por un equipo humano
                           competente, comprometido en proporcionar excelente servicio 
                           y satisfacción, generando desarrollo económico social al país y la empresa..</p>
                         <h2>Nuestra Vision</h2>
                          <p>Ser reconocidos como el mejor restaurante de prestigio, confiable en comida
                           marina y criolla en donde nuestro compromiso principal sea crear experiencias
                           agradables al paladar de nuestros clientes.</p>                      
                       </div>    
                     <div><span><a href="menu.jsp" class="btn btn-primary">Leer Mas</a></span></div>
                 </div>
             </div>
          </div> 
                 	


 </section>
 </div>
       
      
        
 
 <%@include file="WEB-INF/jspf/bottom.jspf"%>  			
	

