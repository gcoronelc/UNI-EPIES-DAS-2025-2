package pe.edu.uni.educate.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.uni.educate.db.AccesoDB;
import pe.edu.uni.educate.dto.EmpleadoDto;

public class LogonService {

	public EmpleadoDto validar(String usuario, String clave) {
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		EmpleadoDto bean = null;
		String sql = """
               select emp_id id, emp_apellido apellido, 
               emp_nombre nombre, emp_direccion direccion, 
               emp_email email, emp_usuario usuario, '*****' clave 
               from EMPLEADO
               where emp_usuario=? and emp_clave=?
               """;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, usuario);
			pstm.setString(2, clave);
			rs = pstm.executeQuery();
			if (!rs.next()) {
				rs.close();
				pstm.close();
				throw new SQLException("Datos incorrectos.");
			}
			bean = new EmpleadoDto();
			bean.setId(rs.getInt("id"));
			bean.setApellido(rs.getString("apellido"));
			bean.setNombre(rs.getString("nombre"));
			bean.setDireccion(rs.getString("direccion"));
			bean.setEmail(rs.getString("email"));
			bean.setUsuario(rs.getString("usuario"));
			bean.setClave(rs.getString("clave"));
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el login, intente de nuevo.");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return bean;
	}
}
