package ingenio.ds.gae.controller.actions;

//clases para acceder al modelo
import ingenio.ds.gae.model.entity.Departamento;
import ingenio.ds.gae.model.entity.Empleado;
import ingenio.ds.gae.model.jdo.JDO;
//calses para que sea servlet
import java.io.IOException;
import javax.servlet.ServletException;
//clases para almacenamiento de blobs
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

//clases para el tratamiento de los datos
import java.util.Map;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class AgregarEmpleado extends Action {
	
	private static final DateFormat formato_fecha = new SimpleDateFormat("dd/MM/yyyy");
	
	
	@SuppressWarnings("unchecked")
	public void run()throws ServletException, IOException{
		String dir="/index.jsp?pagina=ge";
		BlobstoreService blobstoreService= BlobstoreServiceFactory.getBlobstoreService();
    	Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(request);
    	
    	BlobKey blobKey = blobs.get("foto");
    	
		Empleado empleado=new Empleado();
		empleado.setNombre(request.getParameter("nombre"));
		empleado.setApellido(request.getParameter("apellido"));
		empleado.setIdentificacion(Integer.parseInt(request.getParameter("identificacion")));
		
		jdo= JDO.getInstance(Departamento.class);
		Departamento departamento=(Departamento)jdo.findOneByParameter("id", "Integer", Integer.parseInt(request.getParameter("departamento")));
		empleado.setDepartamento(departamento.getKey());
		empleado.setSueldo(Double.parseDouble(request.getParameter("sueldo")) );
		empleado.setTransporte(Double.parseDouble(request.getParameter("transporte")));
		try {
			empleado.setFdn(formato_fecha.parse(request.getParameter("fdn")));
		} catch (ParseException e) {e.printStackTrace();}
		empleado.setFotoKey(blobKey);
		dir+="&blob-key="+blobKey.getKeyString();
		jdo= JDO.getInstance(Empleado.class);
		jdo.insert(empleado);
		response.sendRedirect(dir);
	}
	
} 