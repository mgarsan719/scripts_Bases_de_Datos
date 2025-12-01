-- Cabecera
drop database if exists empleados;
create database empleados;
use empleados;

-- Tablas
create table empleado(
	DNI char(9),
    Nombre VARCHAR(20) not null,
    Apellido1 varchar(20),
    Apellido2 varchar(20),
    Direccion varchar(20),
    Ciudad varchar(20),
    Municipio varchar(20),
    Cod_postal char(5),
    Sexo char(1),
    Fecha_nac date
);