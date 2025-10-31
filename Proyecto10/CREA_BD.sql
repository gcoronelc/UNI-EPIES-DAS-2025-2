-- =============================================
-- SCRIPT DE CREACIÓN BASE DE DATOS GIMNASIODB
-- Sistema de Gestión de Gimnasio VidaFit
-- =============================================

-- Verificar si la base de datos existe, si no, crearla
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'GIMNASIODB')
BEGIN
    CREATE DATABASE GIMNASIODB;
    PRINT 'Base de datos GIMNASIODB creada exitosamente.';
END
ELSE
BEGIN
    PRINT 'Base de datos GIMNASIODB ya existe.';
END
GO

-- Usar la base de datos
USE GIMNASIODB;
GO

-- =============================================
-- ELIMINAR TABLAS EXISTENTES (en orden inverso por dependencias)
-- =============================================

IF OBJECT_ID('dbo.Notificacion', 'U') IS NOT NULL DROP TABLE dbo.Notificacion;
IF OBJECT_ID('dbo.InscripcionClase', 'U') IS NOT NULL DROP TABLE dbo.InscripcionClase;
IF OBJECT_ID('dbo.Clase', 'U') IS NOT NULL DROP TABLE dbo.Clase;
IF OBJECT_ID('dbo.TipoClase', 'U') IS NOT NULL DROP TABLE dbo.TipoClase;
IF OBJECT_ID('dbo.Instructor', 'U') IS NOT NULL DROP TABLE dbo.Instructor;
IF OBJECT_ID('dbo.RegistroAcceso', 'U') IS NOT NULL DROP TABLE dbo.RegistroAcceso;
IF OBJECT_ID('dbo.Pago', 'U') IS NOT NULL DROP TABLE dbo.Pago;
IF OBJECT_ID('dbo.Membresia', 'U') IS NOT NULL DROP TABLE dbo.Membresia;
IF OBJECT_ID('dbo.Socio', 'U') IS NOT NULL DROP TABLE dbo.Socio;
IF OBJECT_ID('dbo.TipoSuscripcion', 'U') IS NOT NULL DROP TABLE dbo.TipoSuscripcion;
IF OBJECT_ID('dbo.Usuario', 'U') IS NOT NULL DROP TABLE dbo.Usuario;
IF OBJECT_ID('dbo.Rol', 'U') IS NOT NULL DROP TABLE dbo.Rol;

PRINT 'Tablas eliminadas (si existían).';
GO

-- =============================================
-- CREACIÓN DE TABLAS
-- =============================================

-- Tabla: Rol
CREATE TABLE dbo.Rol (
    IdRol INT IDENTITY(1,1) PRIMARY KEY,
    NombreRol VARCHAR(30) NOT NULL UNIQUE,
    Descripcion VARCHAR(100) NULL,
    Activo BIT NOT NULL DEFAULT 1
);

-- Tabla: Usuario
CREATE TABLE dbo.Usuario (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    NombreUsuario VARCHAR(50) NOT NULL UNIQUE,
    Contrasena VARCHAR(255) NOT NULL,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NULL,
    IdRol INT NOT NULL,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    UltimoAcceso DATETIME NULL,
    Activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Usuario_Rol FOREIGN KEY (IdRol) REFERENCES dbo.Rol(IdRol)
);

-- Tabla: TipoSuscripcion
CREATE TABLE dbo.TipoSuscripcion (
    IdTipoSuscripcion INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE,
    DuracionDias INT NOT NULL CHECK (DuracionDias > 0),
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio >= 0),
    Descripcion VARCHAR(200) NULL,
    Activo BIT NOT NULL DEFAULT 1
);

-- Tabla: Socio
CREATE TABLE dbo.Socio (
    IdSocio INT IDENTITY(1,1) PRIMARY KEY,
    NumeroCarnet VARCHAR(20) NOT NULL UNIQUE,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    TipoDocumento VARCHAR(20) NOT NULL,
    NumeroDocumento VARCHAR(20) NOT NULL UNIQUE,
    FechaNacimiento DATE NULL,
    Telefono VARCHAR(20) NULL,
    Email VARCHAR(100) NULL,
    Direccion VARCHAR(200) NULL,
    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE(),
    Activo BIT NOT NULL DEFAULT 1
);

-- Tabla: Membresia
CREATE TABLE dbo.Membresia (
    IdMembresia INT IDENTITY(1,1) PRIMARY KEY,
    IdSocio INT NOT NULL,
    IdTipoSuscripcion INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaVencimiento DATE NOT NULL,
    EstadoMembresia VARCHAR(20) NOT NULL CHECK (EstadoMembresia IN ('Activa', 'Vencida', 'Cancelada')),
    MontoTotal DECIMAL(10,2) NOT NULL CHECK (MontoTotal >= 0),
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Membresia_Socio FOREIGN KEY (IdSocio) REFERENCES dbo.Socio(IdSocio),
    CONSTRAINT FK_Membresia_TipoSuscripcion FOREIGN KEY (IdTipoSuscripcion) REFERENCES dbo.TipoSuscripcion(IdTipoSuscripcion)
);

-- Tabla: Pago
CREATE TABLE dbo.Pago (
    IdPago INT IDENTITY(1,1) PRIMARY KEY,
    IdMembresia INT NOT NULL,
    IdSocio INT NOT NULL,
    MontoPagado DECIMAL(10,2) NOT NULL CHECK (MontoPagado >= 0),
    FechaPago DATETIME NOT NULL DEFAULT GETDATE(),
    MetodoPago VARCHAR(30) NOT NULL CHECK (MetodoPago IN ('Efectivo', 'Tarjeta', 'Transferencia', 'Yape', 'Plin')),
    NumeroRecibo VARCHAR(50) NOT NULL UNIQUE,
    IdUsuarioRegistro INT NOT NULL,
    Observaciones VARCHAR(200) NULL,
    CONSTRAINT FK_Pago_Membresia FOREIGN KEY (IdMembresia) REFERENCES dbo.Membresia(IdMembresia),
    CONSTRAINT FK_Pago_Socio FOREIGN KEY (IdSocio) REFERENCES dbo.Socio(IdSocio),
    CONSTRAINT FK_Pago_Usuario FOREIGN KEY (IdUsuarioRegistro) REFERENCES dbo.Usuario(IdUsuario)
);

-- Tabla: RegistroAcceso
CREATE TABLE dbo.RegistroAcceso (
    IdRegistroAcceso INT IDENTITY(1,1) PRIMARY KEY,
    IdSocio INT NOT NULL,
    FechaHoraEntrada DATETIME NOT NULL DEFAULT GETDATE(),
    FechaHoraSalida DATETIME NULL,
    IdUsuarioRegistro INT NOT NULL,
    Observaciones VARCHAR(200) NULL,
    CONSTRAINT FK_RegistroAcceso_Socio FOREIGN KEY (IdSocio) REFERENCES dbo.Socio(IdSocio),
    CONSTRAINT FK_RegistroAcceso_Usuario FOREIGN KEY (IdUsuarioRegistro) REFERENCES dbo.Usuario(IdUsuario),
    CONSTRAINT CHK_RegistroAcceso_Salida CHECK (FechaHoraSalida IS NULL OR FechaHoraSalida >= FechaHoraEntrada)
);

-- Tabla: Instructor
CREATE TABLE dbo.Instructor (
    IdInstructor INT IDENTITY(1,1) PRIMARY KEY,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NULL,
    Email VARCHAR(100) NULL,
    Especialidad VARCHAR(100) NULL,
    FechaContratacion DATE NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);

-- Tabla: TipoClase
CREATE TABLE dbo.TipoClase (
    IdTipoClase INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE,
    Descripcion VARCHAR(200) NULL,
    DuracionMinutos INT NOT NULL CHECK (DuracionMinutos > 0),
    Activo BIT NOT NULL DEFAULT 1
);

-- Tabla: Clase
CREATE TABLE dbo.Clase (
    IdClase INT IDENTITY(1,1) PRIMARY KEY,
    IdTipoClase INT NOT NULL,
    IdInstructor INT NOT NULL,
    NombreClase VARCHAR(100) NOT NULL,
    DiaSemana VARCHAR(15) NOT NULL CHECK (DiaSemana IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo')),
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    Sala VARCHAR(50) NULL,
    CupoMaximo INT NOT NULL CHECK (CupoMaximo > 0),
    Activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Clase_TipoClase FOREIGN KEY (IdTipoClase) REFERENCES dbo.TipoClase(IdTipoClase),
    CONSTRAINT FK_Clase_Instructor FOREIGN KEY (IdInstructor) REFERENCES dbo.Instructor(IdInstructor),
    CONSTRAINT CHK_Clase_Horario CHECK (HoraFin > HoraInicio)
);

-- Tabla: InscripcionClase
CREATE TABLE dbo.InscripcionClase (
    IdInscripcionClase INT IDENTITY(1,1) PRIMARY KEY,
    IdClase INT NOT NULL,
    IdSocio INT NOT NULL,
    FechaInscripcion DATETIME NOT NULL DEFAULT GETDATE(),
    EstadoInscripcion VARCHAR(20) NOT NULL CHECK (EstadoInscripcion IN ('Inscrito', 'Asistió', 'NoAsistió', 'Cancelado')),
    IdUsuarioRegistro INT NOT NULL,
    CONSTRAINT FK_InscripcionClase_Clase FOREIGN KEY (IdClase) REFERENCES dbo.Clase(IdClase),
    CONSTRAINT FK_InscripcionClase_Socio FOREIGN KEY (IdSocio) REFERENCES dbo.Socio(IdSocio),
    CONSTRAINT FK_InscripcionClase_Usuario FOREIGN KEY (IdUsuarioRegistro) REFERENCES dbo.Usuario(IdUsuario),
    CONSTRAINT UQ_InscripcionClase_Socio_Clase UNIQUE (IdClase, IdSocio)
);

-- Tabla: Notificacion
CREATE TABLE dbo.Notificacion (
    IdNotificacion INT IDENTITY(1,1) PRIMARY KEY,
    IdSocio INT NOT NULL,
    TipoNotificacion VARCHAR(30) NOT NULL CHECK (TipoNotificacion IN ('VencimientoMembresia', 'RecordatorioClase', 'Pago', 'General')),
    Mensaje VARCHAR(500) NOT NULL,
    FechaEnvio DATETIME NOT NULL DEFAULT GETDATE(),
    Enviado BIT NOT NULL DEFAULT 0,
    FechaEnviado DATETIME NULL,
    MedioEnvio VARCHAR(20) NULL CHECK (MedioEnvio IN ('Email', 'SMS', 'WhatsApp') OR MedioEnvio IS NULL),
    CONSTRAINT FK_Notificacion_Socio FOREIGN KEY (IdSocio) REFERENCES dbo.Socio(IdSocio)
);

-- =============================================
-- CREACIÓN DE ÍNDICES PARA OPTIMIZACIÓN
-- =============================================

-- Índices en Socio
CREATE INDEX IX_Socio_NumeroCarnet ON dbo.Socio(NumeroCarnet);
CREATE INDEX IX_Socio_NumeroDocumento ON dbo.Socio(NumeroDocumento);
CREATE INDEX IX_Socio_Nombres_Apellidos ON dbo.Socio(Nombres, Apellidos);

-- Índices en Membresia
CREATE INDEX IX_Membresia_IdSocio ON dbo.Membresia(IdSocio);
CREATE INDEX IX_Membresia_FechaVencimiento ON dbo.Membresia(FechaVencimiento);
CREATE INDEX IX_Membresia_EstadoMembresia ON dbo.Membresia(EstadoMembresia);

-- Índices en RegistroAcceso
CREATE INDEX IX_RegistroAcceso_IdSocio ON dbo.RegistroAcceso(IdSocio);
CREATE INDEX IX_RegistroAcceso_FechaHoraEntrada ON dbo.RegistroAcceso(FechaHoraEntrada);

-- Índices en InscripcionClase
CREATE INDEX IX_InscripcionClase_IdClase ON dbo.InscripcionClase(IdClase);
CREATE INDEX IX_InscripcionClase_IdSocio ON dbo.InscripcionClase(IdSocio);

-- Índices en Pago
CREATE INDEX IX_Pago_IdSocio ON dbo.Pago(IdSocio);
CREATE INDEX IX_Pago_FechaPago ON dbo.Pago(FechaPago);

-- Índices en Notificacion
CREATE INDEX IX_Notificacion_IdSocio ON dbo.Notificacion(IdSocio);
CREATE INDEX IX_Notificacion_Enviado ON dbo.Notificacion(Enviado);

PRINT 'Base de datos GIMNASIODB creada exitosamente con todas las tablas e índices.';
GO