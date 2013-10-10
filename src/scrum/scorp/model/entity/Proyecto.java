package scrum.scorp.model.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.annotations.Element;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Proyecto implements Serializable, Comparable<Proyecto> {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key id;
	@Persistent
	private String nombre;
	@Persistent
	private String descripcion;
	@Persistent
	private String fInicio;
	@Persistent
	private String fFin;
	@Persistent(mappedBy = "proyecto")
	@Element(dependent = "true")
	private List<HistoriaUsuario> historiasUsuario = new ArrayList<HistoriaUsuario>();

	public List<HistoriaUsuario> getHistoriasUsuario() {
		return historiasUsuario;
	}

	public void setHistoriasUsuario(List<HistoriaUsuario> historiasUsuario) {
		this.historiasUsuario = historiasUsuario;
	}

	public Proyecto() {
		super();
	}

	public Key getId() {
		return id;
	}

	

	public String getNombre() {
		return nombre;
	}
	
	public String getDescripcion()
	{
		return descripcion;
	}
	
	public String getFechaIncio()
	{
		return fInicio;
	}
	public String getFechaFin()
	{
		return fFin;
	}

	public void setId(Key id) {
		this.id = id;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public void setFInicio(String fInicio) {
		this.fInicio = fInicio;
	}
	
	public void setFFin(String fFin) {
		this.fFin = fFin;
	}
	public String toString() {
		return ("DATOS:::PROYECTO:::...\n" + "ID             : " + id + "\n"
				+ "NOMBRE         : " + nombre + "\n" + "");
	}

	public int compareTo(Proyecto proyecto) {
		return nombre.compareTo(proyecto.getNombre());
	}
}