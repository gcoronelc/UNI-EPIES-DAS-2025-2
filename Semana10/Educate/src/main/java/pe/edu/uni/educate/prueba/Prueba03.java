package pe.edu.uni.educate.prueba;

import pe.edu.uni.educate.service.ConsultaService;

public class Prueba03 {

	public static void main(String[] args) {
		try {
			// Dato
			int idCurso = 1;
			// Proceso
			ConsultaService consultaService = new ConsultaService();
			double precio = consultaService.precioCurso(idCurso);
			// Reporte
			System.out.println("IdCurso: " + idCurso);
			System.out.println("Precio: " + precio);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		
	
}
