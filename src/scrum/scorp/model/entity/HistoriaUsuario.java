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

