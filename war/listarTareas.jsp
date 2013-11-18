<%@ include file="WEB-INF/InitModel.jsp"%>

<html lang="en">
<head>
<meta charset="utf-8">
<title>SCRUM-SCORP</title>
<!--  <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css" />-->
<meta name="description"
	content="This an example of how you may use Twitter Bootstrap Modals in your webpage. Here in this tutorial it is discussed how to create Modal windows using Twitter Bootstrap with several examples and explanations.">
<link
	href="/twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/css/bootstrap.css"
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
		<%@ page import="java.util.List"%>
		<%@ page import="scrum.scorp.model.entity.HistoriaUsuario"%>
		<%@ page import="scrum.scorp.model.entity.Tarea"%>
		<%@ page import="scrum.scorp.model.entity.CriterioAceptacion"%>
		<%@ page import="scrum.scorp.model.entity.Proyecto"%>
		<%@ page import="scrum.scorp.model.jdo.JDO"%>
		<%
			HistoriaUsuario hu = new HistoriaUsuario();
			HttpSession sesion = request.getSession();
			String proy = (String) sesion.getAttribute("trabajo");
			List<HistoriaUsuario> lista_historias = hu.listar_historias(proy);
			String historia = (String) sesion.getAttribute("historia");
			HistoriaUsuario hist_actual = null;
			for (HistoriaUsuario h : lista_historias) {
				if (h.getNombre().equals(historia))
					hist_actual = h;
			}
			List<Tarea> lista_Tareas = hist_actual.getTarea();
			List<CriterioAceptacion> lista_criterios = hist_actual
					.getCriterio();
		%>
		<br> <br>
		<div class="row show-grid">
			<div class="span12" style="text-align: left;">
				<span class="label label-success" id="lblhistoria"
					style="text-align: center; font-size: x-large;"> <%
 	out.print(hist_actual.getNombre());
 %>
				</span>
			</div>
		</div>
		<br> <br>

		<div class="row show-grid" style="text-align: center;">
			<div class="span8 style=" text-align:center;">
				<table class="table table-hover">
					<caption align="top">
						<label class="span8 label label-important"
							style="text-align: center; font-size: large;"><strong>Tareas</strong></label>
							<br>
					</caption>
					<thead>
						<tr>
							<th style="text-align: center">#</th>
							<th style="text-align: center">Actividad</th>
							<th style="text-align: center">Resultado</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int j = 0; j < lista_Tareas.size(); j++) {
								Tarea tarea = (Tarea) lista_Tareas.get(j);
								out.print("<td style=\"text-align: center\">" + (j + 1)
										+ "</td><td style=\"text-align: center\">"
										+ tarea.getActividad() + " </td>"
										+ "<td style=\"text-align: center\">"
										+ tarea.getResultado() + "</td></tr>");
							}
							out.print("</table>");
						%>
					</tbody>
				</table>
			</div>
			<div class="span8" style="text-align: center;">
				<table class="table table-hover">
					<caption align="top"><label class="span8 label label-important"
							style="text-align: center; font-size: large;"><strong>Criterios de Aceptacion</strong></label>
							<br></caption>
					<thead>
						<tr>
							<th style="text-align: center">#</th>
							<th style="text-align: center">Criterio de Aceptacion</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int j = 0; j < lista_criterios.size(); j++) {
								CriterioAceptacion criterio = (CriterioAceptacion) lista_criterios
										.get(j);
								out.print("<td style=\"text-align: center\">" + (j + 1)
										+ "</td><td style=\"text-align: center\">"
										+ criterio.getCriterio() + " </td>" + "</tr>");
							}
							out.print("</table>");
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>


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
