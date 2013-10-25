<%@page import="javax.jdo.PersistenceManager"%>
<%@ include file="WEB-INF/InitModel.jsp"%>

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
	<div id="example" class="modal hide fade in" style="display: none;">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">x</a>
			<h3>Historia de Usuario</h3>
		</div>
		<div class="tabbable tabs-left">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#pane1" data-toggle="tab">Tareas</a></li>
				<li><a href="#pane2" data-toggle="tab">Criterios de
						Aceptaci&oacuten</a></li>
			</ul>
			<div class="tab-content">
				<div id="pane1" class="tab-pane active">
					<form name="form" class="form-signin"
						onsubmit=" return validateForm()"
						action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/Tarea">
						<div class="form-group">
							<button class="btn btn-lg btn-primary btn-success" type="Reset">Nueva
								Tarea</button>
						</div>
						<br>
						<div class="form-group">
							<input id="historia" type="hidden" name="historia"
								class="form-control"> <span class="label">Actividad</span><br>
							<br>
							<textarea name="actividad" placeholder="Actividad"
								class="input-xlarge" rows="3" required></textarea>
						</div>
						<div class="form-group">

							<span class="label">Resultado Esperado</span> <br> <br>
							<textarea name="resultado" placeholder="Resultado esperado"
								class="input-xlarge" rows="3" required></textarea>
							<br> <br>
						</div>
						<button class="btn btn-lg btn-primary" type="submit"
							value="Guardar">Crear</button>
					</form>
				</div>
				<div id="pane2" class="tab-pane">
					<h4>Pane 2 Content</h4>
					<p>and so on ...</p>
				</div>
			</div>
		</div>
	</div>

	<div class=span4></div>
	<%@ page import="java.util.List"%>
	<%@ page import="scrum.scorp.model.entity.HistoriaUsuario"%>
	<%@ page import="scrum.scorp.model.entity.Proyecto"%>
	<%@	page import="scrum.scorp.model.PMF"%>
	<%@ page import="scrum.scorp.model.jdo.JDO"%>
	<%
		HistoriaUsuario hu = new HistoriaUsuario();
		HttpSession sesion = request.getSession();
		String proy = (String) sesion.getAttribute("trabajo");
		List<HistoriaUsuario> lista_historias = hu.listar_historias(proy);
	%>
	<div class="table-responsive">
		<table class="table table-condensed table-hover table-striped">
			<tr>
				<td colspan="5" style="text-align: center">LISTA DE HISTORIAS
					DE USUARIO</td>
			</tr>
			<tr>
				<td style="text-align: center">NOMBRE</td>
				<td style="text-align: center">DESCRIPCION</td>
				<td style="text-align: center">PRIORIDAD</td>
				<td style="text-align: center">ESFUERZO</td>

				<td style="text-align: center">ESTADO</td>
			</tr>


			<%
				String estadoA = "NO INICIADA";
				String estadoB = "EN PROGRESO";
				String estadoC = "FINALIZADA";
				String direccion = "#";
				String botonAct = "Actualizar";

				for (int i = 0; i < lista_historias.size(); i++) {
					HistoriaUsuario historia = (HistoriaUsuario) lista_historias
							.get(i);

					out.print("<tr>");
					out.print("<td style=\"text-align:center\" onclick=\"tarea('"
							+ historia.getNombre()
							+ "');\"> <a href=\"#example\" data-toggle=\"modal\">"
							+ historia.getNombre() + "</a></td>");
					out.print("<td style=\"text-align:center\">"
							+ historia.getDescripcion() + "</td>");
					out.print("<td style=\"text-align:center\">"
							+ historia.getPrioridad() + "</td>");
					out.print("<td style=\"text-align:center\">"
							+ historia.getEsfuerzo() + "</td>");
					System.out.println(historia.getEstado());
					if (historia.getEstado().toString().equals("NO INICIADA")) {
						out.print("<td style=\"text-align:center\" >"
								+ "<select name=\"combo\" onchange=\"myFunction(this)\"  >"
								+ "<option name= \"estado\" value ='"
								+ historia.getNombre() + "'>" + historia.getEstado()
								+ "</option>" + "<option name= \"estado1\" value ="
								+ historia.getNombre() + ">" + estadoB
								+ "</option>" + "<option name= \"estado2\" value ="
								+ historia.getNombre() + ">" + estadoC
								+ "</option>" + "</select>" + "</td>");
					} else if (historia.getEstado().toString()
							.equals("EN PROGRESO")) {
						System.out.println("en progreso");
						out.print("<td style=\"text-align:center\">"
								+ "<select name=\"combo\" onchange=\"myFunction(this)\"  >"
								+ "<option name =\"estado12\" value ="
								+ historia.getNombre() + " >"
								+ historia.getEstado() + "</option>"
								+ "<option name =\"estado13\"  value ="
								+ historia.getNombre() + ">" + estadoA
								+ "</option>"
								+ "<option name =\"estado15\"  value ="
								+ historia.getNombre() + ">" + estadoC
								+ "</option>" + "</select>" + "</td>");
					}

					else {
						System.out.println("Finalizada");
						out.print("<td style=\"text-align:center\">"
								+ "<select name=\"combo\" onchange=\"myFunction(this)\"  >"
								+ "<option name =\"estado\" value ="
								+ historia.getNombre() + " >"
								+ historia.getEstado() + "</option>"
								+ "<option name =\"estado1\" value ="
								+ historia.getNombre() + " >" + estadoA
								+ "</option>" + "<option name =\"estado2\" value ="
								+ historia.getNombre() + " >" + estadoB
								+ "</option>" + "</select>" + "</td>");
					}

					out.print("</tr>");

				}
			%>
		</table>
		<form action="/listarTareas.jsp" method="post">
			<div style="text-align: center">
				<button class="btn btn-xs btn-warning">Listar Tareas</button>
			</div>
		</form>
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

	<script>
	function myFunction(combo)
	{	
		var valor=combo.value;
		alert("combo"+valor);
		var cambio=combo.options[combo.selectedIndex].text;
		location="<%=application.getAttribute("CONTROLLER").toString()%>/Actualizar/HistoriaUsuario?variable="+ valor + "&variable2=" + cambio + ""		
				}
	</script>
	<script>
		function tarea(sender) {
			document.getElementById("historia").value = sender;
		}
	</script>


</body>

</html>
