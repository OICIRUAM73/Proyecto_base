<%@ include file="WEB-INF/InitModel.jsp"%>

<html lang="en">
<head>
<meta charset="utf-8">
<title>SCRUM-SCORP</title>
<!--  <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css" />-->
<meta name="description"
	content="This an example of how you may use Twitter Bootstrap Modals in your webpage. Here in this tutorial it is discussed how to create Modal windows using Twitter Bootstrap with several examples and explanations.">
<link
	href="twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/css/bootstrap.css"
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

	<div class="container-fluid">
		<div class="accordion" id="accordion2">
			<%@ page import="java.util.List"%>
			<%@ page import="scrum.scorp.model.entity.HistoriaUsuario"%>
			<%@ page import="scrum.scorp.model.entity.Tarea"%>
			<%@ page import="scrum.scorp.model.entity.Proyecto"%>
			<%@ page import="scrum.scorp.model.jdo.JDO"%>
			<%
				HistoriaUsuario hu = new HistoriaUsuario();
				HttpSession sesion = request.getSession();
				String proy = (String) sesion.getAttribute("trabajo");
				List<HistoriaUsuario> lista_historias = hu.listar_historias(proy);
			%>
			<%
				for (int i = 0; i < lista_historias.size(); i++) {
					HistoriaUsuario historia = (HistoriaUsuario) lista_historias
							.get(i);
					out.print("<div class=\"accordion-group\">"
							+ "<div class=\"accordion-heading\">"
							+ "<a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion2\" href=\"#collapse"
							+ i
							+ "\">"
							+ historia.getNombre()
							+ "</a>"
							+ "</div>"
							+ "<div id=\"collapse"
							+ i
							+ "\" class=\"accordion-body collapse\" style=\"height: 0px; \">"
							+ "<div class=\"accordion-inner\">");
					List<Tarea> lista_Tareas = historia.getTarea();
					out.print("<div class=\"table-responsive\">"
							+ "<table class=\"table table-condensed table-hover table-striped\">"
							+ "<tr>"
							+ "<td colspan=\"5\" style=\"text-align: center\">LISTA DE TAREAS DE LA HISTORIA DE USUARIO:"
							+ historia.getNombre()
							+ " </td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td style=\"text-align: center\">ACTIVIDAD</td>"
							+ "<td style=\"text-align: center\">RESULTADO ESPERADO</td>"
							+ "</tr><tr>");
					for (int j = 0; j < lista_Tareas.size(); j++) {
						Tarea tarea = (Tarea) lista_Tareas.get(j);

						out.print("<td style=\"text-align: center\">"
								+ tarea.getActividad() + " </td>"
								+ "<td style=\"text-align: center\">"
								+ tarea.getResultado() + "</td></tr>");
					}
					out.print("</table></div>" + "</div>" + "</div>");
				}
			%>
		</div>
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
	<script
		src="/../twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/js/bootstrap-collapse.js"></script>
</body>

</html>
