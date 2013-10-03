package ingenio.ds.gae.model;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

public final class PMF {
	// Variable encargada de controlar las peticiones
	private static final PersistenceManagerFactory instance = JDOHelper
			.getPersistenceManagerFactory("transactions-optional");

	// Para que no puedan instanciar la clase
	private PMF() {
	}

	// Retorna la instancia encargada de controlar las peticiones
	public static PersistenceManagerFactory get() {
		return instance;
	}
}