package pe.edu.uni.educate.controller;

import pe.edu.uni.educate.service.ConsultaService;

public class ConsultaController {

	private ConsultaService consultaService;

	public ConsultaController() {
		consultaService = new ConsultaService();
	}

	public double precioCurso(int idCurso) {
		return consultaService.precioCurso(idCurso);
	}
	
}
