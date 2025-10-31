-- =============================================
-- SCRIPT DE CARGA DE DATOS INICIALES
-- Sistema de Gestión de Gimnasio VidaFit
-- =============================================

USE GIMNASIODB;
GO

SET DATEFORMAT YMD;
GO

PRINT 'Iniciando carga de datos...';
GO

-- =============================================
-- 1. ROLES
-- =============================================
INSERT INTO dbo.Rol (NombreRol, Descripcion, Activo) VALUES
('Administrador', 'Acceso total al sistema', 1),
('Recepcionista', 'Registro de accesos y pagos', 1),
('Instructor', 'Consulta de clases e inscritos', 1);

PRINT 'Roles insertados: 3';
GO

-- =============================================
-- 2. USUARIOS
-- =============================================
INSERT INTO dbo.Usuario (NombreUsuario, Contrasena, Nombres, Apellidos, Email, IdRol, FechaCreacion, Activo) VALUES
('admin', 'admin123hash', 'Carlos', 'Mendoza', 'cmendoza@vidafit.com', 1, '20250101', 1),
('recep01', 'recep123hash', 'María', 'Torres', 'mtorres@vidafit.com', 2, '20250105', 1),
('recep02', 'recep123hash', 'José', 'Ramírez', 'jramirez@vidafit.com', 2, '20250105', 1),
('instr01', 'instr123hash', 'Ana', 'Flores', 'aflores@vidafit.com', 3, '20250110', 1),
('instr02', 'instr123hash', 'Pedro', 'Castillo', 'pcastillo@vidafit.com', 3, '20250110', 1);

PRINT 'Usuarios insertados: 5';
GO

-- =============================================
-- 3. TIPOS DE SUSCRIPCIÓN
-- =============================================
INSERT INTO dbo.TipoSuscripcion (Nombre, DuracionDias, Precio, Descripcion, Activo) VALUES
('Mensual', 30, 150.00, 'Membresía mensual con acceso completo', 1),
('Trimestral', 90, 400.00, 'Membresía trimestral con 10% descuento', 1),
('Semestral', 180, 750.00, 'Membresía semestral con 15% descuento', 1),
('Anual', 365, 1400.00, 'Membresía anual con 20% descuento', 1);

PRINT 'Tipos de suscripción insertados: 4';
GO

-- =============================================
-- 4. SOCIOS (30 socios)
-- =============================================
INSERT INTO dbo.Socio (NumeroCarnet, Nombres, Apellidos, TipoDocumento, NumeroDocumento, FechaNacimiento, Telefono, Email, Direccion, FechaRegistro, Activo) VALUES
('VF-2024-001', 'Juan', 'Pérez García', 'DNI', '72345601', '19900515', '987654321', 'juan.perez@email.com', 'Av. Los Olivos 123', '20240101', 1),
('VF-2024-002', 'María', 'López Sánchez', 'DNI', '71234502', '19920320', '987654322', 'maria.lopez@email.com', 'Jr. Las Flores 456', '20240115', 1),
('VF-2024-003', 'Carlos', 'Rodríguez Vega', 'DNI', '70123403', '19880710', '987654323', 'carlos.rodriguez@email.com', 'Av. Principal 789', '20240201', 1),
('VF-2024-004', 'Ana', 'Martínez Cruz', 'DNI', '73456704', '19950822', '987654324', 'ana.martinez@email.com', 'Calle Lima 321', '20240215', 1),
('VF-2024-005', 'Luis', 'García Torres', 'DNI', '72567805', '19910405', '987654325', 'luis.garcia@email.com', 'Av. Arequipa 654', '20240301', 1),
('VF-2024-006', 'Carmen', 'Fernández Díaz', 'DNI', '71678906', '19930912', '987654326', 'carmen.fernandez@email.com', 'Jr. Cusco 987', '20240315', 1),
('VF-2024-007', 'Roberto', 'Vargas Rojas', 'DNI', '70789007', '19870228', '987654327', 'roberto.vargas@email.com', 'Av. La Marina 147', '20240401', 1),
('VF-2024-008', 'Patricia', 'Ruiz Morales', 'DNI', '73890108', '19940618', '987654328', 'patricia.ruiz@email.com', 'Calle Sol 258', '20240415', 1),
('VF-2024-009', 'Jorge', 'Díaz Paredes', 'DNI', '72901209', '19920125', '987654329', 'jorge.diaz@email.com', 'Av. Benavides 369', '20240501', 1),
('VF-2024-010', 'Rosa', 'Herrera Campos', 'DNI', '71012310', '19960830', '987654330', 'rosa.herrera@email.com', 'Jr. Miraflores 741', '20240515', 1),
('VF-2024-011', 'Miguel', 'Castro Silva', 'DNI', '70123411', '19890414', '987654331', 'miguel.castro@email.com', 'Av. Javier Prado 852', '20240601', 1),
('VF-2024-012', 'Laura', 'Mendoza Ríos', 'DNI', '73234512', '19930707', '987654332', 'laura.mendoza@email.com', 'Calle Real 963', '20240615', 1),
('VF-2024-013', 'Fernando', 'Ramírez Luna', 'DNI', '72345613', '19910220', '987654333', 'fernando.ramirez@email.com', 'Av. Colonial 159', '20240701', 1),
('VF-2024-014', 'Sofía', 'Torres Pinto', 'DNI', '71456714', '19950505', '987654334', 'sofia.torres@email.com', 'Jr. Tacna 357', '20240715', 1),
('VF-2024-015', 'Diego', 'Flores Méndez', 'DNI', '70567815', '19880918', '987654335', 'diego.flores@email.com', 'Av. Universitaria 486', '20240801', 1),
('VF-2024-016', 'Valeria', 'Salazar Ortiz', 'DNI', '73678916', '19920603', '987654336', 'valeria.salazar@email.com', 'Calle Bolognesi 597', '20240815', 1),
('VF-2024-017', 'Andrés', 'Gutiérrez Vera', 'DNI', '72789017', '19940112', '987654337', 'andres.gutierrez@email.com', 'Av. Petit Thouars 708', '20240901', 1),
('VF-2024-018', 'Daniela', 'Paredes Núñez', 'DNI', '71890118', '19970428', '987654338', 'daniela.paredes@email.com', 'Jr. Camaná 819', '20240915', 1),
('VF-2024-019', 'Ricardo', 'Morales Quispe', 'DNI', '70901219', '19860815', '987654339', 'ricardo.morales@email.com', 'Av. Venezuela 920', '20241001', 1),
('VF-2024-020', 'Elena', 'Vega Coronado', 'DNI', '73012320', '19931201', '987654340', 'elena.vega@email.com', 'Calle Grau 135', '20241015', 1),
('VF-2024-021', 'Pablo', 'Chávez Romero', 'DNI', '72123421', '19900925', '987654341', 'pablo.chavez@email.com', 'Av. Larco 246', '20241020', 1),
('VF-2024-022', 'Gabriela', 'Ramos Soto', 'DNI', '71234522', '19920316', '987654342', 'gabriela.ramos@email.com', 'Jr. Unión 357', '20241025', 1),
('VF-2024-023', 'Javier', 'Cruz Aguilar', 'DNI', '70345623', '19880722', '987654343', 'javier.cruz@email.com', 'Av. Arenales 468', '20241028', 1),
('VF-2024-024', 'Natalia', 'Reyes Medina', 'DNI', '73456724', '19951008', '987654344', 'natalia.reyes@email.com', 'Calle Schell 579', '20241029', 1),
('VF-2024-025', 'Martín', 'Navarro Paz', 'DNI', '72567825', '19910522', '987654345', 'martin.navarro@email.com', 'Av. Angamos 680', '20241030', 1),
('VF-2025-026', 'Isabella', 'Campos Rojas', 'DNI', '71678926', '19940210', '987654346', 'isabella.campos@email.com', 'Jr. Ayacucho 791', '20250105', 1),
('VF-2025-027', 'Sebastián', 'Sánchez Prieto', 'DNI', '70789027', '19920630', '987654347', 'sebastian.sanchez@email.com', 'Av. Brasil 802', '20250210', 1),
('VF-2025-028', 'Camila', 'Jiménez Castro', 'DNI', '73890128', '19960418', '987654348', 'camila.jimenez@email.com', 'Calle Inca 913', '20250315', 1),
('VF-2025-029', 'Rodrigo', 'Valdez Huamán', 'DNI', '72901229', '19890804', '987654349', 'rodrigo.valdez@email.com', 'Av. Arequipa 1024', '20250420', 1),
('VF-2025-030', 'Lucía', 'Ríos Delgado', 'DNI', '71012330', '19931127', '987654350', 'lucia.rios@email.com', 'Jr. Puno 1135', '20250525', 1);

PRINT 'Socios insertados: 30';
GO

-- =============================================
-- 5. MEMBRESÍAS (Vigentes y No Vigentes)
-- =============================================
-- Membresías vencidas (10 socios)
INSERT INTO dbo.Membresia (IdSocio, IdTipoSuscripcion, FechaInicio, FechaVencimiento, EstadoMembresia, MontoTotal, FechaCreacion) VALUES
(1, 1, '20240101', '20240131', 'Vencida', 150.00, '20240101'),
(2, 1, '20240115', '20240214', 'Vencida', 150.00, '20240115'),
(3, 2, '20240201', '20240501', 'Vencida', 400.00, '20240201'),
(4, 1, '20240215', '20240316', 'Vencida', 150.00, '20240215'),
(5, 1, '20240301', '20240331', 'Vencida', 150.00, '20240301'),
(6, 2, '20240315', '20240613', 'Vencida', 400.00, '20240315'),
(7, 1, '20240401', '20240501', 'Vencida', 150.00, '20240401'),
(8, 3, '20240415', '20241012', 'Vencida', 750.00, '20240415'),
(9, 1, '20240501', '20240531', 'Vencida', 150.00, '20240501'),
(10, 1, '20240515', '20240614', 'Vencida', 150.00, '20240515');

-- Membresías activas (20 socios)
INSERT INTO dbo.Membresia (IdSocio, IdTipoSuscripcion, FechaInicio, FechaVencimiento, EstadoMembresia, MontoTotal, FechaCreacion) VALUES
(11, 3, '20240601', '20251128', 'Activa', 750.00, '20240601'),
(12, 2, '20240615', '20250913', 'Activa', 400.00, '20240615'),
(13, 4, '20240701', '20260630', 'Activa', 1400.00, '20240701'),
(14, 1, '20251001', '20251031', 'Activa', 150.00, '20251001'),
(15, 2, '20250801', '20251029', 'Activa', 400.00, '20250801'),
(16, 1, '20251001', '20251031', 'Activa', 150.00, '20251001'),
(17, 3, '20250901', '20260227', 'Activa', 750.00, '20250901'),
(18, 1, '20251001', '20251031', 'Activa', 150.00, '20251001'),
(19, 4, '20241001', '20250930', 'Vencida', 1400.00, '20241001'),
(20, 2, '20251015', '20260112', 'Activa', 400.00, '20251015'),
(21, 1, '20251020', '20251119', 'Activa', 150.00, '20251020'),
(22, 2, '20251025', '20260122', 'Activa', 400.00, '20251025'),
(23, 3, '20251028', '20260424', 'Activa', 750.00, '20251028'),
(24, 1, '20251029', '20251128', 'Activa', 150.00, '20251029'),
(25, 1, '20251030', '20251129', 'Activa', 150.00, '20251030'),
(26, 2, '20250105', '20250405', 'Vencida', 400.00, '20250105'),
(27, 1, '20251001', '20251031', 'Activa', 150.00, '20251001'),
(28, 3, '20250315', '20250911', 'Vencida', 750.00, '20250315'),
(29, 2, '20250420', '20250718', 'Vencida', 400.00, '20250420'),
(30, 1, '20251001', '20251031', 'Activa', 150.00, '20251001');

PRINT 'Membresías insertadas: 30';
GO

-- =============================================
-- 6. PAGOS
-- =============================================
INSERT INTO dbo.Pago (IdMembresia, IdSocio, MontoPagado, FechaPago, MetodoPago, NumeroRecibo, IdUsuarioRegistro, Observaciones) VALUES
(1, 1, 150.00, '20240101 10:30:00', 'Efectivo', 'REC-2024-001', 2, 'Pago inicial'),
(2, 2, 150.00, '20240115 11:15:00', 'Tarjeta', 'REC-2024-002', 2, 'Pago inicial'),
(3, 3, 400.00, '20240201 09:45:00', 'Transferencia', 'REC-2024-003', 2, 'Pago inicial trimestral'),
(4, 4, 150.00, '20240215 14:20:00', 'Efectivo', 'REC-2024-004', 3, 'Pago inicial'),
(5, 5, 150.00, '20240301 10:00:00', 'Yape', 'REC-2024-005', 2, 'Pago inicial'),
(6, 6, 400.00, '20240315 16:30:00', 'Tarjeta', 'REC-2024-006', 3, 'Pago inicial trimestral'),
(7, 7, 150.00, '20240401 11:45:00', 'Efectivo', 'REC-2024-007', 2, 'Pago inicial'),
(8, 8, 750.00, '20240415 13:10:00', 'Transferencia', 'REC-2024-008', 2, 'Pago inicial semestral'),
(9, 9, 150.00, '20240501 10:25:00', 'Plin', 'REC-2024-009', 3, 'Pago inicial'),
(10, 10, 150.00, '20240515 15:40:00', 'Efectivo', 'REC-2024-010', 2, 'Pago inicial'),
(11, 11, 750.00, '20240601 09:15:00', 'Tarjeta', 'REC-2024-011', 2, 'Pago inicial semestral'),
(12, 12, 400.00, '20240615 12:30:00', 'Transferencia', 'REC-2024-012', 3, 'Pago inicial trimestral'),
(13, 13, 1400.00, '20240701 10:50:00', 'Transferencia', 'REC-2024-013', 2, 'Pago inicial anual'),
(14, 14, 150.00, '20251001 11:20:00', 'Efectivo', 'REC-2025-014', 2, 'Renovación mensual'),
(15, 15, 400.00, '20250801 14:35:00', 'Tarjeta', 'REC-2025-015', 3, 'Renovación trimestral'),
(16, 16, 150.00, '20251001 09:40:00', 'Yape', 'REC-2025-016', 2, 'Renovación mensual'),
(17, 17, 750.00, '20250901 16:15:00', 'Transferencia', 'REC-2025-017', 2, 'Renovación semestral'),
(18, 18, 150.00, '20251001 10:55:00', 'Efectivo', 'REC-2025-018', 3, 'Renovación mensual'),
(19, 19, 1400.00, '20241001 13:25:00', 'Transferencia', 'REC-2024-019', 2, 'Pago inicial anual'),
(20, 20, 400.00, '20251015 11:45:00', 'Tarjeta', 'REC-2025-020', 2, 'Renovación trimestral'),
(21, 21, 150.00, '20251020 15:10:00', 'Efectivo', 'REC-2025-021', 3, 'Pago mensual'),
(22, 22, 400.00, '20251025 09:30:00', 'Plin', 'REC-2025-022', 2, 'Pago trimestral'),
(23, 23, 750.00, '20251028 14:20:00', 'Transferencia', 'REC-2025-023', 2, 'Pago semestral'),
(24, 24, 150.00, '20251029 10:45:00', 'Tarjeta', 'REC-2025-024', 3, 'Pago mensual'),
(25, 25, 150.00, '20251030 16:00:00', 'Efectivo', 'REC-2025-025', 2, 'Pago mensual'),
(26, 26, 400.00, '20250105 11:30:00', 'Tarjeta', 'REC-2025-026', 2, 'Pago inicial trimestral'),
(27, 27, 150.00, '20251001 13:15:00', 'Yape', 'REC-2025-027', 3, 'Renovación mensual'),
(28, 28, 750.00, '20250315 10:20:00', 'Transferencia', 'REC-2025-028', 2, 'Pago inicial semestral'),
(29, 29, 400.00, '20250420 15:50:00', 'Efectivo', 'REC-2025-029', 3, 'Pago inicial trimestral'),
(30, 30, 150.00, '20251001 09:25:00', 'Tarjeta', 'REC-2025-030', 2, 'Renovación mensual');

PRINT 'Pagos insertados: 30';
GO

-- =============================================
-- 7. INSTRUCTORES
-- =============================================
INSERT INTO dbo.Instructor (Nombres, Apellidos, Telefono, Email, Especialidad, FechaContratacion, Activo) VALUES
('Ana', 'Flores Quispe', '987123456', 'ana.flores@vidafit.com', 'Yoga y Pilates', '20240101', 1),
('Pedro', 'Castillo Ramos', '987123457', 'pedro.castillo@vidafit.com', 'Spinning y Cardio', '20240101', 1),
('Lucía', 'Morales Vega', '987123458', 'lucia.morales@vidafit.com', 'Zumba y Baile', '20240115', 1),
('Fernando', 'Silva Méndez', '987123459', 'fernando.silva@vidafit.com', 'CrossFit y Funcional', '20240201', 1),
('Carla', 'Núñez Torres', '987123460', 'carla.nunez@vidafit.com', 'Aeróbicos', '20240215', 1);

PRINT 'Instructores insertados: 5';
GO

-- =============================================
-- 8. TIPOS DE CLASE
-- =============================================
INSERT INTO dbo.TipoClase (Nombre, Descripcion, DuracionMinutos, Activo) VALUES
('Yoga', 'Clase de yoga para todos los niveles', 60, 1),
('Spinning', 'Clase de ciclismo indoor de alta intensidad', 45, 1),
('Zumba', 'Baile fitness con ritmos latinos', 50, 1),
('CrossFit', 'Entrenamiento funcional de alta intensidad', 60, 1),
('Pilates', 'Ejercicios de fortalecimiento y flexibilidad', 55, 1),
('Aeróbicos', 'Ejercicios cardiovasculares grupales', 45, 1);

PRINT 'Tipos de clase insertados: 6';
GO

-- =============================================
-- 9. CLASES PROGRAMADAS
-- =============================================
INSERT INTO dbo.Clase (IdTipoClase, IdInstructor, NombreClase, DiaSemana, HoraInicio, HoraFin, Sala, CupoMaximo, Activo) VALUES
(1, 1, 'Yoga Matutino', 'Lunes', '07:00', '08:00', 'Sala A', 15, 1),
(1, 1, 'Yoga Vespertino', 'Lunes', '18:00', '19:00', 'Sala A', 15, 1),
(2, 2, 'Spinning Intenso', 'Lunes', '19:00', '19:45', 'Sala B', 20, 1),
(3, 3, 'Zumba Fitness', 'Martes', '18:30', '19:20', 'Sala C', 25, 1),
(4, 4, 'CrossFit Avanzado', 'Martes', '06:00', '07:00', 'Sala D', 12, 1),
(5, 1, 'Pilates Básico', 'Miércoles', '07:30', '08:25', 'Sala A', 15, 1),
(2, 2, 'Spinning Matutino', 'Miércoles', '06:30', '07:15', 'Sala B', 20, 1),
(6, 5, 'Aeróbicos', 'Jueves', '18:00', '18:45', 'Sala C', 20, 1),
(1, 1, 'Yoga Relajación', 'Viernes', '19:00', '20:00', 'Sala A', 15, 1),
(3, 3, 'Zumba Party', 'Viernes', '20:00', '20:50', 'Sala C', 30, 1),
(4, 4, 'CrossFit Sábados', 'Sábado', '08:00', '09:00', 'Sala D', 12, 1),
(2, 2, 'Spinning Fin de Semana', 'Sábado', '09:00', '09:45', 'Sala B', 20, 1);

PRINT 'Clases programadas insertadas: 12';
GO

-- =============================================
-- 10. INSCRIPCIONES A CLASES
-- =============================================
-- Socios activos inscritos en clases
INSERT INTO dbo.InscripcionClase (IdClase, IdSocio, FechaInscripcion, EstadoInscripcion, IdUsuarioRegistro) VALUES
(1, 11, '20251020 10:00:00', 'Inscrito', 2),
(1, 12, '20251020 10:15:00', 'Inscrito', 2),
(1, 13, '20251020 11:30:00', 'Inscrito', 3),
(2, 14, '20251021 14:20:00', 'Inscrito', 2),
(2, 15, '20251021 15:10:00', 'Inscrito', 3),
(3, 16, '20251022 09:45:00', 'Inscrito', 2),
(3, 17, '20251022 10:20:00', 'Inscrito', 2),
(3, 18, '20251022 11:00:00', 'Inscrito', 3),
(4, 20, '20251023 13:30:00', 'Inscrito', 2),
(4, 21, '20251023 14:15:00', 'Inscrito', 3),
(5, 22, '20251024 08:00:00', 'Inscrito', 2),
(5, 23, '20251024 08:45:00', 'Inscrito', 2),
(6, 24, '20251025 16:30:00', 'Inscrito', 3),
(7, 25, '20251026 09:15:00', 'Inscrito', 2),
(8, 27, '20251027 12:40:00', 'Inscrito', 3),
(9, 30, '20251028 17:20:00', 'Inscrito', 2),
(10, 11, '20251028 18:00:00', 'Inscrito', 2),
(11, 13, '20251029 10:30:00', 'Inscrito', 3),
(12, 14, '20251029 11:45:00', 'Inscrito', 2);

PRINT 'Inscripciones a clases insertadas: 19';
GO

-- =============================================
-- 11. REGISTROS DE ACCESO
-- =============================================
-- Accesos recientes de socios activos
INSERT INTO dbo.RegistroAcceso (IdSocio, FechaHoraEntrada, FechaHoraSalida, IdUsuarioRegistro, Observaciones) VALUES
(11, '20251028 07:00:00', '20251028 09:15:00', 2, NULL),
(12, '20251028 18:30:00', '20251028 20:45:00', 3, NULL),
(13, '20251029 06:45:00', '20251029 08:30:00', 2, NULL),
(14, '20251029 19:00:00', '20251029 21:00:00', 2, NULL),
(15, '20251029 07:15:00', '20251029 09:00:00', 3, NULL),
(16, '20251030 18:00:00', '20251030 20:15:00', 2, NULL),
(17, '20251030 08:30:00', '20251030 10:45:00', 2, NULL),
(18, '20251030 19:15:00', '20251030 21:30:00', 3, NULL),
(20, '20251030 17:45:00', '20251030 19:30:00', 2, NULL),
(21, '20251031 07:00:00', '20251031 09:00:00', 2, NULL),
(22, '20251031 06:30:00', '20251031 08:15:00', 3, NULL),
(23, '20251031 18:30:00', NULL, 2, 'En el gimnasio actualmente'),
(24, '20251031 19:00:00', NULL, 3, 'En el gimnasio actualmente'),
(25, '20251031 07:30:00', '20251031 09:45:00', 2, NULL),
(27, '20251031 18:15:00', '20251031 20:30:00', 2, NULL),
(30, '20251031 08:00:00', '20251031 10:00:00', 3, NULL),
(11, '20251029 06:50:00', '20251029 08:45:00', 2, NULL),
(13, '20251028 19:00:00', '20251028 21:15:00', 3, NULL),
(15, '20251027 07:00:00', '20251027 08:30:00', 2, NULL),
(17, '20251027 18:45:00', '20251027 20:30:00', 2, NULL);

PRINT 'Registros de acceso insertados: 21';
GO

-- =============================================
-- 12. NOTIFICACIONES
-- =============================================
-- Notificaciones de vencimiento de membresía
INSERT INTO dbo.Notificacion (IdSocio, TipoNotificacion, Mensaje, FechaEnvio, Enviado, FechaEnviado, MedioEnvio) VALUES
(14, 'VencimientoMembresia', 'Su membresía vence el 31/10/2025. Renueve para seguir disfrutando de nuestros servicios.', '20251026 10:00:00', 1, '20251026 10:05:00', 'Email'),
(16, 'VencimientoMembresia', 'Su membresía vence el 31/10/2025. Renueve para seguir disfrutando de nuestros servicios.', '20251026 10:00:00', 1, '20251026 10:05:00', 'Email'),
(18, 'VencimientoMembresia', 'Su membresía vence el 31/10/2025. Renueve para seguir disfrutando de nuestros servicios.', '20251026 10:00:00', 1, '20251026 10:05:00', 'Email'),
(27, 'VencimientoMembresia', 'Su membresía vence el 31/10/2025. Renueve para seguir disfrutando de nuestros servicios.', '20251026 10:00:00', 1, '20251026 10:05:00', 'Email'),
(30, 'VencimientoMembresia', 'Su membresía vence el 31/10/2025. Renueve para seguir disfrutando de nuestros servicios.', '20251026 10:00:00', 1, '20251026 10:05:00', 'Email'),
(24, 'VencimientoMembresia', 'Su membresía vence el 28/11/2025. Renueve para seguir disfrutando de nuestros servicios.', '20251123 10:00:00', 0, NULL, NULL),
(25, 'VencimientoMembresia', 'Su membresía vence el 29/11/2025. Renueve para seguir disfrutando de nuestros servicios.', '20251124 10:00:00', 0, NULL, NULL),
(21, 'VencimientoMembresia', 'Su membresía vence el 19/11/2025. Renueve para seguir disfrutando de nuestros servicios.', '20251114 10:00:00', 0, NULL, NULL);

-- Notificaciones de recordatorio de clase
INSERT INTO dbo.Notificacion (IdSocio, TipoNotificacion, Mensaje, FechaEnvio, Enviado, FechaEnviado, MedioEnvio) VALUES
(11, 'RecordatorioClase', 'Recordatorio: Clase de Yoga Matutino mañana Lunes a las 07:00 en Sala A', '20251027 18:00:00', 1, '20251027 18:02:00', 'Email'),
(12, 'RecordatorioClase', 'Recordatorio: Clase de Yoga Matutino mañana Lunes a las 07:00 en Sala A', '20251027 18:00:00', 1, '20251027 18:02:00', 'Email'),
(14, 'RecordatorioClase', 'Recordatorio: Clase de Yoga Vespertino hoy Lunes a las 18:00 en Sala A', '20251028 16:00:00', 1, '20251028 16:01:00', 'WhatsApp'),
(20, 'RecordatorioClase', 'Recordatorio: Clase de Zumba Fitness mañana Martes a las 18:30 en Sala C', '20251027 19:00:00', 1, '20251027 19:03:00', 'Email'),
(21, 'RecordatorioClase', 'Recordatorio: Clase de Zumba Fitness mañana Martes a las 18:30 en Sala C', '20251027 19:00:00', 1, '20251027 19:03:00', 'Email');

-- Notificación general
INSERT INTO dbo.Notificacion (IdSocio, TipoNotificacion, Mensaje, FechaEnvio, Enviado, FechaEnviado, MedioEnvio) VALUES
(11, 'General', 'Bienvenido al Gimnasio VidaFit. Estamos para servirle.', '20240601 09:00:00', 1, '20240601 09:05:00', 'Email'),
(26, 'General', 'Bienvenido al Gimnasio VidaFit. Estamos para servirle.', '20250105 10:00:00', 1, '20250105 10:05:00', 'Email'),
(27, 'General', 'Bienvenido al Gimnasio VidaFit. Estamos para servirle.', '20250210 11:00:00', 1, '20250210 11:05:00', 'Email');

PRINT 'Notificaciones insertadas: 16';
GO

-- =============================================
-- RESUMEN DE DATOS INSERTADOS
-- =============================================
PRINT '';
PRINT '========================================';
PRINT 'RESUMEN DE CARGA DE DATOS COMPLETADA';
PRINT '========================================';
PRINT 'Roles: 3';
PRINT 'Usuarios: 5';
PRINT 'Tipos de Suscripción: 4';
PRINT 'Socios: 30';
PRINT 'Membresías: 30 (13 Vencidas, 17 Activas)';
PRINT 'Pagos: 30';
PRINT 'Instructores: 5';
PRINT 'Tipos de Clase: 6';
PRINT 'Clases Programadas: 12';
PRINT 'Inscripciones a Clases: 19';
PRINT 'Registros de Acceso: 21';
PRINT 'Notificaciones: 16';
PRINT '========================================';
PRINT 'Carga de datos completada exitosamente.';
GO

-- =============================================
-- CONSULTAS DE VERIFICACIÓN
-- =============================================
PRINT '';
PRINT 'Ejecutando consultas de verificación...';
GO

-- Verificar socios con membresía activa
SELECT 
    'Socios con Membresía Activa' AS Consulta,
    COUNT(*) AS Total
FROM dbo.Socio s
INNER JOIN dbo.Membresia m ON s.IdSocio = m.IdSocio
WHERE m.EstadoMembresia = 'Activa';

-- Verificar socios con membresía vencida
SELECT 
    'Socios con Membresía Vencida' AS Consulta,
    COUNT(*) AS Total
FROM dbo.Socio s
INNER JOIN dbo.Membresia m ON s.IdSocio = m.IdSocio
WHERE m.EstadoMembresia = 'Vencida';

-- Verificar total de pagos registrados
SELECT 
    'Total de Pagos Registrados' AS Consulta,
    COUNT(*) AS Total,
    SUM(MontoPagado) AS MontoTotal
FROM dbo.Pago;

-- Verificar inscripciones activas
SELECT 
    'Inscripciones Activas a Clases' AS Consulta,
    COUNT(*) AS Total
FROM dbo.InscripcionClase
WHERE EstadoInscripcion = 'Inscrito';

PRINT 'Verificación completada.';
GO