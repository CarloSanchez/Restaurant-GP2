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
            <header>
      
        </header>
        <div>
        <did class="container"> 
        <div class="row">
        <div clas="col-md-7">
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
                             <h3>ARROZ1</h3>
                           </div>                           
                        </div>
                        
                        <div class="item ">
                            <img  src = "recursos/img/arroz2.jpg"  alt = "REST" >    
                            <div  class = "carrusel-caption" >  
                             <h3>ARROZ2</h3>
                           </div>                           
                        </div>
                         
                        <div class="item ">
                            <img  src = "recursos/img/arroz3.jpg"  alt = "REST" >    
                            <div  class = "carrusel-caption" >  
                             <h3>ARROZ3</h3>
                           </div>                           
                        </div>  
                        
                        <div class="item ">
                            <img  src = "recursos/img/causa.jpg"  alt = "REST" >    
                            <div  class = "carrusel-caption" >  
                             <h3>CAUSA</h3>
                           </div>                           
                        </div>  
                        
                        <div class="item ">
                            <img  src = "recursos/img/PEZ.jpg"  alt = "REST" >    
                            <div  class = "carrusel-caption" >  
                             <h3>pez</h3>
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
 <div class="col-md-7 offset-1">
 <section class="well" id="back1">                                
 <h1>PLASTOS DEL DIA</h1>  
 <div>
 <p>TENEMOS LOS MEJORES PLATOS PARA SABOREAR</p>
 <li><a href="menu.jsp">MENU DEL DIA</a></li>
 </div>
 </section>
 </div>
         
             
<p>
<a class="btn btn-primary btn-lg" role="button">Leer mas</a></p>     
  
 <section>      
       
 </body>
  
</html>
 <%@include file="WEB-INF/jspf/bottom.jspf"%>  			
	

