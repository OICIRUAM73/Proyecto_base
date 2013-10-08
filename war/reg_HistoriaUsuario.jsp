 <%@ include file="WEB-INF/InitModel.jsp"%>

<html lang="en" > 
<head> 
<meta charset="utf-8"> 
<title>SCRUM-SCORP</title> 
<!--  <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css" />-->
<meta name="description" content="This an example of how you may use Twitter Bootstrap Modals in your webpage. Here in this tutorial it is discussed how to create Modal windows using Twitter Bootstrap with several examples and explanations.">
<link href="/twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/css/bootstrap.css" rel="stylesheet"> 
<link rel="stylesheet" type="text/css" href="/bootstrap/css/plantilla.css" />
</head>
<body>
<div class="container">

<div id="example" class="modal hide fade in" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>Historia de usuario</h3>
            </div>
            <div class="modal-body">
              <form class="form-signin" action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/HistoriaUsuario">
              <div class="form-group">
  				<p><span class="label">Titulo</span></p> 
  				<input name="nombre" placeholder="Titulo" type="text" class="form-control"><br><br>
  				<p><span class="label">Descripcion</span></p> 
  				<input name="descripcion" placeholder="Decripcion" type="text" class="form-control" ><br><br>  
  				<p><span class="label">Prioridad</span></p>   
  				<input name="prioridad" type="text" placeholder="Prioridad" class="form-control"><br><br> 
  				<p><span class="label">Esfuerzo</span></p>  
  				<input name="esfuerzo" type="text" placeholder="Esfuerzo" class="form-control" ><br><br> 
  				</div>
  				<br> 				
  		<button class="btn btn-lg btn-primary btn-block" type="submit" value="Guardar">Crear</button> 
		</form>  

            </div>
          </div>

</div>
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
<li class="dropdown">
                        <a href="#example" class="dropdown-toggle" data-toggle="modal">HISTORIA DE USUARIO <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li><a href="#">Action</a></li>
                          <li><a href="#">Another action</a></li>
                          <li><a href="#">Something else here</a></li>
                          <li class="divider"></li>
                          <li class="dropdown-header">Dropdown header</li>
                          <li><a href="#">Separated link</a></li>
                          <li><a href="#">One more separated link</a></li>
                        </ul>
                      </li>
<li><a href="/listar_ProductBacklog.jsp">PRODUCT BACKLOG</a></li>
<li><a href="#contact"></a></li>
</ul>
</div><!--/.nav-collapse -->
</div>
</div>
</div>

<%-- <div class=span>
 <div id="example" class="well">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>Ingrese los datos de Historia de Usuario</h3>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
             <div class="jumbotron">
      <form class="form-signin" action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/HistoriaUsuario"
		method="post" enctype="application/x-www-form-urlencoded">
        <div class="form-group">
              <input name="nombre" type="text" placeholder="Nombre de historia" class="form-control">
              <input name="descripcion" type="text" placeholder="Descripcion" class="form-control">
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit" value="Guardar">Crear</button>
            </form>
    </div>
            </div>
          </div>
 </div> --%>
 <div class=span4></div>
 

<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
<script src="/twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/js/jquery.js"></script>
<script src="/twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/js/bootstrap-modal.js"></script>
</body>
</html>