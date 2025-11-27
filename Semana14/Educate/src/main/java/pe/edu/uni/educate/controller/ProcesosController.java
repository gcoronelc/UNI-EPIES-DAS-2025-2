package pe.edu.uni.educate.controller;

import java.util.List;
import pe.edu.uni.educate.dto.ComboDto;
import pe.edu.uni.educate.dto.MatriculaDto;
import pe.edu.uni.educate.service.ComboService;
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
	private ComboService comboService;

	public ProcesosController() {
		procesosService = new ProcesosService();
		comboService = new ComboService();
	}
	
	public MatriculaDto matricular(MatriculaDto bean){
		return procesosService.matricular(bean);
	}

	public List<ComboDto> getCursoActivos(){
		return comboService.getCursoActivos();
	}
	
	public List<ComboDto> getAlumnosDisponibles(int idCurso){
		return comboService.getAlumnosDisponibles(idCurso);
	}
}
