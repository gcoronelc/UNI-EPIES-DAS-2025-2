package pe.edu.uni.educate.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import pe.edu.uni.educate.db.AccesoDB;
import pe.edu.uni.educate.dto.MatriculaDto;

/**
 *
 * @author Eric Gustavo Coronel Castillo
 * @blog https://gcoronelc.blogspot.com/
 * @email gcoronelc@gmail.com
 * @youtube https://www.youtube.com/DesarrollaSoftware
 * @facebook https://www.facebook.com/groups/desarrollasoftware/
 * @cursos https://gcoronelc.github.io/
 */
public class ProcesosService {

	public MatriculaDto matricular(MatriculaDto bean) {
		// Variables
		Connection cn = null;
		// Proceso
		try {
			// Inicia la Tx
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Validaciones
			validarCurso(cn, bean.getIdCurso());
			validarAlumno(cn, bean.getIdAlumno());
			validarMatricula(cn, bean.getIdCurso(), bean.getIdAlumno());
			validarEmpleado(cn, bean.getIdEmpleado());
			// Validar tipo
			bean.setTipo(bean.getTipo().toUpperCase());
			if (!"REGULAR;MEDIABECA;BECA".contains(bean.getTipo())) {
				throw new SQLException("Tipo de matricula incorrecto.");
			}
			// Validar cuotas
			if ("MEDIABECA;BECA".contains(bean.getTipo()) && bean.getCuotas() != 1) {
				throw new SQLException("La cantidad de cuotas es incorrecta.");
			}
			if (bean.getCuotas() < 1 || bean.getCuotas() > 3) {
				throw new SQLException("La cantidad de cuotas es incorrecta.");
			}
			// Determinar precio del curso
			double precio = obtenerPrecio(cn, bean.getIdCurso(), bean.getTipo());
			bean.setPrecio(precio);
			// Registrar la matricula
			System.out.println("Precio: " + bean.getPrecio());
			registrarMatricula(cn, bean);
			// Actualiza la tabla curso
			actualizarCurso(cn,bean.getIdCurso());
			// Confirmar Tx
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
				System.err.println("Transacción revertida debido a error: " + e.getMessage());
			} catch (SQLException ex) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			try {
				cn.rollback();
				System.err.println("Transacción revertida debido a error: " + e.getMessage());
			} catch (SQLException ex) {
			}
			throw new RuntimeException("Error en el proceso, intentelo nuevamente.");
		} finally {
			try {
				cn.close(); // Cierra la conexión
			} catch (Exception e) {
			}
		}
		// Reporte
		return bean;
	}

	private void validarCurso(Connection cn, int idCurso) throws SQLException {
		String sql = "select count(1) cont from curso where cur_id=?";
		PreparedStatement pstm = cn.prepareStatement(sql);
		pstm.setInt(1, idCurso);
		ResultSet rs = pstm.executeQuery();
		rs.next();
		int cont = rs.getInt("cont");
		rs.close();
		pstm.close();
		if (cont == 0) {
			throw new SQLDataException("Curso no existe.");
		}
	}

	private void validarAlumno(Connection cn, int idAlumno) throws SQLException {
		String sql = "select count(1) cont from alumno where alu_id=?";
		PreparedStatement pstm = cn.prepareStatement(sql);
		pstm.setInt(1, idAlumno);
		ResultSet rs = pstm.executeQuery();
		rs.next();
		int cont = rs.getInt("cont");
		rs.close();
		pstm.close();
		if (cont == 0) {
			throw new SQLDataException("Alumno no existe.");
		}
	}

	private void validarMatricula(Connection cn, int idCurso, int idAlumno) throws SQLException {
		String sql = "select count(1) cont from matricula where cur_id=? and alu_id=?";
		PreparedStatement pstm = cn.prepareStatement(sql);
		pstm.setInt(1, idCurso);
		pstm.setInt(2, idAlumno);
		ResultSet rs = pstm.executeQuery();
		rs.next();
		int cont = rs.getInt("cont");
		rs.close();
		pstm.close();
		if (cont == 1) {
			throw new SQLDataException("Matricula ya existe.");
		}
	}

	private void validarEmpleado(Connection cn, int idEmpleado) throws SQLException {
		String sql = "select count(1) cont from empleado where emp_id=?";
		PreparedStatement pstm = cn.prepareStatement(sql);
		pstm.setInt(1, idEmpleado);
		ResultSet rs = pstm.executeQuery();
		rs.next();
		int cont = rs.getInt("cont");
		rs.close();
		pstm.close();
		if (cont == 0) {
			throw new SQLDataException("Empleado no existe.");
		}
	}

	private double obtenerPrecio(Connection cn, int idCurso, String tipo) throws SQLException {
		// Obtener precio
		String sql = "select cur_precio from curso where cur_id=?";
		PreparedStatement pstm = cn.prepareStatement(sql);
		pstm.setInt(1, idCurso);
		ResultSet rs = pstm.executeQuery();
		rs.next();
		double precio = rs.getDouble("cur_precio");
		rs.close();
		pstm.close();
		// Aplicando descuentos
		precio = switch (tipo) {
			case "MEDIABECA" -> precio * 0.50;
			case "BECA" -> 	precio * 0.10;
			default -> precio;
		};
		// Reporte
		return precio;
	}

	private void registrarMatricula(Connection cn, MatriculaDto bean) throws SQLException {
		String sql = """
               insert into matricula(cur_id,alu_id,emp_id,mat_tipo,mat_fecha,mat_precio,mat_cuotas)
               values(?,?,?,?,GETDATE(),?,?)
               """;
		PreparedStatement pstm = cn.prepareStatement(sql);
		pstm.setInt(1, bean.getIdCurso());
		pstm.setInt(2, bean.getIdAlumno());
		pstm.setInt(3, bean.getIdEmpleado());
		pstm.setString(4, bean.getTipo());
		pstm.setDouble(5, bean.getPrecio());
		pstm.setInt(6, bean.getCuotas());
		pstm.executeUpdate();
		pstm.close();
	}

	private void actualizarCurso(Connection cn, int idCurso) throws SQLException {
		String sql = """
					update curso set cur_matriculados = cur_matriculados + 1
               where cur_id=? and cur_vacantes>cur_matriculados
               """;
		PreparedStatement pstm = cn.prepareStatement(sql);
		pstm.setInt(1, idCurso);
		pstm.executeUpdate();
		pstm.close();
	}

}
