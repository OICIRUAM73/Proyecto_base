package scrum.scorp.controller.actions;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import scrum.scorp.model.PMF;
import scrum.scorp.model.entity.HistoriaUsuario;

public class ActualizarHistoriaUsuario extends Action implements Serializable {

	@SuppressWarnings("unchecked")
	public void run() throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{	
			System.out.println("entro");
			
			//HistoriaUsuario hu = pm.getObjectById(HistoriaUsuario.class,request.getParameter("variable").toString());
			Query query = pm.newQuery(HistoriaUsuario.class);
			query.setFilter("nombre == proyecto_param");
			
			query.declareParameters("String proyecto_param");
			//HttpSession sesion = request.getSession();
			//String proy = (String) sesion.getAttribute("trabajo");
			List<HistoriaUsuario> resultado =(List<HistoriaUsuario>) query.execute(request.getParameter("variable"));
			HistoriaUsuario hu = null;
			if(!resultado.isEmpty()){
				for(HistoriaUsuario h : resultado){
					hu = h;
				}
			}
			hu.setEstado(request.getParameter("variable2"));
		}
		catch(Exception e)
		{
			throw new ServletException(e.getMessage());
		}
		finally
		{
			pm.close();
		}
		System.out.println("salio");
		RequestDispatcher rd = application.getRequestDispatcher("/listar_ProductBacklog.jsp");
		if (rd == null) {
			throw new ServletException("pagina no encontrada");
		}
		rd.forward(request, response);
		
		
		
	}
	
	

}
