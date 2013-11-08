package scrum.scorp.controller.actions;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import scrum.scorp.model.PMF;
import scrum.scorp.model.entity.CriterioAceptacion;
import scrum.scorp.model.entity.HistoriaUsuario;

@SuppressWarnings("serial")
public class AgregarCriterio extends Action implements Serializable {
	@SuppressWarnings("unchecked")
	public void run() throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			System.out.println("primero");
			CriterioAceptacion criterio = new CriterioAceptacion();
			criterio.setCriterio(request.getParameter("criterio"));
			Query query = pm.newQuery(HistoriaUsuario.class);
			query.setFilter("nombre == proyecto_param");
			query.declareParameters("String proyecto_param");
			List<HistoriaUsuario> resultado = (List<HistoriaUsuario>) query
					.execute(request.getParameter("historia1"));
			HistoriaUsuario historia_actual = null;
			System.out.println("seg");
			if (!resultado.isEmpty()) {
				for (HistoriaUsuario h : resultado) {
					historia_actual = h;
				}
			}
			System.out.println(historia_actual.getNombre());
			historia_actual.getCriterio().add(criterio);
			System.out.println("cuar");
			try {
				pm.makePersistent(historia_actual);
				pm.makePersistent(criterio);
			} finally {
				pm.close();
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}

		RequestDispatcher rd = application
				.getRequestDispatcher("/listar_ProductBacklog.jsp");
		if (rd == null) {
			throw new ServletException("pagina no encontrada");
		}
		rd.forward(request, response);

	}
}
