<%@ page import="java.util.List"%>
<%@ page import="scrum.scorp.model.entity.Proyecto"%>
<%@ page import="scrum.scorp.model.jdo.JDO"%>
	<%
		JDO<Proyecto> jdo=JDO.getInstance(Proyecto.class);
		List<Proyecto> lista_departamento=jdo.findAll();
	%>
		<table border="1" cellspacing="0" cellpadding="5">
			<tr><td colspan="3" align="center" >LISTA DE PROYECTOS </td></tr>
			<tr><td calign="center" >ID</td><td calign="center" >NOMBRE</td></tr>
  				<%
  					for(int i=0;i<lista_departamento.size();i++){
  							Proyecto departamento=(Proyecto)lista_departamento.get(i);
  							out.print("<tr>");
  							out.print("<td>"+departamento.getId()+"</td>");
  							out.print("<td>"+departamento.getNombre()+"</td>");
  							out.print("</tr>");
  						}
  				%>
		</table>
	</body>
</html>
