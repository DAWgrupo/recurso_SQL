-- Create database proyecto;

-- use proyecto;

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



create table tb_ubicacion(
pk_idUbicacion  int not null primary key auto_increment,
nombre_lugar varchar(150),
latitud float,
longitud float,
estado int
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
calidad		int check(calidad>=0 and calidad <= 10 ),
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (fk_precio) REFERENCES tb_precio(pk_precio),
FOREIGN KEY (fk_tipo) REFERENCES tb_tipo(pk_tipo)
);

create table tb_comedor(
pk_idcomedor  int not null primary key auto_increment,
fk_facultad	int,
fk_idadministrador	int,
fk_plato		int,
fk_ubicacion	int,
nombre_comedor varchar(150),
estado		int,
user_creacion varchar(150) default 'user' , 
fecha_cracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (fk_facultad) REFERENCES tb_facultad(pk_idfacultad),
FOREIGN KEY (fk_idadministrador) REFERENCES tb_administrador(pk_idAdministrador),
FOREIGN KEY (fk_plato) REFERENCES tb_platos(pk_idPlatos),
FOREIGN KEY (fk_ubicacion) REFERENCES tb_ubicacion(pk_idUbicacion)
);



select * from  proyecto.tb_administrador;
select * from  proyecto.tb_clientes;
select * from  proyecto.tb_persona;

select * from  proyecto.tb_facultad;
select * from  proyecto.tb_platos;
select * from  proyecto.tb_precio;
select * from  proyecto.tb_tipo;

select * from  proyecto.tb_comedor;
