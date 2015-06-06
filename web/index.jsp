<%-- 
    Document   : index
    Created on : 05/06/2015, 06:20:58 PM
    Author     : USUARIO
--%>

<%@page import="modelo.entidad.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="modelo.dao.Impl.RestaurantDaoImpl"%>
<%@page import="modelo.dao.RestaurantDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" href="css/Estilos.css">
	<style type="text/css">
         
  body {
background: url(recursos/img/Captura.jpg) ;
        }
.bien{
  font-size: 200%;
  color: #cccccc;
}
.tabla tr td{
    
    color:#000066;
  font-size: 200%;
 
}
.tabla2 tr td{
    
    color:#0066cc;
  font-size: 150%;
 
}
 
    </style>
</head>
    

    <body>
          <% 
             RestaurantDao usuariodao=new RestaurantDaoImpl();
             String users=request.getParameter("users");
             String password=request.getParameter("password");
             String buscar=request.getParameter("buscar");buscar=buscar==null?"":buscar;
             String nombre;
             String apepat;
             String apemat;
              List<Usuario> lista=usuariodao.validarusuario(users, password);
             for(Usuario u:lista){
                 if(u.getUser().equals(users)&&u.getPassword().equals(password)){
                    response.sendRedirect("inicio.jsp");
                 }
                 nombre=u.getNombres();
                 apepat=u.getAp_pat();
                 apemat=u.getAp_mat();
                 users=u.getUser();
                 password=u.getPassword();
                 if(nombre.equals("")&&apepat.equals("")&&apemat.equals("")&&users.equals("")&&password.equals("")&&buscar.equals("buscar1")){
                   response.sendRedirect("index.jsp?buscar=noexiste");  
                 }
             }
        %>
        
        
        <form method="post" action="index.jsp">
<table width="350" border="0" class="tabla">
    
     <div class="container" align="center" >
        <p class="bien">Bienvenidos a nuestro  Sistema "EL ASADOR MARINO"</p>
     </div>
    
    <tr>
      <td >Usuario</td>
      <td width="200">
          <input type="text" name="users" >
      </td>
    </tr>
    
    <tr>
      <td>Password</td>
      <td>
          <input type="hidden" name="buscar" value="buscar1">
          <input type="password" name="password">
      </td>
    </tr>
    
    <tr>    
      <td colspan="2" align="center">
        <input type="submit"  value="Ingresar"  >
      </td>
    </tr>
  </table>
  </form>
        <%
        if(buscar.equals("noexiste")){
        %>
         <table class="table" align="center">
            <tbody>
             <tr>
                  <td>Usuario o contraseña no existe</td>
             </tr>
             <tr>
                 <td><a href="index.jsp">Registrate</a></td>
             </tr>
            </tbody>
         </table>
        <%
        }
        %>

</body>
</html>
   

