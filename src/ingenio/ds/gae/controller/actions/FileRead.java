package ingenio.ds.gae.controller.actions;
//clases para el tratamiento de blobs
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService; 
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
//posibles excepciones
import javax.servlet.ServletException;
import java.io.IOException;

public class FileRead extends Action {
  
  public void run()throws ServletException, IOException {
    try {
    	BlobstoreService blobstoreService= BlobstoreServiceFactory.getBlobstoreService();
    	BlobKey blobKey= (BlobKey)request.getSession().getAttribute("blobKey");
    	if(blobKey==null){
    		String _blobKey=request.getParameter("blob-key");
        	blobKey = new BlobKey(_blobKey);	
    	}
        blobstoreService.serve(blobKey, response);
    } catch (Exception ex) {
      throw new ServletException(ex);
    }
  }
}