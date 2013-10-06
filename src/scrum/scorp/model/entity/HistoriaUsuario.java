package scrum.scorp.model.entity;

import java.io.Serializable;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

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
