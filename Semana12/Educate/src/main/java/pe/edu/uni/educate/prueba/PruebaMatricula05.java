package pe.edu.uni.educate.prueba;

import pe.edu.uni.educate.dto.MatriculaDto;
import pe.edu.uni.educate.service.ProcesosService;

/**
 *
 * @author Eric Gustavo Coronel Castillo
 * @blog https://gcoronelc.blogspot.com/
 * @email gcoronelc@gmail.com
 * @youtube https://www.youtube.com/DesarrollaSoftware
 * @facebook https://www.facebook.com/groups/desarrollasoftware/
 * @cursos https://gcoronelc.github.io/
 */
public class PruebaMatricula05 {
	
	public static void main(String[] args) {
		try {
			// Datos
			MatriculaDto bean = new MatriculaDto();
			bean.setIdCurso(1);
			bean.setIdAlumno(8);
			bean.setIdEmpleado(3); 
			bean.setTipo("SUPERIOR"); // Tipo no existe
			// Matricular
			ProcesosService procesosService = new ProcesosService();
			procesosService.matricular(bean);
			System.out.println("Ok, bingo!!!");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
