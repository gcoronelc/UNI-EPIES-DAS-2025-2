package pe.edu.uni.educate.prueba;

import java.sql.Connection;
import pe.edu.uni.educate.db.AccesoDB;

public class Prueba01 {
	
	public static void main(String[] args) {
		try {
			Connection cn = AccesoDB.getConnection();
			System.out.println("Fino, ok.");
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
