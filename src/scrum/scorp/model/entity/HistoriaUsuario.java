package scrum.scorp.model.entity;

import java.io.Serializable;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import scrum.scorp.model.PMF;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class HistoriaUsuario implements Serializable,
		Comparable<HistoriaUsuario> {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key id;
	@Persistent
	private String nombre;
	@Persistent
	private String descripcion;
	@Persistent
	private String prioridad;
	@Persistent
	private String esfuerzo;
	@Persistent
	private Proyecto proyecto;

	public String getPrioridad() {
		return prioridad;
	}

	public void setPrioridad(String prioridad) {
		this.prioridad = prioridad;
	}

	public String getEsfuerzo() {
		return esfuerzo;
	}

	public void setEsfuerzo(String esfuerzo) {
		this.esfuerzo = esfuerzo;
	}

	public Proyecto getProyecto() {
		return proyecto;
	}

	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
	}

	public HistoriaUsuario() {
		super();
	}

	public Key getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public String getDescripcion() {
		return descripcion;
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

	public String toString() {
		return ("DATOS:::EMPLEADO:::...\n" + "NOMBRE         : " + nombre
				+ "\n" + "APELLIDO       : " + descripcion + "\n" + "");
	}

	public int compareTo(HistoriaUsuario HU) {
		return descripcion.compareTo(HU.getDescripcion());
	}

	public List<HistoriaUsuario> listar_historias(String proyecto_actual) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery(Proyecto.class);
		query.setFilter("nombre == proyecto_param");
		query.declareParameters("String proyecto_param");
		@SuppressWarnings("unchecked")
		List<Proyecto> resultado = (List<Proyecto>) query.execute(proyecto_actual);
		Proyecto proyecto = null;
		if (!resultado.isEmpty()) {
			for (Proyecto p : resultado) {
				proyecto = p;
			}
		}
		List<HistoriaUsuario> lista_historias = proyecto.getHistoriasUsuario();
		return lista_historias;
	}
}