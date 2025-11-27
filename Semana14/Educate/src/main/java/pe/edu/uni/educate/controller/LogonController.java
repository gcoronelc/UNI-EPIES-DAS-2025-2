package pe.edu.uni.educate.controller;

import pe.edu.uni.educate.dto.EmpleadoDto;
import pe.edu.uni.educate.service.LogonService;
import pe.edu.uni.educate.util.Session;

public class LogonController {

	public void validar(String usuario, String clave) {
		LogonService logonService = new LogonService();
		EmpleadoDto bean = logonService.validar(usuario, clave);
		Session.put("usuario", bean);
	}
	
}
