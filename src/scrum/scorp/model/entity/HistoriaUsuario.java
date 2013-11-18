package scrum.scorp.model.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.jdo.annotations.Element;
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
	private String estado;
	@Persistent
	private int sprint;
	@Persistent
	private Set<String> sprints;
	
	public Set<String> getSprints() {
		return sprints;
	}

	public void setSprints(Set<String> sprints) {
		this.sprints = sprints;
	}

	public int getSprint() {
		return sprint;
	}

	public void setSprint(int sprint) {
		this.sprint = sprint;
	}

	@Persistent
	private Proyecto proyecto;
	@Persistent(mappedBy = "historia")
	@Element(dependent = "true")
	private List<Tarea> tarea = new ArrayList<Tarea>();
	@Persistent(mappedBy = "historia")
	@Element(dependent = "true")
	private List<CriterioAceptacion> criterio = new ArrayList<CriterioAceptacion>();

	public List<CriterioAceptacion> getCriterio() {
		return criterio;
	}

	public void setCriterio(List<CriterioAceptacion> criterio) {
		this.criterio = criterio;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public List<Tarea> getTarea() {
		return tarea;
	}

	public void setTarea(List<Tarea> tarea) {
		this.tarea = tarea;
	}

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
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + sprint;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HistoriaUsuario other = (HistoriaUsuario) obj;
		if (sprint != other.sprint)
			return false;
		return true;
	}

	public int compareTo(HistoriaUsuario HU) {
		return HU.sprint-this.sprint;
	}
	
	

	public List<HistoriaUsuario> listar_historias(String proyecto_actual) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery(Proyecto.class);
		query.setFilter("nombre == proyecto_param");
		query.declareParameters("String proyecto_param");
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