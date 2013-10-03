package ingenio.ds.gae.model.entity;
import java.io.Serializable;
import java.lang.Comparable;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable (identityType=IdentityType.APPLICATION)
public class Departamento implements Serializable,Comparable<Departamento>{
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	@Persistent(valueStrategy=IdGeneratorStrategy.SEQUENCE)
	private Long id;
	@Persistent
	private String nombre;
	public Departamento(){
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
		"DATOS:::DEPARTAMENTO:::...\n"+
		"ID             : "+id+"\n"+
		"NOMBRE         : "+nombre+"\n"+"\n"+
		"");
	}

	public int compareTo(Departamento departamento){
		return nombre.compareTo(departamento.getNombre());
	}
}