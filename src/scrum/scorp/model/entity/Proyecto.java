package scrum.scorp.model.entity;
import java.io.Serializable;
import java.lang.Comparable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.jdo.annotations.Column;
import javax.jdo.annotations.Element;
import javax.jdo.annotations.Embedded;
import javax.jdo.annotations.EmbeddedOnly;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import org.datanucleus.jpa.annotations.Extension;

import com.google.appengine.api.datastore.Key;




@SuppressWarnings("serial")
@PersistenceCapable (identityType=IdentityType.APPLICATION,detachable="true")
public class Proyecto implements Serializable{
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	//@Extension(vendorName="datanucleus", key="gae.encoded-pk", value="true")
	private Key key;
	@Persistent
	private String nombre;
	
	@Persistent(mappedBy= "proyectoABC")
	@Element(dependent="true")
	private List<HistoriaUsuario> usABC = new ArrayList<HistoriaUsuario>();
	
	public Proyecto(){
		 super();
	}

	
	public Key getKey(){ 
		return key;
	}
	public List getHistorias( )
	{
		return usABC;
	}
	public String getNombre(){ 
		return nombre;
	}

	public void setKey(Key key){ 
		this.key=key;
	}
	public void setNombre(String nombre ){ 
		 this.nombre=nombre;
	}
	
	
	
	
	
	public void setUsABC (List usABC)
	{
		this.usABC=usABC;
	}
	
	
	
	
	
	/*@PersistenceCapable
	@EmbeddedOnly
	public static class HistoriaUsuario2 {
		@Persistent
		private String nombreH;
		
		public String getNombreH()
		{
			return nombreH;
		}
		public void setNombreH(String nombreH)
		{
			this.nombreH="hola";
		}
	}*/
	
	/*@Persistent
    @Embedded(members = {
        @Persistent(name="nombreH", columns=@Column(name="nombreH")),
        
    })
	@Persistent
	@Embedded
	public HistoriaUsuario2 us21;*/
	
	
	
}
