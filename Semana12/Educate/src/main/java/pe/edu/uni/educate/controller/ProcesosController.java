package pe.edu.uni.educate.controller;

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
public class ProcesosController {
	
	private ProcesosService procesosService;

	public ProcesosController() {
		procesosService = new ProcesosService();
	}
	
	
	public MatriculaDto matricular(MatriculaDto bean){
		return procesosService.matricular(bean);
	}

}
