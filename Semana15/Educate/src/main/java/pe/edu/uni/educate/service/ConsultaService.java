package pe.edu.uni.educate.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.uni.educate.db.AccesoDB;

public class ConsultaService {

	public boolean existeCurso(int idCurso) {
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		boolean existe = false;
		String sql;
		try {
			// La conexion con la BD
			cn = AccesoDB.getConnection();
			// La consulta
			sql = "SELECT count(1) cant FROM CURSO WHERE CUR_ID=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, idCurso);
			rs = pstm.executeQuery();
			rs.next();
			int cant = rs.getInt("cant");
			rs.close();
			pstm.close();
			// Verificar la cantidad
			existe = (cant == 1);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en la consulta.");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		// Reporte
		return existe;
	}

	private boolean existeCurso(Connection cn, int idCurso) throws Exception{
		// Variables
		PreparedStatement pstm;
		ResultSet rs;
		boolean existe = false;
		String sql;
		// Proceso
		// La consulta
		sql = "SELECT count(1) cant FROM CURSO WHERE CUR_ID=?";
		pstm = cn.prepareStatement(sql);
		pstm.setInt(1, idCurso);
		rs = pstm.executeQuery();
		rs.next();
		int cant = rs.getInt("cant");
		rs.close();
		pstm.close();
		// Verificar la cantidad
		existe = (cant == 1);
		// Reporte
		return existe;
	}

	public double precioCurso(int idCurso) {
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		double precio;
		String sql;
		try {
			// La conexion con la BD
			cn = AccesoDB.getConnection();
			// Validar curso
			if(!existeCurso(cn, idCurso)){
				throw new SQLException("Curso no existe.");
			}
			// La consulta
			sql = "SELECT cur_precio precio FROM CURSO WHERE CUR_ID=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, idCurso);
			rs = pstm.executeQuery();
			rs.next();
			precio = rs.getDouble("precio");
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en la consulta.");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		// Reporte
		return precio;
	}

	
	
	
}
