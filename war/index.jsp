<%@ include file="WEB-INF/InitModel.jsp"%>

<html>
<head>

<title>MVC on GAE</title>
<style type="text/css">
<%@ include file="estilo.css"%>
</style>
<!--En este ejercicio repasaremos por la gran mayoria de entradas de JSP-->
</head>

<body>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td colspan="2" valign="top" align="right">
				<div id="titulo" align="right">
					<!-- <img src="<%=application.getAttribute("ABSOLUTEURL")%>logo.png"
						width="282" height="95"> -->
				</div></td>
		</tr>
		<tr>
			
			 		<%@ include file="gestion_departamento.jsp"%>
		</tr>
	</table>
</body>
</html>
