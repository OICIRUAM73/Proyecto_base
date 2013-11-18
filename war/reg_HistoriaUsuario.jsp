
<%@ include file="WEB-INF/InitModel.jsp"%>
<!DOCTYPE html>
<html lang="es">
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
<script>
	function validateForm() {
		var x = document.forms["form"]["nombre"].value;
		var x1 = document.forms["form"]["descripcion"].value;

		if (x == null || x == "" || x1 == null || x1 == "") {
			alert("Se deben rellenar todos los datos");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">

		<div id="example" class="modal hide fade in" style="display: none;">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>Historia de usuario</h3>
			</div>
			<div class="modal-body">
				<form name="form" class="form-signin"
					onsubmit=" return validateForm()"
					action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/HistoriaUsuario">
					<div class="form-group">
						<p>
							<span class="label">Titulo</span>
						</p>
						<textarea name="nombre" placeholder="Titulo" class="input-xlarge"
							rows="2" required></textarea>
						<br>
						<p>
							<span class="label">Descripcion</span>
						</p>
						<textarea name="descripcion" placeholder="Decripcion" type="text"
							class="input-xlarge" rows="3" required></textarea>
						<br>
						<p>
							<span class="label">Prioridad</span>
						</p>
						<input name="prioridad" type="text" placeholder="Prioridad"
							class="form-control"><br> <br>
						<p>
							<span class="label">Esfuerzo</span>
						</p>
						<input name="esfuerzo" type="text" placeholder="Esfuerzo"
							class="form-control"><br> <br>
					</div>
					<br>
					<button class="btn btn-lg btn-primary btn-block" type="submit"
						value="Guardar">Crear</button>
				</form>

			</div>
		</div>
		<div id="example1" class="modal hide fade in" style="display: none;">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">X</a>
				<h3>Registrar Equipo</h3>
			</div>
			<div class="modal-body">
				<form name="form2" class="well"
					action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/Equipo">
					<div class="controls">
						<input type="text" name="nameScrumMaster">
								<select name="scrumMaster">
									<option value="scrum-master">Scrum Master</option>
								</select>
					</div>
					<div class="controls">
						<input type="text" name="nameProductOwner">
								<select name="productOwner">
									<option value="Product-Owner">Product Owner</option>
								</select>
					</div>
						
					<div id="insertar" class="control-group">
								<input type="button" value="Añadir otro team" onclick="addInput('insertar');">	
					</div>
					
					<input id="tele"  type="hidden" name="numero" value="0">
					
					
					<br>
					<button class="btn btn-lg btn-primary btn-block" type="submit"
						value="Guardar" onclick="envNumero(this)">Crear</button>
				</form>

			</div>
		</div>

	</div>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="/reg_HistoriaUsuario.jsp">SCRUM-SCORP</a>
				<div class="nav-collapse">
					<ul class="nav">
						<li class="dropdown" id="accountmenu"><a
							class="dropdown-toggle" data-toggle="dropdown" href="#">HISTORIA
								DE USUARIO<b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#example" data-toggle="modal">Crear
										Historia de Usuario</a></li>
								
							</ul></li>
						<li><a href="/listar_ProductBacklog.jsp">PRODUCT BACKLOG</a></li>
						<li><a href="/sprintBacklog.jsp">SPRINT BACKLOG</a>


					</ul>
					<ul class="nav pull-right">
						<li class=" dropdown" id="settingsmenu"><a
							class="dropdown-toggle" data-toggle="dropdown" href="#">Settings<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/../mostrarequipoTrabajo.jsp">Mostrar
										Equipo</a></li>
								<li><a href="#example1" data-toggle="modal">Registrar
										Equipo</a></li>


							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
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
		
	<script >
	var counter = 1;
	var limit = 25;
	var contador = 0;
	function addInput(divName)
	{
	    if (counter == limit)  
		{
	        alert("You have reached the limit of adding " + counter + " inputs");
	        
	    }
	    else 
		{
	        var newdiv = document.createElement('div');
	        newdiv.innerHTML = "<br><div class='controls'><input type='text' name='Nteam"+contador+"'><select name='team'><option value='team4'>Team</option></select></div>";
	        document.getElementById(divName).appendChild(newdiv);
	        counter++;
		contador++;
	    }
	document.getElementById("tele").value=contador;
	alert(document.getElementById("tele").value);
	
	}
	
	</script>

</body>
</html>