package pe.edu.uni.educate.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.uni.educate.db.AccesoDB;
import pe.edu.uni.educate.dto.ComboDto;

public class ComboService {


	public List<ComboDto> getCursoActivos(){
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		ComboDto bean;
		List<ComboDto> lista = new ArrayList<>();
		String sql = """
				select cur_id id, cur_nombre etiqueta 
				from curso 
				where cur_vacantes > cur_matriculados
               order by 2
               """;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				bean = rowMapper(rs);
				lista.add(bean);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el acceso a la BD.");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return lista;
	}

	
	public List<ComboDto> getAlumnosDisponibles(int idCurso){
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		ComboDto bean;
		List<ComboDto> lista = new ArrayList<>();
		String sql = """
				select alu_id id, alu_nombre etiqueta
				from alumno
				where alu_id not in 
				(select alu_id from matricula where cur_id=?)
				order by 2
               """;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, idCurso);
			rs = pstm.executeQuery();
			while (rs.next()) {
				bean = rowMapper(rs);
				lista.add(bean);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el acceso a la BD.");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return lista;
	}

	
	
	private ComboDto rowMapper(ResultSet rs) throws SQLException {
		ComboDto bean = new ComboDto();
		bean.setId(rs.getInt("id"));
		bean.setEtiqueta(rs.getString("etiqueta"));
		return bean;
	}

	
}
