<form action="<%=application.getAttribute("CONTROLLER").toString()%>/Agregar/Departamento" method="post" enctype="application/x-www-form-urlencoded">
	<table id="registro" width="110" border="0" cellspacing="0" cellpadding="5">
		<tr align="center">
			<td colspan="2" align="center">CREACIÓN DE PROYECTO
		</tr>
		<tr>
			<td>NOMBRE</td>
			<td><input name="nombre" type="text"> </td>
		</tr>
  		<tr align="center">
    		<td colspan="2" align="center"><input type="submit" value="Guardar"></td>
  		</tr>
	</table>
</form>
