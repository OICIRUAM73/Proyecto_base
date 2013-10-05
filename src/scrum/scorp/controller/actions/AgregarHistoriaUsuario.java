package scrum.scorp.controller.actions;

import java.io.IOException;
import java.io.Serializable;
import java.rmi.server.ServerCloneException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.sql.rowset.serial.SerialException;

import scrum.scorp.model.entity.Empleado;
import scrum.scorp.model.entity.Proyecto;
import scrum.scorp.model.jdo.JDO;

public class AgregarHistoriaUsuario extends Action implements Serializable {
	
	@SuppressWarnings("unchecked")
	public void run() throws ServletException, IOException
	{
		try{
			
		}
		catch (Exception e)
		{
			throw new ServletException(e.getMessage());
		}
		RequestDispatcher rd=application.getRequestDispatcher("/HistoriaUsuario.jsp");
		if(rd==null){
			throw new ServletException("pagina no encontrada");
		}
		rd.forward(request,response);
		
	}

}
