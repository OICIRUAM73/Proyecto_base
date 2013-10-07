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
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  	<tr>
    	<td valign="top">
			<jsp:include page="reg_HistoriaUsuario.jsp"/>
		</td>
    	<td>
			<div style="height:650px; overflow:scroll;">
				<jsp:include page="listar_departamento.jsp"/>
			</div>
		</td>
  	</tr>
</table>

</body>
</html>