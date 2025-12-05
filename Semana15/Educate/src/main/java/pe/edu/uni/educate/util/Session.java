package pe.edu.uni.educate.util;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Eric Gustavo Coronel Castillo
 * @blog www.desarrollasoftware.com
 * @email gcoronelc@gmail.com
 * @youtube www.youtube.com/DesarrollaSoftware
 * @facebook www.facebook.com/groups/desarrollasoftware
 * @cursos gcoronelc.github.io
 */
public class Session {

	private static Map<String, Object> datos;

	static {
		datos = new HashMap<>();
	}

	private Session() {
	}

	/**
	 * Guarda un objeto en sesion.
	 * @param key Clave del objeto, para poder luego recuperar el objeto.
	 * @param object Objeto a guardar.
	 */
	public static void put(String key, Object object) {
		datos.put(key, object);
	}

	/**
	 * Permite recuperar un objeto de la sesion.
	 * @param key Clave para recuperar el objeto.
	 * @return 
	 */
	public static Object get(String key) {
		return datos.get(key);
	}

}
