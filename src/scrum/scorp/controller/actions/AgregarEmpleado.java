package scrum.scorp.controller.actions;

//clases para acceder al modelo


//calses para que sea servlet


import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;

import scrum.scorp.model.entity.Proyecto;
import scrum.scorp.model.entity.HistoriaUsuario;
import scrum.scorp.model.jdo.JDO;



//clases para almacenamiento de blobs
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;





//clases para el tratamiento de los datos
import java.util.Map;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class AgregarEmpleado extends Action implements Serializable {
	
	private static final DateFormat formato_fecha = new SimpleDateFormat("dd/MM/yyyy");
	
	@SuppressWarnings("unchecked")
	public void run()throws ServletException, IOException{
		String dir="/index.jsp?pagina=ge";
		BlobstoreService blobstoreService= BlobstoreServiceFactory.getBlobstoreService();
    	Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(request);
    	
    	BlobKey blobKey = blobs.get("foto");
    	
		HistoriaUsuario empleado=new HistoriaUsuario();
		empleado.setNombre(request.getParameter("nombre"));
		//empleado.setApellido(request.getParameter("apellido"));
		//empleado.setIdentificacion(Integer.parseInt(request.getParameter("identificacion")));
		
		jdo= JDO.getInstance(Proyecto.class);
		Proyecto departamento=(Proyecto)jdo.findOneByParameter("id", "Integer", Integer.parseInt(request.getParameter("departamento")));
		//empleado.setDepartamento(departamento.getKey());
		//empleado.setSueldo(Double.parseDouble(request.getParameter("sueldo")) );
		//empleado.setTransporte(Double.parseDouble(request.getParameter("transporte")));
		//try {
			//empleado.setFdn(formato_fecha.parse(request.getParameter("fdn")));
		//} catch (ParseException e) {e.printStackTrace();}
		//empleado.setFotoKey(blobKey);
		dir+="&blob-key="+blobKey.getKeyString();
		jdo= JDO.getInstance(HistoriaUsuario.class);
		jdo.insert(empleado);
		response.sendRedirect(dir);
	}
	
} 