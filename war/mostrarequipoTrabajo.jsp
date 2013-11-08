<%@page import="javax.jdo.PersistenceManager"%>


<html lang="en">
<head>
<meta charset="utf-8">
<title>SCRUM-SCORP</title>
<!--  <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css" />-->
<meta name="description"
	content="This an example of how you may use Twitter Bootstrap Modals in your webpage. Here in this tutorial it is discussed how to create Modal windows using Twitter Bootstrap with several examples and explanations.">
<link
	href="/../twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/bootstrap/css/plantilla.css" />
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="/reg_HistoriaUsuario.jsp">SCRUM-SCORP</a>
				<div class="nav-collapse">
					<ul class="nav">
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	

	<div class=span4></div>
	<%@ page import="java.util.List"%>
	<%@ page import="scrum.scorp.model.entity.HistoriaUsuario"%>
	<%@ page import="scrum.scorp.model.entity.Proyecto"%>
	<%@	page import="scrum.scorp.model.PMF"%>
	<%@ page import="scrum.scorp.model.jdo.JDO"%>
	<%@ page import="javax.jdo.Query"%>
	<%
	PersistenceManager pm = PMF.get().getPersistenceManager();
	Query query = pm.newQuery(Proyecto.class);
	query.setFilter("nombre == proyecto_param");
	
	query.declareParameters("String proyecto_param");
	HttpSession sesion = request.getSession();
	String proy = (String) sesion.getAttribute("trabajo");
	List<Proyecto> resultado =(List<Proyecto>) query.execute(proy);
	Proyecto proyecto = null;
	if(!resultado.isEmpty()){
		for(Proyecto p : resultado){
			proyecto = p;
		}
	}
	
	
	%>
	
	<div class="table-responsive">
		<table class="table table-condensed table-hover table-striped">
			<tr>
				<td colspan="5" style="text-align: center">EQUIPO DE TRABAJO</td>
			</tr>
			<tr>
				<td style="text-align: center">NOMBRE</td>
				<td style="text-align: center">ROL</td>
				
			</tr>
			<%
				String scrumMaster="Scrum-Master";
				String producOwner="productOwner";
				String team="team";
				
				out.print("<tr>");
				out.print("<td style=\"text-align:center\" > <a >"+ proyecto.getScrumMaster() + "</a></td>");
				out.print("<td style=\"text-align:center\" > <a >"+ scrumMaster + "</a></td>");
				out.print("</tr>");
				out.print("<tr>");
				out.print("<td style=\"text-align:center\" > <a >"+ proyecto.getProductOwner() + "</a></td>");
				out.print("<td style=\"text-align:center\" > <a >"+ producOwner + "</a></td>");
				out.print("</tr>");
				out.print("<tr>");
				out.print("<td style=\"text-align:center\" > <a >"+ proyecto.getTeam1() + "</a></td>");
				out.print("<td style=\"text-align:center\" > <a >"+ team + "</a></td>");
				out.print("</tr>");
				out.print("<tr>");
				out.print("<td style=\"text-align:center\" > <a >"+ proyecto.getTeam2() + "</a></td>");
				out.print("<td style=\"text-align:center\" > <a >"+ team + "</a></td>");
				out.print("</tr>");
				out.print("<tr>");
				out.print("<td style=\"text-align:center\" > <a >"+ proyecto.getTeam3() + "</a></td>");
				out.print("<td style=\"text-align:center\" > <a >"+ team + "</a></td>");
				out.print("</tr>");
				out.print("<tr>");
				out.print("<td style=\"text-align:center\" > <a >"+ proyecto.getTeam4() + "</a></td>");
				out.print("<td style=\"text-align:center\" > <a >"+ team + "</a></td>");
				
				out.print("</tr>");
				
			
			
			
			
			
			
			%>
			
	</table>
	</div>
	
	
		


	<div class=span4></div>

	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
	<script
		src="/twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/js/jquery.js"></script>
	<script
		src="/twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/js/bootstrap-modal.js"></script>
	<script
		src="/../twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/js/bootstrap-dropdown.js"></script>
	<script
		src="/../twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/js/bootstrap-tab.js"></script>

	


</body>

</html>