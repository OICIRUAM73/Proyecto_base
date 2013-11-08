package scrum.scorp.controller.actions;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import scrum.scorp.model.PMF;
import scrum.scorp.model.entity.Proyecto;

public class AgregarEquipo extends Action implements Serializable {

	@SuppressWarnings("unchecked")
	public void run() throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
		String nombreScrumMaster=request.getParameter("nameScrumMaster");
		String nombreProductOwner= request.getParameter("nameProductOwner");
		System.out.println(nombreScrumMaster +"  " +  nombreProductOwner);
		
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
		proyecto.setProductOwner(nombreProductOwner);
		proyecto.setScrumMaster(nombreScrumMaster);
		proyecto.setTeam1(request.getParameter("nameTeam1"));
		proyecto.setTeam2(request.getParameter("nameTeam2"));
		proyecto.setTeam3(request.getParameter("nameTeam3"));
		proyecto.setTeam4(request.getParameter("nameTeam4"));
		
		try {
			
			pm.makePersistent(proyecto);
		} finally {
			pm.close();
		}
		}
		catch(Exception e)
		{
			throw new ServletException(e.getMessage());
		}
		
		RequestDispatcher rd = application.getRequestDispatcher("/reg_HistoriaUsuario.jsp");
		if (rd == null) {
			throw new ServletException("pagina no encontrada");
		}
		rd.forward(request, response);
	}
	
	

}
