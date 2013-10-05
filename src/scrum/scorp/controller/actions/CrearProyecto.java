package scrum.scorp.controller.actions;

//clases para que acceda al modelo



//clases para el manejo de servlet
import java.io.IOException;
import java.io.Serializable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import scrum.scorp.model.entity.Proyecto;
import scrum.scorp.model.jdo.JDO;

public class CrearProyecto extends Action implements Serializable {
	
	@SuppressWarnings("unchecked")
	public void run()throws ServletException, IOException{
		try {
			Proyecto proyecto=new Proyecto();
			proyecto.setNombre(request.getParameter("nombre"));
			
			jdo= JDO.getInstance(Proyecto.class);
			jdo.insert(proyecto);
			
			//response.sendRedirect("/listar_departamento.jsp");
		}catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		RequestDispatcher rd=application.getRequestDispatcher("/index.jsp?pagina=gd");
		if(rd==null){
			throw new ServletException("pagina no encontrada");
		}
		rd.forward(request,response);
	}
	
} 