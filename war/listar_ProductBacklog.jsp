<%@ include file="WEB-INF/InitModel.jsp"%>

<html lang="en" > 
<head> 
<meta charset="utf-8"> 
<title>SCRUM-SCORP</title> 
<!--  <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css" />-->
<meta name="description" content="This an example of how you may use Twitter Bootstrap Modals in your webpage. Here in this tutorial it is discussed how to create Modal windows using Twitter Bootstrap with several examples and explanations.">
<link href="twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/css/bootstrap.css" rel="stylesheet"> 
<link rel="stylesheet" type="text/css" href="/bootstrap/css/plantilla.css" />
</head>
<body>
<div class="navbar navbar-fixed-top">
<div class="navbar-inner">
<div class="container">
<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</a>
<a class="brand" href="/reg_HistoriaUsuario.jsp">SCRUM-SCORP</a>
<div class="nav-collapse">
<ul class="nav">
		</ul>
</div><!--/.nav-collapse -->
</div>
</div>
</div>
<div class=span4></div>
<%@ page import="java.util.List"%>
<%@ page import="scrum.scorp.model.entity.HistoriaUsuario"%>
<%@ page import="scrum.scorp.model.entity.Proyecto"%>
<%@ page import="scrum.scorp.model.jdo.JDO"%>
	<%
	HistoriaUsuario hu = new HistoriaUsuario();
	HttpSession sesion = request.getSession();
	String proy = (String) sesion.getAttribute("trabajo");
	List<HistoriaUsuario> lista_historias=hu.listar_historias(proy);
		
	%>
	<div class="table-responsive">
		<table class="table table-condensed table-hover table-striped">
			<tr><td colspan="5" style="text-align:center" >LISTA DE PROYECTOS </td></tr>
			<tr><td style="text-align:center" >NOMBRE</td><td style="text-align:center" >DESCRIPCION</td>
			<td style="text-align:center" >PRIORIDAD</td><td style="text-align:center" >ESFUERZO</td>
			<td style="text-align:center" >PRIORIDAD</td></tr>
  				<%
  					for(int i=0;i<lista_historias.size();i++){
  							HistoriaUsuario historia=(HistoriaUsuario)lista_historias.get(i);
  							out.print("<tr>");
  							out.print("<td style=\"text-align:center\">"+historia.getNombre()+"</td>");
  							out.print("<td style=\"text-align:center\">"+historia.getDescripcion()+"</td>");
  							out.print("<td style=\"text-align:center\">"+historia.getPrioridad()+"</td>");
  							out.print("<td style=\"text-align:center\">"+historia.getEsfuerzo()+"</td>");
  							out.print("<td style=\"text-align:center\">"+historia.getPrioridad()+"</td>");
  							out.print("</tr>");
  						}
  				%>
		</table>
		</div>


 <div class=span4></div>
	</body>
</html>
