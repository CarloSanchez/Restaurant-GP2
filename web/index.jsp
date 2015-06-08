<%-- 
    Document   : index
    Created on : 05/06/2015, 06:20:58 PM
    Author     : USUARIO
--%>

<%@page import="modelo.dao.TipoUsuarioDao"%>
<%@page import="modelo.dao.Impl.TipoUsuarioDaoImpl"%>
<%@page import="modelo.entidad.TipoUsuario"%>
<%@page import="modelo.dao.PersonaDao"%>
<%@page import="modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="modelo.entidad.Persona"%>
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
background: url(recursos/img/fondo.PNG) ;
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
             String tipousuario=request.getParameter("tipousuario");tipousuario=tipousuario==null?"":tipousuario;
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
<table width="350" border="0" class="tabla" align="center">
    
     <div class="container" align="center" >
        <p class="bien">Bienvenidos a nuestro  Sistema "EL ASADOR MARINO"</p>
     </div>
    <tr>
      <td >Tipo Usuario</td>
      <td>
          <select name="tipousuario">
              <option>Selecciona tipo de usuario</option>
              <%
             TipoUsuarioDao tipo=new TipoUsuarioDaoImpl();
              for(TipoUsuario u:tipo.listarTipoUsuario()){
             
              %>
              <option value="<%= u.getIdTipoUsuario()%>"><%= u.getNombreUsuario()%></option>
              <%}%>
          </select>
      </td>
    </tr>
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
        if(buscar.equals("noexiste"))
        {
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
    <%
  PersonaDao per=new PersonaDaoImpl();
   Persona persona=new Persona();
   String nombres=request.getParameter("nombres");nombres=nombres==null?"": nombres;
   String ap_pat=request.getParameter("ap_pat");ap_pat=ap_pat==null?"": ap_pat;
   String ap_mat=request.getParameter("ap_mat");ap_mat=ap_mat==null?"": ap_mat;
   String documento=request.getParameter("documento");documento=documento==null?"": documento;
   String genero=request.getParameter("genero");genero=genero==null?"": genero;
   String usuario1=request.getParameter("users");users=users==null?"": users;
   String password1=request.getParameter("password");password=password==null?"": password;
  
        persona.setNombres(nombres);
        persona.setApPat(ap_pat);
        persona.setApMat(ap_mat);
        persona.setDocumento(documento);
        persona.setGenero(genero);
        
        
        if(!nombres.equals("")&&!ap_pat.equals("")&&!ap_mat.equals("")&&!documento.equals("")&&!genero.equals("")&&
                !usuario1.equals("")&&!password1.equals(""))
        {
         
        if(per.agregarPersona(persona))
        {  
          
            response.sendRedirect("index.jsp");
            
         
        }else   {
                response.sendRedirect("index.jsp");
		}
        }
   %>
   <div class="container" align="center">
        <div class="row">
            <div class="col-xs-12 col-sm-3 col-md-3"></div>
            <div class="col-xs-12 col-sm-6 col-md-6 well well-sm">
    <form name="datos"class="form-horizontal table-condensed" method="post" action="reg_persona.jsp">
        <table class="table table-condensed" >
    <tbody>
      <tr>
          <td><label class="col-sm-12">Nombres</label></td>
          <td><input type="text" class="form-control" name="nombre" value="" id="textfield">
      </tr>
      
      <tr>
          <td><label class="col-sm-12">Apellido paterno</label></td>
          <td><input type="text" class="form-control" name="nombre" value="" id="textfield">
      </tr>
      
      <tr>
          <td><label class="col-sm-12">Apellido materno</label></td>
          <td><input type="text" class="form-control" name="nombre" value="" id="textfield">
      </tr>
     
     <tr>
          <td><label class="col-sm-12">DNI</label></td>
          <td><input type="text" class="form-control" name="nombre" value="" id="textfield">
     </tr>
     
     <tr>
        <td><label class="col-sm-12">Genero</label></td>
        <td><input type="radio" class="form-inline" name="genero" id="radio" value="F">Femenino
            <input type="radio" class="form-inline" name="genero" id="radio" value="M">Maculino</td>
      </tr>
      

      <tr>
          <td colspan="2">
            <input type="submit" class="btn btn-success" name="submit" id="submit" value="Enviar">     
          </td>
      </tr>
    </tbody>
  </table>

   </form>
   </div>
            <div class="col-xs-12 col-sm-3 col-md-3"></div>
  </div>
</div>
     
  
</body>
</html>
   

