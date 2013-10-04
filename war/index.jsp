<%@ include file="WEB-INF/InitModel.jsp"%>

<html>
<head>
<title>SCRUM-SCORP</title>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/bootstrap/css/plantilla.css" />
<!--En este ejercicio repasaremos por la gran mayoria de entradas de JSP-->
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top">

    </div>
    <div class="jumbotron">
      <form class="form-signin" action="<%=application.getAttribute("CONTROLLER").toString()%>/Crear/Proyecto"
		method="post" enctype="application/x-www-form-urlencoded">
        <h2  align="center" class="form-signin-heading">Nuevo Proyecto</h2>
        <div class="form-group">
              <input name="nombre" type="text" placeholder="Nombre de Proyecto" class="form-control">
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit" value="Guardar">Crear</button>
            </form>
    </div>
    <div class="container">
    Hola ijijoijojiojojijuj9j9uj9uj9j9u9juh9u
      <hr>
      <footer>
        <p>&copy; Company 2013</p>
      </footer>
    </div> <!-- /container -->
</body>
</html>