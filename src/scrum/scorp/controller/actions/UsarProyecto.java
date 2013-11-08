package scrum.scorp.controller.actions;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class UsarProyecto extends Action implements Serializable {
	public void run() throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		sesion.setAttribute("trabajo", request.getParameter("nombre"));
	}
}
