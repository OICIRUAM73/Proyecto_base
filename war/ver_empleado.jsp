<%@ page import="java.util.List"%>
<%@ page import="scrum.scorp.model.entity.HistoriaUsuario"%>
<%@ page import="scrum.scorp.model.entity.Proyecto"%>
<%@ page import="scrum.scorp.model.jdo.JDO"%>
<%@ page import="java.util.Date"%>

<%
	JDO<Proyecto> jdo=JDO.getInstance(Proyecto.class);
HistoriaUsuario empleado=(HistoriaUsuario)session.getAttribute("empleado");
Proyecto departamento =jdo.findByKey(empleado.getDepartamento());
Date hoy=new Date();
int edad= (hoy.getYear()*365+hoy.getMonth()*30+hoy.getDate());
edad=edad-(empleado.getFdn().getYear()*365+empleado.getFdn().getMonth()*30+empleado.getFdn().getDate());
edad=edad/365;
%>
<td>
	<img  width="150" height="200" src="/servlet/File/Read?blob-key=<%=empleado.getFotoKey().getKeyString()  %>"/> <br/>
	<%=edad%>&nbsp;A&ntilde;os
</td>
<td>
	<table width="100%" border="0" cellspacing="0" cellpadding="1">
		<tr><td>ID</td><td><%=empleado.getId()%></td></tr>
		<tr>
  			<td>NOMBRE</td><td><%=empleado.getNombre()+" "+empleado.getApellido()%></td>
		</tr>
		<tr>
  			<td>IDENTIFICACION</td><td><%=empleado.getIdentificacion()%></td>
		</tr>
		<tr>
   			<td>DEPARTAMENTO</td><td><%=(""+departamento.getNombre() +"")%></td>
		</tr>
		<tr>
    		<td>SUELDO</td><td><%=empleado.getSueldo()%></td>
  		</tr>
		<tr>
    		<td>AUXILIO</td><td><%=empleado.getTransporte()%></td>
  		</tr>
		<tr>
    		<td>TOTAL DEVENGADO</td><td><%=empleado.getTransporte()+empleado.getSueldo()%></td>
  		</tr>
	</table>
</td>	