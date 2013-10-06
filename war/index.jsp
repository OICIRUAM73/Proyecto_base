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
    <ul class="nav">  
  <li class="active">  
    <a class="brand" href="index.jsp">SCRUM-SCORP</a>  
  </li>  
  </ul>
  </div>
  </div>
</div>  
<div class="container">  
<h2>BIENVENIDOS</h2>  
<div class="well"> 
<img src="https://si0.twimg.com/profile_images/2482198530/iql2hfa8kks5q78q4ag3.jpeg" alt="Obra de K. Haring"> 
</div>  
</div> 
<div class="container">

<div id="example" class="modal hide fade in" style="display: none; ">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>Ingrese nombre del proyecto</h3>
            </div>
            <div class="modal-body">
              
              <p>Aqui podras ingresar el nombre de proyecto que deseas realizar</p>		        
            </div>
            <div class="modal-footer">
             <div class="jumbotron">
      <form class="form-signin" action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/HistoriaUsuario"
		method="post" enctype="application/x-www-form-urlencoded">
        <div class="form-group">
              <input name="nombre" type="text" placeholder="Nombre de Proyecto" class="form-control">
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit" name="Guardar" value="crear">Crear</button>
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
 <button data-toggle="modal" href="#example" class="btn btn-primary btn-large" type="submit">Empezar un proyecto</button>
 </div>
 <div class=span4></div>
 </div>

<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
<script src="twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/js/jquery.js"></script>
<script src="twitter-bootstrap/twitter-bootstrap/twitter-bootstrap-v2/js/bootstrap-modal.js"></script>

</body>
</html>