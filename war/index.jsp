<%@ include file="WEB-INF/InitModel.jsp"%>
<%@page import="javax.jdo.PersistenceManager"%>
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
<script>
	function validateForm() {
		var x = document.forms["form"]["nombre"].value;

		if (x == null || x == "") {

			alert("Se deben rellenar todos los datos");

			return false;

		}

	}
</script>
</head>
<body>

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<ul class="nav">
					<li class="active"><a class="brand" href="index.jsp">SCRUM-SCORP</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<h2>BIENVENIDO</h2>
		<div class="well">
			<img src="scrum-scorp.jpg" alt="Obra de Ale">
		</div>
	</div>
	<div class="container">

		<div id="example" class="modal hide fade in" style="display: none;">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">x</a>
				<h3>Datos del proyecto</h3>
			</div>
			<div class="modal-body">

				<p>En estos campos se podran ingresar el nombre del proyecto y
					su correspondiente descripcion</p>
			</div>
			<div class="modal-footer">
				<div class="jumbotron">
					<form name="form" class="form-signin"
						onsubmit=" return validateForm()"
						action="<%=application.getAttribute("CONTROLLER").toString()%>/Crear/Proyecto"
						method="post" enctype="application/x-www-form-urlencoded">
						<div class="control-group">
							<div class="controls">
								<span class="label" style="text-align: left; font-size: small;">Nombre
									del Proyecto</span><br> <br>
								<textarea name="nombre" placeholder="Nombre de Proyecto"
									class="input-xlarge" required></textarea>
								<br> <br> <span class="label"
									style="text-align: left; font-size: small;">Descripcion
									del Proyecto</span><br> <br>
								<textarea name="descripcion"
									placeholder="Descripcion del Proyecto" class="input-xlarge"
									id="textarea" rows="3" required></textarea>
								<br> <br>
								<span class="label" style="text-align: left; font-size: small;">Fecha
									de inicio:</span> <br> <br> <input type="date"
									name="fInicio" class="form-control" required> <br>
								<br>
								<span class="label" style="text-align: left; font-size: small;">Fecha
									limite:</span> <br> <br> <input type="date" name="fFin"
									class="form-control" required>

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
	<div class="container">
		<div class=span4>
			<p></p>
			<p></p>
		</div>
		<div class=span>
			<button data-toggle="modal" href="#example"
				class="btn btn-primary btn-large" type="submit">Empezar un
				proyecto</button>
		</div>
		<div class=span12>
		
		</div>
	</div>

	<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
	<script
		src="twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/js/jquery.js"></script>
	<script
		src="twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/js/bootstrap-modal.js"></script>
	<script type="text/javascript"
		src="twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/js/bootstrap-dropdown.js"></script>

</body>
</html>