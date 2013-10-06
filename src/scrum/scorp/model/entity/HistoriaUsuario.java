package scrum.scorp.model.entity;
<<<<<<< HEAD

=======
>>>>>>> mauricio
import java.io.Serializable;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
<<<<<<< HEAD

import org.datanucleus.jpa.annotations.Extension;

import com.google.appengine.api.datastore.Key;

import scrum.scorp.controller.actions.CrearProyecto;

@PersistenceCapable(identityType=IdentityType.APPLICATION,detachable="true")
public class HistoriaUsuario implements Serializable  {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	//@Extension(vendorName="datanucleus", key="gae.encoded-pk", value="true")
	private Key id;
	
	@Persistent
	private Proyecto proyectoABC;
	@Persistent
	private String nombreH;
	
	public Key getId(){ 
		return id;
	}  
	public Proyecto getKey()
	{
		return proyectoABC;
	}
	public String getNombre(){ 
		return nombreH;
	}
	public void setId(Key id ){ 
		 this.id=id;
	}
	public void setNombreH(String nombreH ){ 
		 this.nombreH=nombreH;
	}
	
	
	
	public void setKey(Proyecto proyecto)
	{
		this.proyectoABC=proyecto;
	}
	
	

}
=======
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable (identityType=IdentityType.APPLICATION)
public class HistoriaUsuario implements Serializable,Comparable<HistoriaUsuario>{

	@PrimaryKey
	@Persistent(valueStrategy=IdGeneratorStrategy.IDENTITY)
	private Key id;
	@Persistent
	private String nombre;
	@Persistent
	private String  descripcion;
	@Persistent
	private Proyecto proyecto;


	public Proyecto getProyecto() {
		return proyecto;
	}



	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
	}



	public HistoriaUsuario(){
		 super();
	}

	

	public Key getId(){ 
		return id;
	}
	public String getNombre(){ 
		return nombre;
	}
	public String  getDescripcion(){ 
		return descripcion;
	}

	public void setId(Key id ){ 
		 this.id=id;
	}
	public void setNombre(String nombre ){ 
		 this.nombre=nombre;
	}
	public void setDescripcion(String  descripcion ){ 
		 this.descripcion=descripcion;
	}


	public String toString(){ 
		return(
		"DATOS:::EMPLEADO:::...\n"+
		"NOMBRE         : "+nombre+"\n"+
		"APELLIDO       : "+descripcion+"\n"+
		"");
	}

	public int compareTo(HistoriaUsuario HU){
		return descripcion.compareTo(HU.getDescripcion());
	}
}
>>>>>>> mauricio
