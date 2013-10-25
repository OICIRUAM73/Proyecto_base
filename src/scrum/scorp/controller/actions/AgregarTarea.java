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
import scrum.scorp.model.entity.HistoriaUsuario;
import scrum.scorp.model.entity.Proyecto;
import scrum.scorp.model.entity.Tarea;

public class AgregarTarea extends Action implements Serializable {
	@SuppressWarnings("unchecked")
	public void run() throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			Tarea t = new Tarea();
			t.setActividad(request.getParameter("actividad"));
			t.setResultado(request.getParameter("resultado"));
			Query query = pm.newQuery(HistoriaUsuario.class);
			query.setFilter("nombre == proyecto_param");
			query.declareParameters("String proyecto_param");
			List<HistoriaUsuario> resultado = (List<HistoriaUsuario>) query
					.execute(request.getParameter("historia"));
			HistoriaUsuario historia_actual = null;
			System.out.println(resultado.size());
			if (!resultado.isEmpty()) {
				for (HistoriaUsuario h : resultado) {
					historia_actual = h;
				}
			}
			System.out.println("tares3");
			System.out.println(historia_actual.getNombre());
			historia_actual.getTarea().add(t);
			System.out.println("tares4");
			try {
				pm.makePersistent(historia_actual);
				pm.makePersistent(t);
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
