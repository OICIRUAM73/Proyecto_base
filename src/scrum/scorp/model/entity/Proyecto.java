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

import java.util.ArrayList;
import java.util.List;

import javax.jdo.annotations.Element;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import org.datanucleus.jpa.annotations.Extension;

import com.google.appengine.api.datastore.Key;




@SuppressWarnings("serial")

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Proyecto implements Serializable, Comparable<Proyecto> {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key id;
	@Persistent
	private String nombre;
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

	public void setId(Key id) {
		this.id = id;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String toString() {
		return ("DATOS:::PROYECTO:::...\n" + "ID             : " + id + "\n"
				+ "NOMBRE         : " + nombre + "\n" + "");
	}

	public int compareTo(Proyecto proyecto) {
		return nombre.compareTo(proyecto.getNombre());

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
