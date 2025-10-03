
CREATE TABLE CLIENTE
( 
	IdCliente            integer IDENTITY ( 1,1 ) ,
	Nombre               varchar()  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	Correo               varchar(100)  NOT NULL ,
	Celular              varchar(20)  NOT NULL ,
	CONSTRAINT XPKCLIENTE PRIMARY KEY (IdCliente ASC)
)
go



CREATE TABLE COMPUTADORA
( 
	IdComputadora        integer  NOT NULL ,
	Codigo               varchar(20)  NOT NULL ,
	Procesador           varchar(20)  NULL ,
	Disponible           integer  NOT NULL ,
	CONSTRAINT XPKCOMPUTADORA PRIMARY KEY (IdComputadora ASC),
	CONSTRAINT XAK1COMPUTADORA UNIQUE (Codigo  ASC)
)
go



CREATE TABLE USUARIO
( 
	IdUsuario            integer IDENTITY ( 1,1 ) ,
	Nombre               varchar(100)  NOT NULL ,
	Usuario              varchar(20)  NOT NULL ,
	Clave                varchar(20)  NOT NULL ,
	CONSTRAINT XPKUSUARIO PRIMARY KEY (IdUsuario ASC)
)
go



CREATE TABLE ESTADO_RESERVA
( 
	idEstado             integer  NOT NULL ,
	Nombre               varchar(20)  NULL ,
	CONSTRAINT XPKESTADO_RESERVA PRIMARY KEY (idEstado ASC)
)
go



CREATE TABLE RESERVA
( 
	IdReserva            integer  NOT NULL ,
	IdCliente            integer  NOT NULL ,
	idEstado             integer  NOT NULL ,
	IdUsuario            integer  NOT NULL ,
	IdComputadora        integer  NOT NULL ,
	Fecha                datetime  NOT NULL ,
	CONSTRAINT XPKRESERVA PRIMARY KEY (IdReserva ASC),
	CONSTRAINT FK_RESERVA_CLIENTE FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_RESERVA_ESTADO_RESERVA FOREIGN KEY (idEstado) REFERENCES ESTADO_RESERVA(idEstado)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_RESERVA_USUARIO FOREIGN KEY (IdUsuario) REFERENCES USUARIO(IdUsuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_RESERVA_COMPUTADORA FOREIGN KEY (IdComputadora) REFERENCES COMPUTADORA(IdComputadora)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE ALQUILER
( 
	IdAlquiler           integer IDENTITY ( 1,1 ) ,
	IdCliente            integer  NOT NULL ,
	IdComputadora        integer  NOT NULL ,
	IdUsuario            integer  NOT NULL ,
	IdReserva            integer  NULL ,
	Fecha                datetime  NOT NULL ,
	HoraInicio           varchar(10)  NOT NULL ,
	HoraFin              varchar(10)  NOT NULL ,
	CostoHora            numeric(10,2)  NOT NULL ,
	CostoTotal           numeric(10,2)  NOT NULL ,
	CONSTRAINT XPKALQUILER PRIMARY KEY (IdAlquiler ASC),
	CONSTRAINT FK_ALQUILER_CLIENTE FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_ALQUILER_COMPUTADORA FOREIGN KEY (IdComputadora) REFERENCES COMPUTADORA(IdComputadora)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_ALQUILER_USUARIO FOREIGN KEY (IdUsuario) REFERENCES USUARIO(IdUsuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_ALQUILER_RESERVA FOREIGN KEY (IdReserva) REFERENCES RESERVA(IdReserva)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go


