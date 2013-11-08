package scrum.scorp.controller.actions;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class ListarTareas extends Action implements Serializable {
	public void run() throws ServletException, IOException {
		try {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("historia", request.getParameter("historia"));

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		RequestDispatcher rd = application
				.getRequestDispatcher("/listarTareas.jsp");
		if (rd == null) {
			throw new ServletException("pagina no encontrada");
		}
		rd.forward(request, response);

	}
}
