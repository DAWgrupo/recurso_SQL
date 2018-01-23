Create database proyecto;

use proyecto;

create table tb_persona(
pk_idPersona  int not null primary key auto_increment,
nombres varchar(150),
apellido varchar(150),
edad	int,
correo	varchar(150),
fecha_nac date
);

create table tb_clientes(
pk_idCliente  int not null primary key auto_increment,
fk_idPersona int,
usuario varchar(150),
clave	varchar(150),
estado	int,
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY (fk_idPersona) REFERENCES tb_persona(pk_idPersona)
);

create table tb_administrador(
pk_idAdministrador int not null primary key auto_increment,
fk_idPersona int,
usuario varchar(150),
clave	varchar(150),
estado	int,
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY (fk_idPersona) REFERENCES tb_persona(pk_idPersona)
);

create table tb_precio(
pk_precio  int not null primary key auto_increment,
precio_plato float,
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table tb_tipo(
pk_tipo  int not null primary key auto_increment,
nombre_tipo varchar(150),
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table tb_facultad(
pk_idfacultad  int not null primary key auto_increment,
nombre_facultad varchar(150),
Abreviatura 	varchar(150),
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table tb_platos(
pk_idPlatos  int not null primary key auto_increment,
fk_precio	int,
fk_tipo		int,
nombre_plato varchar(150),
estado		int,
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (fk_precio) REFERENCES tb_precio(pk_precio),
FOREIGN KEY (fk_tipo) REFERENCES tb_tipo(pk_tipo)
);

create table tb_calificacion(
pk_idcalificacion  int not null primary key auto_increment,
fk_idCliente	int,
fk_idPlatos		int,
calificacion	int  check(calificacion>=0 and calificacion <= 10 ),
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (fk_idCliente) REFERENCES tb_clientes(pk_idCliente),
FOREIGN KEY (fk_idPlatos) REFERENCES tb_platos(pk_idPlatos)
);

create table tb_correo(
pk_idcorreo  int not null primary key auto_increment,
fk_idCliente	int,
desc_correo varchar(150),
estado		int, -- Envia o no 1 ,0 
emisor	varchar(150),
fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (fk_idCliente) REFERENCES tb_clientes(pk_idCliente)
);

create table tb_comedor(
pk_idcomedor  int not null primary key auto_increment,
fk_facultad	int,
fk_idadministrador	int,
fk_plato		int,
fk_ubicacion	int,
nombre_comedor varchar(150),
estado		int,
latitud float,
longitud float,
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (fk_facultad) REFERENCES tb_facultad(pk_idfacultad),
FOREIGN KEY (fk_idadministrador) REFERENCES tb_administrador(pk_idAdministrador),
FOREIGN KEY (fk_plato) REFERENCES tb_platos(pk_idPlatos)
);

create table tb_dias(
pk_id  int not null primary key auto_increment,
dia varchar(150)
);

create table tb_menuSemanal(
pk_idmenu  int not null primary key auto_increment,
fk_plato	int,
fk_dia		int,
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (fk_plato) REFERENCES tb_platos(pk_idPlatos),
FOREIGN KEY (fk_dia) REFERENCES tb_dias(pk_id)
);

/*
insert into proyecto.tb_persona(nombres, apellido, edad,correo, fecha_nac) values('Daniel Samuel', 'Torres Criollo', 23, 'dstorres@espol.edu.ec',now()); 
insert into proyecto.tb_persona(nombres, apellido, edad,correo, fecha_nac) values('Samuel Daniel', 'Criollo Torres', 23, 'dscriollo@espol.edu.ec',CURRENT_TIMESTAMP); 

insert into proyecto.tb_administrador(fk_idPersona, usuario, clave, estado) values(1,'dstorres@espol.edu.ec','dstorres123',1);
insert into proyecto.tb_clientes(fk_idPersona, usuario, clave, estado) values(2,'dscriollo@espol.edu.ec','dscriollo123',1);
insert into proyecto.tb_clientes(fk_idPersona, usuario, clave, estado) values(3,'samuelt@espol.edu.ec','samuelt123',1);

*/
select * from  proyecto.tb_persona;
select * from  proyecto.tb_administrador;
select * from  proyecto.tb_clientes;

insert into proyecto.tb_precio(precio_plato) values (2.50);
insert into proyecto.tb_precio(precio_plato) values (3.00);
insert into proyecto.tb_precio(precio_plato) values (3.50);
insert into proyecto.tb_precio(precio_plato) values (2.25);
insert into proyecto.tb_precio(precio_plato) values (2.00);

insert into proyecto.tb_tipo(nombre_tipo) values ('Tipipo');
insert into proyecto.tb_tipo(nombre_tipo) values ('Dietetico');
insert into proyecto.tb_tipo(nombre_tipo) values ('Mariscos');

insert into proyecto.tb_facultad(nombre_facultad,Abreviatura) values ('Ciencias Naturales y Matematicas','FCNM');
insert into proyecto.tb_facultad(nombre_facultad,Abreviatura) values ('Electricidad y Computacion','FIEC');
insert into proyecto.tb_facultad(nombre_facultad,Abreviatura) values ('Escuela de Diseño y Educacion Visual','EDCOM');
insert into proyecto.tb_facultad(nombre_facultad,Abreviatura) values ('Ciencias Sociales y Humanisticas','FCNM');
insert into proyecto.tb_facultad(nombre_facultad,Abreviatura) values ('Ingenieria en Mecanica y Ciencias de la Produccion','FIMCBOR');

insert into proyecto.tb_platos(fk_precio, fk_tipo,nombre_plato,estado) values (1,1,'Plato 1', 1);
insert into proyecto.tb_platos(fk_precio, fk_tipo,nombre_plato,estado) values (2,1,'Plato 2', 1);
insert into proyecto.tb_platos(fk_precio, fk_tipo,nombre_plato,estado) values (3,2,'Plato 3', 1);
insert into proyecto.tb_platos(fk_precio, fk_tipo,nombre_plato,estado) values (4,3,'Plato 4', 1);
insert into proyecto.tb_platos(fk_precio, fk_tipo,nombre_plato,estado) values (5,2,'Plato 5', 1);
insert into proyecto.tb_platos(fk_precio, fk_tipo,nombre_plato,estado) values (2,3,'Plato 6', 1);
insert into proyecto.tb_platos(fk_precio, fk_tipo,nombre_plato,estado) values (3,3,'Plato 7', 1);
insert into proyecto.tb_platos(fk_precio, fk_tipo,nombre_plato,estado) values (1,2,'Plato 8', 1);
insert into proyecto.tb_platos(fk_precio, fk_tipo,nombre_plato,estado) values (6,3,'Plato 9', 1);



select * from  proyecto.tb_precio;
select * from  proyecto.tb_tipo;
select * from  proyecto.tb_facultad;
select * from  proyecto.tb_platos;

insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (1,1,8);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (2,1,7);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (2,2,4);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (1,2,3);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (2,3,8);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (1,3,7);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (2,4,8);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (1,4,9);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (1,5,7);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (2,5,8);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (1,6,9);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (2,6,5);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (1,7,5);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (2,7,7);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (1,8,4);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (2,8,5);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (1,9,8);
insert into proyecto.tb_calificacion(fk_idCliente, fk_idPlatos,calificacion) values (2,9,9);

select * from proyecto.tb_calificacion; 
select * from tb_correo;
select * from tb_comedor
select * from tb_dias;
select * from tb_menuSemanal;