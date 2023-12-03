create database blogg;

use blogg;
create table profiles(
	id tinyint not null,
	profile varchar(20) not null unique,
	description varchar(100),
	status boolean default true,
	created_at datetime,
	updated_at datetime null,
	deleted_at datetime null,
	primary key(id)
);

create table users(
	id tinyint not null auto_increment,
	username varchar(50) unique,
	password varchar(150),
	status boolean,
	profile tinyint null,
	index(profile),
	created_at datetime,
	updated_at datetime null,
	deleted_at datetime null,
	foreign key(profile) references profiles(id),
	primary key(id)
);

create table userinfo(
	id int not null,
	name varchar(50),
	lastname varchar(80),
	birthday date null,
	gender char,
	phone varchar(15) null,
	photo varchar(250) null,
	bio text null,
	website varchar(255) null,
	status boolean default true,
	created_at datetime,
	updated_at datetime null,
	deleted_at datetime null,
	constraint id_usuario foreign key(id) references users(id),
	primary key(id)
);

-- drop table categories;
create table categories(
	id varchar(20) not null,
    primary key(id),
	category varchar(50) not null,
	description text null,
	created_at datetime,
	updated_at datetime null,
	deleted_at datetime null,
	status boolean default true,
	primary key(id)
);

-- drop table posts;
create table posts(
	id int not null auto_increment,
	category int not null,
	autor int not null,
	title varchar(250) not null,
	content text not null,
	status boolean default true,
	created_at datetime,
	updated_at datetime null,
	deleted_at datetime null,
	constraint category
		foreign key(category) references categories(id),
	constraint autor
		foreign key(autor) references users(id),
	primary key(id)
);

-- drop table attachments;

create table attachments(
	id int not null auto_increment,
	name varchar(100) not null,
	url varchar(255) not null,
	description varchar(255) null,
	primary key(id)
);


-- drop table attachments_posts;


create table attachments_posts(
	id int not null auto_increment,
	post int not null,
	attachment int not null,
	constraint post1 
		foreign key(post) references posts(id),
	constraint attachment 
		foreign key(attachment) references attachments(id),
	primary key(id)
);


create table comments(
	id int not null auto_increment,
	post int not null,
	message text,
	created_at datetime,
	updated_at datetime null,
	deleted_at datetime null,
	constraint post
		foreign key(post) references posts(id),
	primary key(id)
);


create table authors(
id int not null auto_increment,
primary key(id),
alias varchar(100) null unique,
name varchar (50) not null,
lastname varchar (50) not null default 'no definido',
photo varchar(150) null,
birthday date,
deceased date null,
bio text null,
created_at datetime,
updated_at datetime null,
deleted_at datetime null
);

create table books(
id int not null auto_increment,
primary key(id),
title varchar(250) not null
);

create table books_authors(
id int not null auto_increment,
primary key(id),
book int not null,
index(book),
foreign key (book) references books(id),
author int not null,
index(author),
foreign key (author) references authors(id)
);

-- Insertar perfiles
INSERT INTO profiles (profile, created_at)
	VALUES ('admin', '2023/08/29 09:00:00'),
	 ('editor', '2023/08/29 09:00:03'),
	 ('revisor', '2023/08/29 09:00:08');

-- Insertar mas perfiles
INSERT INTO profiles (profile, created_at)
	VALUES ('autor', '2023/08/29 09:00:00'),
	 ('colaborador', '2023/08/29 09:00:03'),
	 ('suscriptor', '2023/08/29 09:00:08');

select * from profiles;

-- insertar datos en tabla users
INSERT INTO users(username, password, status, profile, created_at)
VALUES ('daniel', '240987', 1, 1, '2023/08/29 9:40:01'),
('charly', 'd74hn78', 1, 3, '2023/08/29 9:42:02'),
('manuel', 'ew678', 1, 2, '2023/08/29 9:42:03'),
('osvaldo', 'gd23568', 1, 3, '2023/08/29 9:42:04'),
('felipe', '1hkw567', 1, 2, '2023/08/29 9:42:05'),
('jerry', '5eg447f', 1, 2, '2023/08/29 9:42:06'),
('rober', '23dfv78', 1, 2, '2023/08/29 9:42:07'),
('pepe', 'ikmdfd56724', 2, 3, '2023/08/29 9:42:08'),
('juan', 'sd72251', 1, 2, '2023/08/29 9:42:09'),
('luis', 'dwj672gh34', 1, 3, '2023/08/29 9:42:10'),
('chucho', 'sjbw62925', 1, 2, '2023/08/29 9:43:00'),
('angel', 'ubhjs78245', 1, 2, '2023/08/29 9:43:10'),
('fer', '264gs53', 1, 2, '2023/08/29 9:43:20'),
('antoni', 'ejkw7828', 1, 2, '2023/08/29 9:44:00'),
('mario', '9edjskkd8', 1, 3, '2023/08/29 9:45:00'),
('sebas', 'er8032978', 1, 2, '2023/08/29 9:46:00'),
('oscar', 'fg56g7hn8', 1, 3, '2023/08/29 9:47:00'),
('franco', '1gj236g7q8', 1, 2, '2023/08/29 9:48:00'),
('checo', '34ds5g6j7k', 1, 2, '2023/08/29 10:00:00'),
('nando', '5mlo78', 1, 2, '2023/08/30 10:00:00'),
('paquillo', '86dfmo2', 1, 3, '2023/08/30 10:00:00'),
('pepin', '453rso78', 1, 2, '2023/08/30 10:00:00');

select * from users;

-- C01 Primera consulta de tablas relacionadas (utilizar alias)

select u.id, u.username, u.status, p.profile
from users as u
join profiles as p
on u.profile = p.id;


-- insertar datos en userinfo
INSERT INTO userinfo (id, name, lastname, birthday, gender, phone, bio, website, created_at)
	VALUES (21, 'Daniel', 'Monfil', '2002/01/09', 'm', '2311550527', 'Alumno del ITST', 'mapaches.info', '2023/08/29 10:00:00'),
(22, 'Carlos', 'Gonzalez', '1999/10/01', 'm', '2312066656', 'Albañil', 'mapaches.info', '2023/08/29 10:00:01'),
(23, 'Gerardo', 'Mora', '2003/01/02', 'm', '2312066656', 'Profesor', 'mapaches.info', '2023/08/29 10:00:02'),
(24, 'Roberto', 'Domingo', '2003/04/03', 'm', '2312066656', 'Profesor Doctor', 'mapaches.info', '2023/08/29 10:00:03'),
(25, 'Felipe', 'Aviles', '1999/12/10', 'm', '2312036656', 'Estudiante', 'mapaches.info', '2023/08/29 10:00:04'),
(26, 'Osvaldo', 'Santos', '2004/01/20', 'm', '2312366656', 'Con mi pleisteishon', 'mapaches.info', '2023/08/29 10:00:05'),
(27, 'Augusto', 'Ramirez', '1997/08/25', 'm', '2322066656', 'Estoy ocupado', 'mapaches.info', '2023/08/29 11:00:00'),
(28, 'Bambirucho', 'Lopez', '1984/01/24', 'm', '2312065656', 'Comerciante', 'mapaches.info', '2023/08/29 11:10:00'),
(29, 'Anastasio', 'Duarte', '1995/05/21', 'm', '2312068656', 'Encargado de limpieza', 'mapaches.info', '2023/08/29 11:20:00'),
(30, 'Ken', 'Obrador', '1991/10/19', 'm', '2312066896', 'Gerente general', 'mapaches.info', '2023/08/29 11:30:00'),
(31, 'Leandro', 'Hinojosa', '1996/08/17', 'm', '2312012656', 'Administrativo', 'mapaches.info', '2023/08/29 12:00:00'),
(32, 'Bob', 'Zapata', '2001/10/15', 'm', '2312066612', 'Soy nini', 'mapaches.info', '2023/08/29 12:30:00'),
(33, 'Patricio', 'Villa', '2000/11/12', 'm', '2312034656', 'Estudiante', 'mapaches.info', '2023/08/29 12:40:00'),
(34, 'Oscar', 'Diaz', '1994/01/24', 'm', '2312076656', 'Encargado de aseo', 'mapaches.info', '2023/08/29 12:40:01'),
(35, 'Ignacio', 'Ordaz', '2000/05/08', 'm', '2312012356', 'Ando bien feliz', 'mapaches.info', '2023/08/29 12:40:02'),
(36, 'Rigoberto', 'Sosa', '2001/09/08', 'm', '2312078956', 'Estudiante de maestria', 'mapaches.info', '2023/08/29 12:40:03'),
(37, 'Samuel', 'Castillo', '2001/04/02', 'm', '2312099656', 'Abogado', 'mapaches.info', '2023/08/29 12:40:08'),
(38, 'Ernesto', 'Juarez', '1998/02/27', 'm', '2312026356', 'Sin empleo', 'mapaches.info', '2023/08/30 10:45:00'),
(39, 'Gilberto', 'Flores', '2005/02/06', 'm', '2312018656', 'Buscando pareja', 'mapaches.info', '2023/08/30 10:50:00'),
(40, 'Rodrigo', 'Rosas', '1990/09/03', 'm', '2312038656', 'Divorciado', 'mapaches.info', '2023/08/30 11:50:00');

select * from userinfo;

-- C02 Obtener el nombre y apellido del usuario (userinfo), además
-- de indicar si es un usuario activo en el sistema o no
select * from userinfo;
select ui.name, ui.lastname, u.status from userinfo as ui
join users as u
on ui.id = u.id;

-- C03. Obtener el nombre completo del usuario, su username y su perfil
-- users, userinfo, profiles
use blogg;
select username from users;
select profile from profiles;
select concat(name, " ", lastname) as 'Nombre completo' from userinfo;

select p.profile, u.username, concat(ui.name, " ", ui.lastname) as 'Nombre real del usuario'
from profiles p
join users u on u.profile = p.id
join userinfo ui on u.id = ui.id;


-- insertar datos en tabla categories
INSERT INTO categories (category, description)
VALUES ('Informativa', 'Publicaciones acerca de información diaria del pais'),
('Entretenimiento', 'Publicaciones acerca de videojuegos y sus lanzamientos'),
('Policiaca', 'Publicaciones acerca de noticias de nota roja'),
('Ficción', 'Publicaciones de inteligencia artificial'),
('Tecnologia', 'Publicaciones acerca de tecnologia e innovacion'),
('Novedades', 'Publicaciones acerca de chismes'),
('Educativa', 'Publicaciones acerca de educacion regional, estatal y nacional'),
('Financiera', 'Publicaciones acerca del incremento de la moneda nacional y mas'),
('Politica', 'Publicaciones acerca de partidos politicos, debates, elecciones y el INE'),
('Seccion LGBT', 'Publicaciones sobre la comunidad'),
('Deportes', 'Publicaciones sobre futbol, baloncesto, beisbol y mas'),
('Memes', 'Publicaciones y fotos de los momazos mas divertidos'),
('Videos graciosos', 'Publicaciones de videos chistosos'),
('Videos de accidentes', 'Publicaciones de videos tragicos'),
('Videos de terror', 'Publicaciones de videos que te haran llorar del susto'),
('Cultural', 'Publicaciones sobre la cultura mexicana, tradiciones, comida y demas'),
('Modelaje', 'Publicaciones sobre Victoria Secret'),
('Musical', 'Publicaciones sobre las notas mas recientes en el mundo de la musica'),
('Danza y arte', 'Publicaciones sobre el arte del pais'),
('Estilismo', 'Publicaciones sobre estilistas, peinados y recomendaciones');

select * from categories;

-- insertar datos en tabla posts
INSERT INTO posts (category, autor, title, content, created_at)
VALUES (1, '21', 'El noticiero de Lopez Doriga', 'Este noticiero dara comienzo a las 9:30 en punto por televisa', '2023/08/29 10:00:00'),
(2, '22', 'La casa de los famosos', 'La ganadora del programa fue la chica del video estamos perdidas', '2023/08/29 10:00:01'),
(3, '23', 'Muerte a los payasos', 'Un niño ataca a balazos a dos payasos, era vitor y albertano', '2023/08/29 10:00:03'),
(4, '24', 'Harry Potter', 'La saga mas aburrida que hayas podido ver durante lo que llevas de vida', '2023/08/29 10:00:04'),
(5, '25', 'ChatGPT', 'La aplicación mas utilizada del mes de septiembre en lo que va del año', '2023/08/29 10:00:05'),
(6, '26', 'Thalia se opero', 'La famosa Maria la del barrio se hizo cirugia en la nariz para que se le vea mejor', '2023/08/29 10:10:00'),
(7, '27', 'Libros  SEP', 'Los nuevos libros que salieron por parte del gobierno estan mal redactados con lenguaje inclusivo falso', '2023/08/29 10:11:00'),
(8, '28', 'El peso sube', 'La moneda nacional mexicana esta casi igual que el dolar', '2023/08/29 10:12:00'),
(9, '29', 'AMLO tiene covid', 'El presidente de Mexico esta enfermo y todo apunta a que fue culpa de sheinbaum', '2023/08/29 10:13:00'),
(10, '30', 'La homofobia', 'La homofobia hace referencia a tenerle miedo a los gays, y los gays no dan miedo', '2023/08/29 10:14:00'),
(11, '31', 'NBA', 'Stephen Curry es el basquetbolista mejor pagado de la temporada', '2023/08/29 10:15:00'),
(12, '32', 'Seccion nueva', 'En al extremo, el nuevo meme de hoy es el de se me quito xD', '2023/08/29 10:15:50'),
(13, '33', 'Video de perrito', 'Mira al perrito como baila Juana la cubana', '2023/08/29 10:16:00'),
(14, '34', 'Video de choque', 'Choque brutal entre camion y carro en la carretera Amozoc Perote', '2012/08/29 10:20:00'),
(15, '35', 'La mano del chango', 'Este video te hara saltar del susto cuando le veas la mano al chango', '2023/08/29 10:30:00'),
(16, '36', 'Septiembre colorido', 'El exito de el viajero es numero 1 representando a la cultura mexicana', '2023/08/29 10:40:00'),
(17, '37', 'Esposa de Adam Levine', 'La modelo ucraniana se posiciona en el numero 9 como la mas bella mundialmente', '2015/08/29 11:00:00'),
(18, '38', 'Michael Jackson', 'Habra nueva edicion del disco Xscape del 2014 remasterizada', '2008/08/29 11:20:00'),
(19, '39', 'Primer lugar', 'Mexico ha ganado el primer lugar en concurso de danza folclorica', '2023/08/29 11:30:00'),
(20, '40', 'Uñas', 'Estudios recientes han observado que el nude ha sido el color mas utilizado para cuidado de manicure', '2023/08/29 12:00:00');
select * from posts;





SELECT *FROM users ORDER BY status DESC;
SELECT * FROM users ORDER BY username ASC;

-- Consulta de la información del usuario por apellido
SELECT * FROM userinfo ORDER BY lastname ASC;
-- Consulta del cumpleaños desde la información de un usuario
SELECT birthday AS cumpleaños FROM userinfo;

-- Ejemplos de consultas del foro
select * from users where username like "charly";

-- mostrar username,status y created_at, dentro de una fecha estimada
SELECT username, status,created_at from users WHERE created_at >= '2022-01-01' AND created_at < '2023-12-01';

-- mostrar username y password donde el perfil sea 'editor'
select username, password from users where profile = 1;

-- de acuerdo a el estatus, si este es "Verdadero" muestra el usuario y una tabla llamada "Estado" 
-- con el estado en el que se encuentra, en caso de ser "falso", se muestra como inactivo
SELECT us.username,
us.status,
CASE WHEN us.status >= 1 THEN 'Activo' ELSE 'Inactivo' END AS `ESTADO`
FROM users AS us ;

-- "LIKE" se utiliza cuando se desea devolver la fila, si una cadena de caracteres específica coincide con un patrón específico.
SELECT * FROM users WHERE username LIKE "%pe";

-- "LIMIT" se usa para restringir los registros que se retornan en una consulta "select", 
SELECT * FROM users ORDER BY id LIMIT 10,2;

-- Mostrar password, primero activos y despues los inactivos
select * from users order by password asc, username desc;

-- Mostrar la contraseña, luego el usuario y finalmente la fecha.
select password, username, created_at from users;

SELECT * FROM users WHERE id BETWEEN 31 and 33;
-- muestra los usuarios del 21 al 23

SELECT * FROM users WHERE password LIKE 'sd%';
-- muestra las password de los usuarios que empiecen con "2000"

-- Devuelve los valores consultados para que se pueda comparar con los demás valores agregados en la base.
SELECT * FROM users WHERE username = "daniel";

-- Muestreo de password para visualizar a los usuarios activos e inactivos (en ese orden respectivamente)
SELECT * FROM users ORDER by 'password ASC, username' desc;

create table products(
id int not null auto_increment,
name varchar (150) not null,
constraint unique_name unique(name),
description text not null,
purchase_price float not null,
unit_price float not null,
min_stock int not null,
max_stock int not null,
stock int not null,
dimensions varchar (155) null,
weight float null,
observation varchar (255) null,
status tinyint default 1,
category int not null,
created_at datetime,
updated_at datetime null,
deleted_at datetime null,
discontinued boolean default false,
constraint fk_category_product
foreign key (category) references categories (id),
primary key (id)
);

describe comments;
select * from posts;

describe posts;
describe users;

select count(*) from categories;
select count(*) from posts;

select * from comments;
select* from posts;

-- View de posts activos
create view posts_activos as
	select * from posts where status = true;

select * from posts_activos;
select category, title from posts_activos;

-- View de posts escritos por mujeres
create view posts_escritos_por_mujeres as
	select p.title, u.id as uid, ui.id as uiid
		from posts as p join users as u
			on p.autor = u.id
				join userinfo as ui
					on u.id = ui.id 
						where ui.gender = 'f';
					
select uid, title from posts_escritos_por_mujeres;

-- View para obtener el nombre y apellido del usuario de los usuarios activos

create view usuarios_activos as
select ui.name, ui.lastname, u.status from userinfo as ui
join users as u
where u.status = 1;

-- View para obtener el título del post, autor y categoría de cada post
create view posts_autor_categoria as
select p.title, u.username, c.category
from posts as p join users as u
on p.autor = u.id join categories as c
on c.id = p.category;


create view status_autor as 
select username, status from users where status = 0;

create view titulo_y_categoria as
select p.title, c.category
from posts as p join categories as c
on p.category = c.id;

create view titulo_categoria_yautor as
select p.title, c.category, u.username
from posts as p join categories as c join users as u
on p.category = c.id;

create view titulo_categoria_contenido as 
select p.title, p.content, p.status, c.category, ui.name, ui.lastname
from posts as p join categories as c join userinfo as ui
on p.category = c.id;