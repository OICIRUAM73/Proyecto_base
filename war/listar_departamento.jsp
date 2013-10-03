<%@ page import="java.util.List"%>
<%@ page import="ingenio.ds.gae.model.entity.Departamento"%>
<%@ page import="ingenio.ds.gae.model.jdo.JDO"%>
	<%
	JDO<Departamento> jdo=JDO.getInstance(Departamento.class);
	List<Departamento> lista_departamento=jdo.findAll();
	 %>
		<table border="1" cellspacing="0" cellpadding="5">
			<tr><td colspan="3" align="center" >LISTA DE DEPARTAMENTOS </td></tr>
			<tr><td calign="center" >ID</td><td calign="center" >NOMBRE</td><td calign="center" >DESCRIPCION</td></tr>
  				<%for(int i=0;i<lista_departamento.size();i++){
					Departamento departamento=(Departamento)lista_departamento.get(i);
					out.print("<tr>");
					out.print("<td>"+departamento.getId()+"</td>");
					out.print("<td>"+departamento.getNombre()+"</td>");
					out.print("</tr>");
				}%>
		</table>
	</body>
</html>
