package pe.edu.uni.educate.prueba;

import pe.edu.uni.educate.service.ConsultaService;

public class Prueba02 {

	public static void main(String[] args) {
		try {
			// Dato
			int idCurso = 11;
			// Proceso
			ConsultaService consultaService = new ConsultaService();
			boolean existe = consultaService.existeCurso(idCurso);
			// Reporte
			System.out.println("Exite curso? " + existe);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		
	
}
