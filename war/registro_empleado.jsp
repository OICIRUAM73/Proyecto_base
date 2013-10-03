<%@ page import="java.util.List"%>
<%@ page import="ingenio.ds.gae.model.entity.Departamento"%>
<%@ page import="ingenio.ds.gae.model.jdo.JDO"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%
  BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
  String url="";
  url=((String)application.getAttribute("CONTROLLER"))+"/Agregar/Empleado";
  url=blobstoreService.createUploadUrl(url);
%>
<form action="<%=url%>" method="post" enctype="multipart/form-data">

	<table id="registro" width="110" border="0" cellspacing="0" cellpadding="5">
		<tr align="center">
			<td colspan="2" align="center">DATOS EMPLEADO</td>
		</tr>
		<tr>
			<td>Nombre</td>
			<td><input name="nombre" type="text" value=""> </td>
		</tr>
		<tr>
			<td>Apellido</td>
			<td><input name="apellido" type="text" value=""></td>
		</tr>
		<tr>
			<td>Identificacion</td>
			<td><input name="identificacion" type="text" value=""></td>
		</tr>
		<tr>
			<td>Fecha de nacimiento</td>
    		<td><input name="fdn" type="text" value="dd/MM/yyyy"></td>
  		</tr>
  		<tr>
    		<td valign="top">Departamento</td>
    		<td> 
				<select name="departamento">
				<%
				JDO<Departamento> jdo=JDO.getInstance(Departamento.class);
				List<Departamento> lista_departamento=jdo.findAll();
				for(int i=0;i<lista_departamento.size();i++){
					Departamento departamento=lista_departamento.get(i);
					out.print("<option value='"+departamento.getId()+"'>"+departamento.getNombre()+"</option>");
				}%>
				</select>
	    	</td>
  		</tr>
  		<tr>
    		<td>Sueldo</td>
    		<td><input name="sueldo" type="text" value="00000"></td>
  		</tr>
  		<tr>
    		<td>Auxilio de transporte</td>
    		<td><input name="transporte" type="text" value="000"></td>
  		</tr>
  		<tr>
    		<td>Foto</td>
    		<td><input name="foto" type="file"></td>
  		</tr>
  		<tr align="center">
    		<td colspan="2" align="center"><input type="submit" value="Guargar"></td>
  		</tr>
	</table>
</form>
