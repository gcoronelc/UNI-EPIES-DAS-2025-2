select * from EMPLEADO;
go

sp_help empleado
go

select emp_id id, emp_apellido apellido, 
emp_nombre nombre, emp_direccion direccion, 
emp_email, emp_usuario usuario, '*****' clave 
from EMPLEADO
where emp_usuario='eaguero' and emp_clave='cazador';
go