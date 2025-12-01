-- Cabecera
drop database if exists Academia_idiomas;
create database Academia_idiomas;
use Academia_idiomas;

-- Tablas
create table Personas(
	ID bigint primary key auto_increment,
	DNI char(9) unique not null,
	Nombre varchar(250),
    Apellido1 varchar(250),
    Apellido2 varchar(250),
    Direccion varchar(250)
);
describe Personas;

create table Profesores(
    ID_persona bigint primary key,
    Titulo varchar(250),
    Gana decimal(7,2),
    constraint fk_profesores_persona foreign key (ID_persona) references Personas(ID) on delete cascade
);
describe Profesores;

create table Cursos(
	ID bigint primary key auto_increment,
    Nombre varchar(250),
    Max_alumn int,
    Fecha_ini date,
    Fecha_fin date,
    Num_horas int,
    ID_profesor bigint,
    constraint fk_curso_profesor foreign key (ID_profesor) references Profesores(ID_persona) on delete cascade
);
describe Cursos;

create table Alumnos
(
	ID_persona bigint primary key,
    Sexo char(1),
    Fecha_nac date,
    ID_curso bigint,
	constraint fk_alumnos_persona foreign key (ID_persona) references Personas(ID),
    constraint fk_alumnos_cursos foreign key (ID_curso) references Cursos(ID)
);
 describe Alumnos;
 
 
 -- Insercion de datos
insert into academia_idiomas.personas(DNI, Nombre, Apellido1, Apellido2, Direccion) 
values 
	('76978084M', 'Juan','Arcos','Lopez','Puerta Negra, 4'),
	('50427865C', 'María', 'Oliva', 'Rubio', 'Juan Alfonso, 23'),
	('99857929W', 'Sara', 'Lemes', 'Sancho', 'Calle Viento,1'),
	('23755174S','Lucas','Manilva','López','Alhamar, 4'),
	('03818863N','Antonia','Santos','Alcántara','Maniquí, 21'),
	('33577501P', 'Manuel','Baños','Rioseco','Jurel, 2'),
	('36107620N','José','Llorente','Escueto','Jarcha, 5');

select * from personas;

insert into academia_idiomas.profesores(ID_persona, Titulo, Gana) 
values
	(1, 'Ing. Informatico', 7500),
	(2,'Lda. Fil. Inglesa', 4900),
	(3, 'Magisterio', 6100);
	
select * from profesores;

describe cursos;

insert into academia_idiomas.cursos (Nombre, Max_alumn, Fecha_ini, Fecha_fin, Num_horas, ID_profesor) values
	('Ingles Basico', 15, '2023-01-01', '2023-10-01', 120, 2);

select * from academia_idiomas.cursos;

delete from profesores where ID_persona=1;







