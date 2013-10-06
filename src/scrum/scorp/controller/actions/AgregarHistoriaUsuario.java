package scrum.scorp.controller.actions;

import java.io.IOException;
import java.io.Serializable;
<<<<<<< HEAD

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
=======
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
>>>>>>> mauricio

import scrum.scorp.model.PMF;
import scrum.scorp.model.entity.HistoriaUsuario;
import scrum.scorp.model.entity.Proyecto;
import scrum.scorp.model.jdo.JDO;
import scrum.scorp.controller.actions.CrearProyecto;
public class AgregarHistoriaUsuario extends Action implements Serializable {

<<<<<<< HEAD
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
=======
	@SuppressWarnings("unchecked")
	public void run() throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			HistoriaUsuario hu = new HistoriaUsuario();
			hu.setNombre(request.getParameter("nombre"));
			
			hu.setDescripcion(request.getParameter("descripcion"));
			Query query = pm.newQuery(Proyecto.class);
			query.setFilter("nombre == proyecto_param");
			
			query.declareParameters("String proyecto_param");
			HttpSession sesion = request.getSession();
			String proy = (String) sesion.getAttribute("trabajo");
			List<Proyecto> resultado =(List<Proyecto>) query.execute(proy);
			Proyecto proyecto = null;
			if(!resultado.isEmpty()){
				for(Proyecto p : resultado){
					proyecto = p;
				}
			}
			proyecto.getHistoriasUsuario().add(hu);
			
			try {
				pm.makePersistent(hu);
				pm.makePersistent(proyecto);
			} finally {
				pm.close();
			}
			
			
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		RequestDispatcher rd = application.getRequestDispatcher("/HistoriaUsuario.jsp");
		if (rd == null) {
			throw new ServletException("pagina no encontrada");
		}
		rd.forward(request, response);

>>>>>>> mauricio
	}
	
	

}
