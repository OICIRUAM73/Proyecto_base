<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
<form class="form-signin" action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/HistoriaUsuario"
		method="post" enctype="application/x-www-form-urlencoded">
        <div class="form-group">
              <input name="nombreH" type="text" placeholder="Nombre de Historia" class="form-control">
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit" value="GuardarH">Crear</button>
            </form>
</body>
</html>