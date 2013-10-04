package scrum.scorp.model.entity;
import java.io.Serializable;
import java.lang.Comparable;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.Blob;
import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable (identityType=IdentityType.APPLICATION)
public class Empleado implements Serializable,Comparable<Empleado>{

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	@Persistent(valueStrategy=IdGeneratorStrategy.SEQUENCE)
	private Long id;
	@Persistent
	private String nombre;
	@Persistent
	private String  apellido;
	@Persistent
	private Integer identificacion;
	@Persistent
	private Key departamento;
	@Persistent
	private Double sueldo;
	@Persistent
	private Double transporte;
	@Persistent
	private Date fdn;
	@Persistent
	private Blob foto;
	@Persistent
	private BlobKey fotoKey;

	public Empleado(){
		 super();
	}

	
	public Key getKey(){ 
		return key;
	}
	public Long getId(){ 
		return id;
	}
	public String getNombre(){ 
		return nombre;
	}
	public String  getApellido(){ 
		return apellido;
	}
	public Integer getIdentificacion(){ 
		return identificacion;
	}
	public Key getDepartamento(){ 
		return departamento;
	}
	public Double getSueldo(){ 
		return sueldo;
	}
	public Double getTransporte(){ 
		return transporte;
	}
	public Date getFdn(){ 
		return fdn;
	}
	public Blob getFoto(){ 
		return foto;
	}
	public void setKey(Key key){ 
		this.key=key;
	}
	public BlobKey getFotoKey(){ 
		return fotoKey;
	}

	public void setId(Long id ){ 
		 this.id=id;
	}
	public void setNombre(String nombre ){ 
		 this.nombre=nombre;
	}
	public void setApellido(String  apellido ){ 
		 this.apellido=apellido;
	}
	public void setIdentificacion(Integer identificacion ){ 
		 this.identificacion=identificacion;
	}
	public void setDepartamento(Key departamento ){ 
		 this.departamento=departamento;
	}
	public void setSueldo(Double sueldo ){ 
		 this.sueldo=sueldo;
	}
	public void setTransporte(Double transporte ){ 
		 this.transporte=transporte;
	}
	public void setFdn(Date fdn){ 
		 this.fdn=fdn;
	}
	
	public void setFoto(Blob foto){ 
		 this.foto=foto;
	}
	
	public void setFotoKey(BlobKey fotoKey){ 
		 this.fotoKey=fotoKey;
	}

	public String toString(){ 
		return(
		"DATOS:::EMPLEADO:::...\n"+
		"ID             : "+id+"\n"+
		"NOMBRE         : "+nombre+"\n"+
		"APELLIDO       : "+apellido+"\n"+
		"IDENTIFICACION : "+identificacion+"\n"+
		"DEPARTAMENTO   : "+departamento+"\n"+
		"SUELDO         : "+sueldo+"\n"+
		"TRANSPORTE     : "+transporte+"\n"+
		"FDN            : "+fdn+"\n"+
		"FOTO           : "+foto+"\n"+
		"");
	}

	public int compareTo(Empleado empleado){
		return apellido.compareTo(empleado.getApellido());
	}
}