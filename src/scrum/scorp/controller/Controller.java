package scrum.scorp.controller;

//clases con las cuales trabaja
import java.util.Map;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.jdo.PersistenceManager;
//clases para que sea servlet
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//posibles excepciones
import javax.servlet.ServletException;

import scrum.scorp.controller.actions.Action;
import scrum.scorp.model.PMF;

import java.io.IOException;

@SuppressWarnings("serial")
public class Controller extends HttpServlet {

	final PersistenceManager pm = PMF.get().getPersistenceManager();

	public void doGet(HttpServletRequest rq, HttpServletResponse rp)
			throws IOException, ServletException {
		ejecutar(rq, rp);
	}

	public void doPost(HttpServletRequest rq, HttpServletResponse rp)
			throws IOException, ServletException {
		ejecutar(rq, rp);
	}

	private void ejecutar(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Action> mapaAcciones = (Map<String, Action>) session
				.getAttribute("mapaAcciones");
		if (mapaAcciones == null) {
			mapaAcciones = new HashMap<String, Action>();
		}
		ServletContext context = getServletContext();
		try {
			String infoRuta = request.getPathInfo();
			if (infoRuta == null) {
				throw new ServletException("RUTA DESCONOCIDA");
			}
			Action accion = (Action) mapaAcciones.get(infoRuta);
			if (accion == null) {
				StringTokenizer st = new StringTokenizer(infoRuta, "/");
				if (st.countTokens() != 2) {
					throw new ServletException(
							"estado interno invalido- no hay informacion de ruta["
									+ infoRuta + "]");
				}
				String evento = st.nextToken();
				String bean = st.nextToken();
				String servlet = "scrum.scorp.controller.actions." + evento
						+ bean;
				try {
					@SuppressWarnings("rawtypes")
					Class claseAccion = Class.forName(servlet);
					accion = (Action) claseAccion.newInstance();
					mapaAcciones.put(infoRuta, accion);
					session.setAttribute("mapaAcciones", mapaAcciones);
				} catch (ClassNotFoundException ex) {
					throw new ServletException("No se pudo cargar la clase "
							+ servlet + ": " + ex.getMessage());
				} catch (InstantiationException ex) {
					throw new ServletException(
							"No se pudo instanciar un objeto de la clase "
									+ servlet + ": " + ex.getMessage());
				} catch (IllegalAccessException ex) {
					throw new ServletException(servlet + ": " + ex.getMessage());
				}
			}
			System.out.println("aquiiii2");
			if (pm == null) {
				throw new ServletException(
						"MODELO DE CONEXION A BD NULO, IMPOSIBLE CONTINUAR CON LA OPERACION");
			}
			accion.setRequest(request);
			accion.setPersistenceManager(PMF.get().getPersistenceManager());
			accion.setResponse(response);
			accion.setApplication(context);
			accion.run();
		} catch (Exception e) {
			throw new ServletException("Error... \n" + e);
		}
	}

	public String getServletInfo() {
		return "CONTROLADOR DE ACCIONES Y REDIRECCIONAMIENTO (SIN MI NO HAY COMUNICACION ENTRE LO QUE VES Y LO QUE NO VES);";
	}
}