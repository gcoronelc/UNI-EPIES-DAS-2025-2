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
public class PruebaMatricula08 {
	
	public static void main(String[] args) {
		try {
			// Datos
			MatriculaDto bean = new MatriculaDto();
			bean.setIdCurso(5);
			bean.setIdAlumno(6);
			bean.setIdEmpleado(3); 
			bean.setTipo("REGULAR");
			bean.setCuotas(3); 
			// Matricular
			ProcesosService procesosService = new ProcesosService();
			bean = procesosService.matricular(bean);
			System.out.println("Ok, bingo!!!");
			System.out.println("Precio: " + bean.getPrecio());
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
