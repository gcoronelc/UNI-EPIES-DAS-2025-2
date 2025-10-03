-- =============================================
-- SCRIPT DE DATOS DE PRUEBA - CABINA INTERNET
-- =============================================

-- Insertar Clientes (30 clientes)
INSERT INTO CLIENTE (Nombre, DNI, Correo, Celular) VALUES
('Juan Pérez García', '12345678', 'juan.perez@gmail.com', '987654321'),
('María López Santos', '23456789', 'maria.lopez@hotmail.com', '987654322'),
('Carlos Rodríguez Vega', '34567890', 'carlos.rodriguez@yahoo.com', '987654323'),
('Ana Torres Méndez', '45678901', 'ana.torres@gmail.com', '987654324'),
('Luis Ramírez Castro', '56789012', 'luis.ramirez@outlook.com', '987654325'),
('Carmen Flores Ruiz', '67890123', 'carmen.flores@gmail.com', '987654326'),
('Pedro Sánchez Díaz', '78901234', 'pedro.sanchez@hotmail.com', '987654327'),
('Rosa Jiménez Mora', '89012345', 'rosa.jimenez@yahoo.com', '987654328'),
('Miguel Vargas León', '90123456', 'miguel.vargas@gmail.com', '987654329'),
('Laura Castillo Ramos', '01234567', 'laura.castillo@outlook.com', '987654330'),
('Jorge Herrera Silva', '11234568', 'jorge.herrera@gmail.com', '987654331'),
('Patricia Morales Cruz', '21234569', 'patricia.morales@hotmail.com', '987654332'),
('Roberto Guzmán Ortiz', '31234570', 'roberto.guzman@yahoo.com', '987654333'),
('Sandra Mendoza Rios', '41234571', 'sandra.mendoza@gmail.com', '987654334'),
('Fernando Rojas Peña', '51234572', 'fernando.rojas@outlook.com', '987654335'),
('Claudia Paredes Luna', '61234573', 'claudia.paredes@gmail.com', '987654336'),
('Ricardo Campos Soto', '71234574', 'ricardo.campos@hotmail.com', '987654337'),
('Isabel Medina Valle', '81234575', 'isabel.medina@yahoo.com', '987654338'),
('Alberto Vega Montes', '91234576', 'alberto.vega@gmail.com', '987654339'),
('Gabriela Núñez Prado', '02234577', 'gabriela.nunez@outlook.com', '987654340'),
('Andrés Cortés Arias', '12234578', 'andres.cortes@gmail.com', '987654341'),
('Mónica Reyes Salazar', '22234579', 'monica.reyes@hotmail.com', '987654342'),
('Daniel Acosta Fuentes', '32234580', 'daniel.acosta@yahoo.com', '987654343'),
('Beatriz Navarro Duarte', '42234581', 'beatriz.navarro@gmail.com', '987654344'),
('Raúl Pacheco Ibarra', '52234582', 'raul.pacheco@outlook.com', '987654345'),
('Elena Contreras Vera', '62234583', 'elena.contreras@gmail.com', '987654346'),
('Sergio Escobar Lara', '72234584', 'sergio.escobar@hotmail.com', '987654347'),
('Verónica Aguilar Cano', '82234585', 'veronica.aguilar@yahoo.com', '987654348'),
('Javier Domínguez Rey', '92234586', 'javier.dominguez@gmail.com', '987654349'),
('Liliana Guerrero Paz', '03234587', 'liliana.guerrero@outlook.com', '987654350');

-- Insertar Usuarios (5 usuarios del sistema)
INSERT INTO USUARIO (Nombre, Usuario, Clave) VALUES
('Administrador Sistema', 'admin', 'admin123'),
('Carlos Mendoza', 'cmendoza', 'carlos123'),
('Ana García', 'agarcia', 'ana123'),
('Luis Torres', 'ltorres', 'luis123'),
('María Silva', 'msilva', 'maria123');

-- Insertar Computadoras (20 computadoras)
INSERT INTO COMPUTADORA (IdComputadora, Codigo, Procesador, Disponible) VALUES
(1, 'PC-001', 'Intel i5-10400', 1),
(2, 'PC-002', 'Intel i5-10400', 1),
(3, 'PC-003', 'Intel i7-10700', 1),
(4, 'PC-004', 'AMD Ryzen 5', 1),
(5, 'PC-005', 'Intel i5-10400', 1),
(6, 'PC-006', 'Intel i7-10700', 1),
(7, 'PC-007', 'AMD Ryzen 5', 1),
(8, 'PC-008', 'Intel i5-10400', 1),
(9, 'PC-009', 'Intel i7-11700', 1),
(10, 'PC-010', 'AMD Ryzen 7', 1),
(11, 'PC-011', 'Intel i5-10400', 1),
(12, 'PC-012', 'Intel i7-10700', 1),
(13, 'PC-013', 'AMD Ryzen 5', 1),
(14, 'PC-014', 'Intel i5-11400', 1),
(15, 'PC-015', 'Intel i7-11700', 1),
(16, 'PC-016', 'AMD Ryzen 7', 1),
(17, 'PC-017', 'Intel i5-10400', 1),
(18, 'PC-018', 'Intel i7-10700', 1),
(19, 'PC-019', 'AMD Ryzen 5', 1),
(20, 'PC-020', 'Intel i9-10900', 1);

-- Insertar Estados de Reserva
INSERT INTO ESTADO_RESERVA (idEstado, Nombre) VALUES
(1, 'Pendiente'),
(2, 'Confirmada'),
(3, 'Cancelada'),
(4, 'Completada');

-- Insertar 40 Reservas (año 2025)
INSERT INTO RESERVA (IdReserva, IdCliente, idEstado, IdUsuario, IdComputadora, Fecha) VALUES
(1, 1, 2, 1, 1, '20250115 10:00:00'),
(2, 2, 2, 2, 3, '20250115 14:00:00'),
(3, 3, 1, 1, 5, '20250116 09:00:00'),
(4, 4, 2, 3, 7, '20250116 15:00:00'),
(5, 5, 2, 2, 2, '20250117 11:00:00'),
(6, 6, 3, 1, 4, '20250118 10:30:00'),
(7, 7, 2, 4, 6, '20250119 13:00:00'),
(8, 8, 2, 2, 8, '20250120 16:00:00'),
(9, 9, 2, 1, 10, '20250122 10:00:00'),
(10, 10, 4, 3, 12, '20250123 14:30:00'),
(11, 11, 2, 2, 1, '20250201 09:00:00'),
(12, 12, 2, 1, 3, '20250202 11:00:00'),
(13, 13, 1, 4, 5, '20250203 15:00:00'),
(14, 14, 2, 2, 7, '20250205 10:00:00'),
(15, 15, 2, 3, 9, '20250206 14:00:00'),
(16, 16, 3, 1, 11, '20250207 12:00:00'),
(17, 17, 2, 2, 13, '20250210 16:00:00'),
(18, 18, 2, 4, 15, '20250212 10:30:00'),
(19, 19, 2, 1, 17, '20250214 13:00:00'),
(20, 20, 4, 3, 19, '20250215 15:30:00'),
(21, 21, 2, 2, 2, '20250301 09:00:00'),
(22, 22, 2, 1, 4, '20250303 11:00:00'),
(23, 23, 1, 4, 6, '20250305 14:00:00'),
(24, 24, 2, 2, 8, '20250307 10:00:00'),
(25, 25, 2, 3, 10, '20250310 15:00:00'),
(26, 26, 2, 1, 12, '20250312 13:00:00'),
(27, 27, 3, 2, 14, '20250315 11:00:00'),
(28, 28, 2, 4, 16, '20250318 16:00:00'),
(29, 29, 2, 1, 18, '20250320 10:00:00'),
(30, 30, 4, 3, 20, '20250322 14:00:00'),
(31, 1, 2, 2, 1, '20250401 09:30:00'),
(32, 3, 2, 1, 3, '20250403 11:30:00'),
(33, 5, 1, 4, 5, '20250405 14:30:00'),
(34, 7, 2, 2, 7, '20250408 10:30:00'),
(35, 9, 2, 3, 9, '20250410 15:30:00'),
(36, 11, 2, 1, 11, '20250412 13:30:00'),
(37, 13, 3, 2, 13, '20250415 11:30:00'),
(38, 15, 2, 4, 15, '20250418 16:30:00'),
(39, 17, 2, 1, 17, '20250420 10:30:00'),
(40, 19, 2, 3, 19, '20250422 14:30:00');

-- Insertar 50 Alquileres (año 2025)
INSERT INTO ALQUILER (IdCliente, IdComputadora, IdUsuario, IdReserva, Fecha, HoraInicio, HoraFin, CostoHora, CostoTotal) VALUES
(1, 1, 1, 1, '20250115', '10:00', '12:00', 3.50, 7.00),
(2, 3, 2, 2, '20250115', '14:00', '16:00', 4.00, 8.00),
(4, 7, 3, 4, '20250116', '15:00', '17:30', 3.50, 8.75),
(5, 2, 2, 5, '20250117', '11:00', '13:00', 3.50, 7.00),
(7, 6, 4, 7, '20250119', '13:00', '15:00', 4.00, 8.00),
(8, 8, 2, 8, '20250120', '16:00', '18:00', 3.50, 7.00),
(9, 10, 1, 9, '20250122', '10:00', '12:30', 4.50, 11.25),
(10, 12, 3, 10, '20250123', '14:30', '17:00', 4.00, 10.00),
(6, 4, 1, NULL, '20250125', '09:00', '11:00', 3.50, 7.00),
(11, 1, 2, 11, '20250201', '09:00', '11:00', 3.50, 7.00),
(12, 3, 1, 12, '20250202', '11:00', '13:30', 4.00, 10.00),
(14, 7, 2, 14, '20250205', '10:00', '12:00', 3.50, 7.00),
(15, 9, 3, 15, '20250206', '14:00', '16:30', 4.00, 10.00),
(17, 13, 2, 17, '20250210', '16:00', '18:00', 3.50, 7.00),
(18, 15, 4, 18, '20250212', '10:30', '13:00', 4.50, 11.25),
(19, 17, 1, 19, '20250214', '13:00', '15:00', 4.00, 8.00),
(20, 19, 3, 20, '20250215', '15:30', '18:00', 3.50, 8.75),
(13, 5, 4, NULL, '20250218', '10:00', '12:00', 3.50, 7.00),
(16, 11, 1, NULL, '20250220', '14:00', '16:00', 4.00, 8.00),
(21, 2, 2, 21, '20250301', '09:00', '11:30', 3.50, 8.75),
(22, 4, 1, 22, '20250303', '11:00', '13:00', 3.50, 7.00),
(24, 8, 2, 24, '20250307', '10:00', '12:30', 3.50, 8.75),
(25, 10, 3, 25, '20250310', '15:00', '17:00', 4.50, 9.00),
(26, 12, 1, 26, '20250312', '13:00', '15:30', 4.00, 10.00),
(28, 16, 4, 28, '20250318', '16:00', '18:00', 4.50, 9.00),
(29, 18, 1, 29, '20250320', '10:00', '12:00', 4.00, 8.00),
(30, 20, 3, 30, '20250322', '14:00', '17:00', 5.00, 15.00),
(23, 6, 4, NULL, '20250325', '11:00', '13:00', 4.00, 8.00),
(27, 14, 2, NULL, '20250328', '15:00', '17:00', 4.00, 8.00),
(1, 1, 2, 31, '20250401', '09:30', '11:30', 3.50, 7.00),
(3, 3, 1, 32, '20250403', '11:30', '14:00', 4.00, 10.00),
(7, 7, 2, 34, '20250408', '10:30', '12:30', 3.50, 7.00),
(9, 9, 3, 35, '20250410', '15:30', '18:00', 4.00, 10.00),
(11, 11, 1, 36, '20250412', '13:30', '16:00', 4.00, 10.00),
(15, 15, 4, 38, '20250418', '16:30', '19:00', 4.50, 11.25),
(17, 17, 1, 39, '20250420', '10:30', '13:00', 4.00, 10.00),
(19, 19, 3, 40, '20250422', '14:30', '17:00', 3.50, 8.75),
(2, 2, 2, NULL, '20250505', '09:00', '11:00', 3.50, 7.00),
(4, 4, 1, NULL, '20250508', '14:00', '16:00', 3.50, 7.00),
(6, 6, 4, NULL, '20250512', '10:00', '12:30', 4.00, 10.00),
(8, 8, 2, NULL, '20250515', '13:00', '15:00', 3.50, 7.00),
(10, 10, 3, NULL, '20250518', '11:00', '13:30', 4.50, 11.25),
(12, 12, 1, NULL, '20250520', '15:00', '17:00', 4.00, 8.00),
(14, 14, 2, NULL, '20250522', '10:00', '12:00', 4.00, 8.00),
(16, 16, 4, NULL, '20250525', '14:00', '16:30', 4.50, 11.25),
(18, 18, 1, NULL, '20250528', '09:00', '11:00', 4.00, 8.00),
(20, 20, 3, NULL, '20250530', '13:00', '16:00', 5.00, 15.00),
(22, 1, 2, NULL, '20250602', '10:00', '12:00', 3.50, 7.00),
(24, 5, 1, NULL, '20250605', '14:00', '16:00', 3.50, 7.00),
(26, 9, 4, NULL, '20250610', '11:00', '13:30', 4.00, 10.00);

-- Verificar los datos insertados
SELECT 'Total Clientes: ' + CAST(COUNT(*) AS VARCHAR) FROM CLIENTE;
SELECT 'Total Usuarios: ' + CAST(COUNT(*) AS VARCHAR) FROM USUARIO;
SELECT 'Total Computadoras: ' + CAST(COUNT(*) AS VARCHAR) FROM COMPUTADORA;
SELECT 'Total Estados: ' + CAST(COUNT(*) AS VARCHAR) FROM ESTADO_RESERVA;
SELECT 'Total Reservas: ' + CAST(COUNT(*) AS VARCHAR) FROM RESERVA;
SELECT 'Total Alquileres: ' + CAST(COUNT(*) AS VARCHAR) FROM ALQUILER;

PRINT 'Script de datos de prueba ejecutado exitosamente';
PRINT '40 Reservas creadas para el año 2025';
PRINT '50 Alquileres creados para el año 2025';