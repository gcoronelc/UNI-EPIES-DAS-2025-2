-- Entendiendo las publicaciones
-- que se comercializan.

declare @tipo char(3);
set @tipo = 'LIB';
select * from TIPO where idtipo=@tipo;
select * from PUBLICACION where idtipo=@tipo;
go

-- Entendiendo los empleados
-- y los usuarios

select * from EMPLEADO;
select * from USUARIO;
go

-- Entendiendo las ventas
-- y las promociones

select * from VENTA;
select * from  PROMOCION;
go


-- Tabla de parametros del sistema

select * from CONTROL;
go










