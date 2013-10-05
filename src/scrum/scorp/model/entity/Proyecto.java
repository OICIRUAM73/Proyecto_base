package scrum.scorp.model.entity;
import java.io.Serializable;

import javax.jdo.annotations.Column;
import javax.jdo.annotations.Embedded;
import javax.jdo.annotations.EmbeddedOnly;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable (identityType=IdentityType.APPLICATION)
public class Proyecto implements Serializable,Comparable<Proyecto>{
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	@Persistent(valueStrategy=IdGeneratorStrategy.SEQUENCE)
	private Long id;
	@Persistent
	private String nombre;
	public Proyecto(){
		 super();
	}

	public Long getId(){ 
		return id;
	}
	public Key getKey(){ 
		return key;
	}
	public String getNombre(){ 
		return nombre;
	}

	public void setKey(Key key){ 
		this.key=key;
	}
	public void setId(Long id ){ 
		 this.id=id;
	}
	public void setNombre(String nombre ){ 
		 this.nombre=nombre;
	}
	

	public String toString(){ 
		return(
		"DATOS:::PROYECTO:::...\n"+
		"ID             : "+id+"\n"+
		"NOMBRE         : "+nombre+"\n"+
		"");
	}

	public int compareTo(Proyecto proyecto){
		return nombre.compareTo(proyecto.getNombre());
	}
	
	
	
}
