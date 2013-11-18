<%@page import="java.util.Collection"%>
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
<div class="container">

		<div id="prueba" class="modal hide fade in" style="display: none;">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">x</a>
				<span class="label label-success" id="lblprioridad"
					style="text-align: center; font-size: x-large;"></span>
			</div>
			<div class="modal-body">

				
			</div>
			<div class="modal-footer">
				<div class="jumbotron">
					<form name="form" class="form-signin"
						onsubmit=" return validateForm()"
						action="<%=application.getAttribute("CONTROLLER").toString()%>/Crear/Proyecto"
						method="post" enctype="application/x-www-form-urlencoded">
						<div class="control-group">
							<div class="controls">
							<br> <input id="historia" name="historia" type="hidden"
									class="form-control">
							 <input id="prioridad" name="prioridad" type="hidden"
									class="form-control">	
							<span class="label" style="text-align: left; font-size: small;">Prioriodad</span><br> <br>
								<textarea name="prior" placeholder="Prioridad"
									class="input-xlarge" required></textarea>

							</div>
						</div>
						<div class="row show-grid">
							<div class="span2" style="text-align: left">
								<button class="btn btn-large btn-primary" type="submit"
									value="Guardar">Crear</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@ page import="java.util.List"%>
	<%@ page import="scrum.scorp.model.entity.HistoriaUsuario"%>
	<%@ page import="scrum.scorp.model.entity.Proyecto"%>
	<%@	page import="scrum.scorp.model.PMF"%>
	<%@ page import="scrum.scorp.model.entity.Tarea"%>
	<%@ page import="scrum.scorp.model.entity.CriterioAceptacion"%>
	<%@ page import="scrum.scorp.model.jdo.JDO"%>
	<%@ page import= "java.util.Collections"%>
	<%
		HistoriaUsuario hu = new HistoriaUsuario();
		HttpSession sesion = request.getSession();
		String proy = (String) sesion.getAttribute("trabajo");
		List<HistoriaUsuario> lista_historias = hu.listar_historias(proy);
		
	
	%>
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
	<div id="example" class="modal hide fade in"
		style="display: none; height: 600px; width: 900px; margin-left: -450px;">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">x</a>
			<h1>
				<span class="label label-success" id="lblhistoria"
					style="text-align: center; font-size: x-large;"></span>
			</h1>

		</div>
		<div class="tabbable tabs-left">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#pane1" data-toggle="tab">Tareas</a></li>
				<li><a href="#pane2" data-toggle="tab">Criterios de
						Aceptaci&oacuten</a></li>
			</ul>
			<div class="tab-content">
				<!-- panel tareas -->
				<!-- panel tareas -->
				<div id="pane1" class="tab-pane active">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
							<h3 class="panel-title">Nueva Tarea</h3>
						</div>
						<div class="panel-body">
							<form name="form" class="form-horizontal"
								onsubmit=" return validateForm()"
								action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/Tarea">
								<br> <input id="historia" name="historia" type="hidden"
									class="form-control">
								<div class="form-group">
									<div class="row">
										<div class="span4">
											<h3>
												<label class="span3 label label-info"
													style="text-align: left; font-size: small;">ACTIVIDAD</label>
											</h3>
										</div>
										<div class="span3">
											<textarea name="actividad" placeholder="Actividad"
												id="actividad1" class="input-xlarge" rows="4" required></textarea>
										</div>
									</div>
								</div>
								<br> <br>
								<div class="form-group">
									<div class="row">
										<div class="span4">
											<h3>
												<label class="span3 label label-info"
													style="text-align: left; font-size: small;">RESULTADO
													ESPERADO</label>
											</h3>
										</div>
										<div class="span3">
											<textarea name="resultado" placeholder="Resultado esperado"
												class="input-xlarge" rows="4" required></textarea>
										</div>

									</div>
								</div>
								<br> <br>
								<div class="row show-grid">
									<div class="span8" style="text-align: center;">
										<button class="btn btn-large btn-inverse" type="submit"
											value="Guardar">Crear</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				<!-- panel criterios -->
				<!-- panel criterios -->
				<div id="pane2" class="tab-pane">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
							<h3 class="panel-title">Nuevo Criterio de Aceptacion</h3>
						</div>
						<div class="panel-body">
							<form name="form" class="form-horizontal"
								onsubmit=" return validateForm()"
								action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/Criterio">

								<input id="historia" name="historia" type="hidden"
									class="form-control"> <input id="historia1"
									name="historia1" type="hidden" class="form-control"> <br>
								<div class="form-group">
									<div class="row show-grid">
										<div class="span4">
											<h3>
												<label class="span3 label label-info"
													style="text-align: left; font-size: small;">CRITERIO
													DE ACEPTACION</label>
											</h3>
										</div>
										<div class="span5" style="text-align: left;">
											<textarea name="criterio"
												placeholder="Criterio de Aceptacion" class="input-xlarge"
												rows="5" required></textarea>
										</div>
									</div>
									<br> <br>
									<div class="row show-grid">
										<div class="span8" style="text-align: center;">
											<div id="my_div"></div>
											<button class="btn btn-large btn-inverse" type="submit"
												value="Guardar">Crear</button>
										</div>
									</div>

								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class=span4></div>

	<div class="table-responsive">
		<table class="table table-condensed table-hover table-striped">
			<tr>
				<td colspan="6" style="text-align: center">LISTA DE HISTORIAS
					DE USUARIO</td>
			</tr>
			<tr>
				<td style="text-align: center">NOMBRE</td>
				<td style="text-align: center">DESCRIPCION</td>
				<td style="text-align: center">PRIORIDAD</td>
				<td style="text-align: center">ESFUERZO</td>
				<td style="text-align: center">ESTADO</td>
				<td style="text-align: center">DETALLES</td>
				<td style="text-aling: center">SPRINT</td>
			</tr>


			<%
				String estadoA = "NO INICIADA";
				String estadoB = "EN PROGRESO";
				String estadoC = "FINALIZADA";
				String direccion = "#";
				String botonAct = "Actualizar";
				String reciniciar="0";

				if (lista_historias.size() == 0) {
					out.print("<script>alert(\"Product backlog esta vacio\")</script>");
				}

				if (lista_historias.size() == 0) {
					out.print("<script>alert(\"Product backlog esta vacio\")</script>");
				}

				for (int i = 0; i < lista_historias.size(); i++) {
					HistoriaUsuario historia = (HistoriaUsuario) lista_historias.get(i);
					
					
					
					
					out.print("<tr>");
					out.print("<td style=\"text-align:center\" onclick=\"tarea('"
							+ historia.getNombre()
							+ "');\"> <a href=\"#example\" data-toggle=\"modal\">"
							+ historia.getNombre() + "</a></td>");
					out.print("<td  style=\"text-align:center\">"
							+ historia.getDescripcion() + "</td>");
					out.print("<td style=\"text-align:center\" onclick=\"tarea1('"+ historia.getPrioridad()+ "','"+ historia.getNombre()+ "');\"> <a href=\"#prueba\" data-toggle=\"modal\">"
							+ historia.getPrioridad() + "</a></td>");
					out.print("<td style=\"text-align:center\" onclick=\"tarea1('"
							+ historia.getEsfuerzo()
							+ "');\"> <a href=\"#prueba\" data-toggle=\"modal\">"
							+ historia.getEsfuerzo() + "</a></td>");
					if (historia.getEstado().toString().equals("NO INICIADA")) {
						out.print("<td   style=\"text-align:center\" >"
								+ "<select id=\"selec1\"  name=\"combo1\" onchange=\"myFunction('"+ historia.getNombre() + "', this)\"  >"
								+ "<option  name= \"estado\" value ='"+ historia.getNombre() + "'>" + historia.getEstado()+ "</option>" 
								+ "<option  name= \"estado1\" value ="+ historia.getNombre() + ">" + estadoB+ "</option>" 
								+ "<option  name= \"estado2\" value ="+ historia.getNombre() + ">" + estadoC + "</option>" + "</select>" + "</td>");
						
					} else if (historia.getEstado().toString()
							.equals("EN PROGRESO")) {
						out.print("<td  style=\"text-align:center\">"
								+ "<select id=\"selec2\"  name=\"combo2\" onchange=\"myFunction('"+ historia.getNombre() + "',this)\"  >"
								+ "<option  name =\"estado12\" value ="+ historia.getNombre() + " >"+ historia.getEstado() + "</option>"
								+ "<option  name =\"estado13\"  value ="+ historia.getNombre() + ">" + estadoA+ "</option>"
								+ "<option  name =\"estado15\"  value ="+ historia.getNombre()+ ">" + estadoC+ "</option>" 
								+ "</select>" + "</td>");
						
					}

					else {
						out.print("<td  style=\"text-align:center\">"
								+ "<select id=\"selec3\"  name=\"combo3\" onchange=\"myFunction('"+ historia.getNombre() + "',this)\"  >"
								+ "<option  name =\"estado23\" value ="+ historia.getNombre() + " >"+ historia.getEstado() + "</option>"
								+ "<option  name =\"estado19\" value ="+ historia.getNombre() + " >" + estadoA+ "</option>" 
								+ "<option  name =\"estado29\" value ="+ historia.getNombre() + " >" + estadoB+ "</option>" 
								+ "</select>" + "</td>");
					}
					out.print("<td style=\"text-align:left\"> <form name=\"form\" class=\"form-horizontal\" onsubmit=\" return validateForm()\" action=\""
							+ application.getAttribute("CONTROLLER").toString()
							+ "/Listar/Tareas\"><input id=\"historia\" name=\"historia\" type=\"hidden\" value=\""
							+ historia.getNombre()
							+ "\"></input><button class=\"btn btn-small btn-info\""
							+ "value=\"Guardar\">Tareas: <span class=\"badge badge-info\">"
							+ historia.getTarea().size()
							+ "</span><br> Criterios de Aceptacion: <span class=\"badge badge-info\">"
							+ historia.getCriterio().size()
							+ "</span></button></form>" + "</td>");
					out.print("<td   style=\"text-align:center\" > <form id=\"SprintForm\" name=\"formSprint\" class=\"form-horizontal\" action=\""
							+application.getAttribute("CONTROLLER").toString()
							+ "/Actualizar/Sprint\">"
							+"</label><input style=\"height:38px;\" name=\"numero\" id=\"cambio\" type=\"number\" min="+ historia.getSprint() + " value="+ historia.getSprint() + " />"
							+"<br>"
							+"<button name=\"nombreHU\" value="+ historia.getNombre() + " class=\"btn btn-samll btn-info\" onclick=\"myFunction1('"+ historia.getNombre() + "',this.form.numero)\""
							+">Sprint</button>"
							+"<br>"
							+"</form>");
					out.print("</tr>");
					
					

				}
				
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

	<script>
	function myFunction(combo,hola)
	{	
		var cambio=hola.options[hola.selectedIndex].text;
		
		var valor=combo;
		
		
		
		location="<%=application.getAttribute("CONTROLLER").toString()%>/Actualizar/HistoriaUsuario?variable="+ valor + "&variable2=" + cambio + ""		
				}
	</script>
	
	<script>
		function tarea(sender) {
			document.getElementById("historia").value = sender;
			document.getElementById("historia1").value = sender;
			var val = document.getElementById('historia');
			var lab = document.getElementById("lblhistoria");
			lab.innerHTML = val.value;
			document.getElementById("historia1").value = sender;
			var val = document.getElementById('historia');
			var lab = document.getElementById("lblhistoria");
			lab.innerHTML = val.value;
		}
	</script>
	<script>
		function tarea1(sender) {
			document.getElementById("historia").value = sender;
			var historia=document.getElementById('historia');
			
			document.getElementById("prioridad").value = sender;
			var val = document.getElementById('prioridad');
			var label= "Prioridad:  ";
			
			var lab = document.getElementById("lblprioridad");
			lab.innerHTML = label.concat(val.value);
			
		}
	</script>
	
	
	
</body>

</html>
