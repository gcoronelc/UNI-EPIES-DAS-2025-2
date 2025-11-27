package pe.edu.uni.educate.prueba;

import pe.edu.uni.educate.dto.EmpleadoDto;
import pe.edu.uni.educate.service.LogonService;

public class Prueba04 {

	public static void main(String[] args) {
		try {
			// Datos
			String usuario = "ksanchez";
			String clave = "suerte";
			// Proceso
			LogonService logonService = new LogonService();
			EmpleadoDto bean = logonService.validar(usuario, clave);
			// Reporte
			System.out.println("Hola " + bean.getNombre());
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
	
}
