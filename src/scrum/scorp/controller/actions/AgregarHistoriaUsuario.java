package scrum.scorp.controller.actions;

import java.io.IOException;
import java.io.Serializable;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;

import scrum.scorp.model.PMF;
import scrum.scorp.model.entity.HistoriaUsuario;
import scrum.scorp.model.entity.Proyecto;
import scrum.scorp.model.jdo.JDO;
import scrum.scorp.controller.actions.CrearProyecto;
public class AgregarHistoriaUsuario extends Action implements Serializable {

	@SuppressWarnings({ "unchecked", "static-access", "null" })
	public void run() throws ServletException, IOException {
		PersistenceManager pm =PMF.get().getPersistenceManager();
		try
		{
			Proyecto proyecto=null;

			
			HistoriaUsuario us = new HistoriaUsuario();
			us.setNombreH(request.getParameter("nombreH"));
			proyecto.getHistorias().add(us);
			try
			{
				pm.makePersistent(us);
				//pm.makePersistent(proyecto);
			}
			finally{
			pm.close();
			}
			//System.out.println(us);
			/*cr.proyecto.getHistorias().add(us);
			jdo= JDO.getInstance(CrearProyecto.class);
			jdo.insert(cr.proyecto);*/
			
			
			
		}
		catch(Exception e)
		{
			throw new ServletException(e.getMessage());
		}
		response.sendRedirect("/registro_HistoriaUsuario.jsp");
	}
	
	

}
