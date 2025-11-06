package pe.edu.uni.educate.controller;

import pe.edu.uni.educate.service.LogonService;

public class LogonController {

	public void validar(String usuario, String clave) {
		LogonService logonService = new LogonService();
		logonService.validar(usuario, clave);
	}
	
}
