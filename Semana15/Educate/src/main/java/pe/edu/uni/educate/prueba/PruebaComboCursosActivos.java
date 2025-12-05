package pe.edu.uni.educate.prueba;

import java.util.List;
import pe.edu.uni.educate.dto.ComboDto;
import pe.edu.uni.educate.service.ComboService;

public class PruebaComboCursosActivos {

	public static void main(String[] args) {
		try {
			ComboService service = new ComboService();
			List<ComboDto> lista = service.getCursoActivos();
			for (ComboDto combo : lista) {
				System.out.println(combo.getId() + " - " + combo.getEtiqueta());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
