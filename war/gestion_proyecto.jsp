<table width="100%" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td valign="top">
			<form
				action="<%=application.getAttribute("CONTROLLER").toString()%>/Crear/Proyecto"
				method="post" enctype="application/x-www-form-urlencoded">
				<table id="registro" width="110" border="0" cellspacing="0"
					cellpadding="5">
					<tr align="center">
						<td colspan="2" align="center">CREACI�N DE PROYECTO
					</tr>
					<tr>
						<td>NOMBRE</td>
						<td><input name="nombre" type="text"></td>
					</tr>
					<tr align="center">
						<td colspan="2" align="center"><input type="submit"
							value="Guardar"></td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>
