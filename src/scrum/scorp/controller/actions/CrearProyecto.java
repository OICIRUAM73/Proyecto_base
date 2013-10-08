package scrum.scorp.controller.actions;

//clases para que acceda al modelo



//clases para el manejo de servlet
import java.io.IOException;
import java.io.Serializable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import scrum.scorp.model.entity.Proyecto;

public class CrearProyecto extends Action implements Serializable {
	
	@SuppressWarnings("unchecked")
	public void run()throws ServletException, IOException{
		try {
			Proyecto proyecto=new Proyecto();
			proyecto.setNombre(request.getParameter("nombre"));
			try {
				pm.makePersistent(proyecto);
				
				
			} finally {
				pm.close();
			}
			HttpSession sesion = request.getSession();
			sesion.setAttribute("trabajo", request.getParameter("nombre"));
		}catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		RequestDispatcher rd=application.getRequestDispatcher("/reg_HistoriaUsuario.jsp");
		if(rd==null){
			throw new ServletException("pagina no encontrada");
		}
		rd.forward(request,response);
	}
	
} 