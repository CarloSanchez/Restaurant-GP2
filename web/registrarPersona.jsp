<%@page import="modelo.entidad.Persona"%>
<%@page import="modelo.dao.Impl.RestaurantDaoImpl"%>
<%@page import="modelo.dao.RestaurantDao"%>
<%@include file="WEB-INF/jspf/top.jspf"%>

<%
    RestaurantDao restdao = new RestaurantDaoImpl();
    Persona persona = new Persona();

    

    String nombres = request.getParameter("nombres");
    nombres = nombres == null ? "" : nombres;

    String ap_pat = request.getParameter("ap_pat");
    ap_pat = ap_pat == null ? "" : ap_pat;

    String ap_mat = request.getParameter("ap_mat");
    ap_mat = ap_mat == null ? "" : ap_mat;

    String documento = request.getParameter("documento");
    documento = documento == null ? "" : documento;

    String genero = request.getParameter("genero");
    genero = genero == null ? "" : genero;

    String mensaje = "";
   out.println("nombre:"+nombres+"<br>"+"appP:"+ap_pat+"<br>"+"appM:"+ap_mat+"<br>"+"dni:"+documento+"<br>"+"genero:"+genero);
   out.println("<br> Afuera");
    if (!nombres.equals("") & !ap_pat.equals("") & !ap_mat.equals("") & !documento.equals("") & !genero.equals("")) {
 
        
        persona.setNombres(nombres);
        persona.setApPat(ap_pat);
        persona.setApMat(ap_mat);
        persona.setDocumento(documento);
        persona.setGenero(genero);
        
        

        if (restdao.agregarPersona(persona)) {
           out.println("se registro correctamente");
            response.sendRedirect("registrarCliente.jsp");
            out.println("Adentro");
           System.out.println("Se registro");
        } else {
            mensaje = "No se pudo registrar";
            //System.out.println("NO registro");
            response.sendRedirect("registrarPersona.jsp");
        }
    }

%>   

<section>
    <div class="container">            
        <div class="panel panel-info">
            <div class="panel-body">
                <div class="box">

                    <div class="center gap">

                        <form name="form1" method="post" action="registrarPersona.jsp" class="form-horizontal">                                         
                            <table class="table" align="center">
                                <tbody>
                                    <tr>
                                    <td>NOMBRES:</td>
                                    <td><input type="text" name="nombres" placeholder="Nombres" value=""></td>
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
                                            <option value="M">Masculino</option>
                                            <option value="F">Femenino</option>
                                        </select>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2"><%=mensaje%></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" value="Registrar">
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