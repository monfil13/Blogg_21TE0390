use blogg;

-- 1.Mostrar todos los registros de la tabla posts
select * from posts;

-- 2. Mostrar el título y el contenido de las tablas posts
select title, content from posts;

-- 3. Mostrar la información de los posts del mes de agosto del 2023
select * from posts where created_at between '2023/08/01' and '2023/08/30';

-- 4. Mostrar el título de los post en mayúsculas
select upper(title) from posts;

-- 5. Mostrar la información de los últimos 10 registros realizados.
select * from posts
order by id
limit 10, 20;

-- 6. Mostrar los posts creados entre el 2010 y 2020.
select * from posts where created_at between '2010/01/01' and '2020/12/31'; 

-- 7. Mostrar los posts creados entre el 2020 y 2023 que tengan estado inactivo.
select distinct created_at, status
from posts
where (status=0)
and (created_at between '2020/01/01' and '2023/12/31');

-- 8. . Mostrar los posts creados entre el 2022 y 2023 que tengan estado inactivo y ordenarlos de manera ascendente por título.
select distinct created_at, status,  title, created_at FROM posts
where (created_at between '2022/01/01' and '2023/12/31')
and (status=0)
order by title asc;

-- 9. Mostrar los posts creados entre el 2010 y 2020 que tengan estado inactivo y ordenarlos de manera ascendente por título y por fecha de creación.
select distinct created_at, status,  title, created_at FROM posts
where (created_at between '2010/01/01' and '2020/12/31')
and (status=0)
order by title and created_at asc;

-- 10. Mostrar el id y titulo de los post en una nueva columna con nombre ‘Resumen’ siempre y cuando su estado sea activo y ordenarlos de manera ascendente por fecha de creación.
select pt.id, pt.title, pt.status,
case when pt.status >= 1 then id and title end as Resumen
from posts AS pt;

-- 11. Devolver el largo en caracteres del título de los primeros 5 posts.
select title from posts
order by id
limit 0, 5;

-- 12. Devolver la cantidad de palabras contenidas en el content de los cinco registros más recientes de la tabla posts.
-- 13. Devolver el número de posts escritos por autor.

-- 14/15. Devolver todos los posts que contengan una palabra definida por usted.
select * from posts where title like "ChatGPT";

-- 16. Devolver todos los títulos de posts que sean menores a 100 caracteres en su contenido.
SELECT pt.title,
CASE WHEN pt.title < 100 THEN title ELSE 'Inactivo' END AS `Titulo menor a 100 caracteres`
FROM posts AS pt ;

-- 17. Devolver todos los títulos de los posts con la leyenda “Post activo” si es que el status es 1 y ‘Post inactivo’ si es que el status es 0
SELECT pt.title, pt.status,
CASE WHEN pt.status < 100 THEN title ELSE 'Post inactivo' END AS `Post activo`
FROM posts AS pt ;

-- 18. Devolver todos los títulos de los posts con la leyenda ‘Post activo’ si es que el status es 1 y ‘Post inactivo’ si es que el status es 0, además ordenar los resultados en orden alfabético.
SELECT pt.title, pt.status,
CASE WHEN pt.status < 100 THEN title ELSE 'Post inactivo' END AS `Post activo`
from posts as pt
order by title asc;

-- 19. Devolver todos los títulos de los posts con la leyenda ‘Post activo’ si es que el status es 1 y ‘Post inactivo’ si es que el status es 0, además ordenar los resultados en orden alfabético y primero los que tienen la leyenda ‘Post activo’
SELECT pt.title, pt.status,
CASE WHEN pt.status < 100 THEN title ELSE 'Post inactivo' END AS `Post activo`
from posts as pt
order by title asc;

-- 20. Devolver el título de todos los posts con la leyenda ‘Título largo’ si la cantidad de caracteres en el title supera los 150. En caso contrario no mostrar leyenda.
SELECT pt.title,
CASE WHEN pt.title > 150 THEN title ELSE 'No' END AS `Título largo`
from posts as pt;

-- 21. Devolver el título de todos los posts con la leyenda ‘Título largo’ si la cantidad de caracteres en el title supera los 150. En caso contrario no mostrar leyenda. Además, ordenar por id en forma descendente.
SELECT pt.title,
CASE WHEN pt.title > 150 THEN title ELSE 'No' END AS `Título largo`
from posts as pt
order by id desc;

-- 22. Devolver los títulos de los posts con una columna adicional compuesta por el id del post, el id del autor, el id de la categoría y las primeras cuatro letras del post. Eliminar espacios en caso necesario. Ejemplo de salida: 256Deci.
-- 23. Devolver los títulos de los posts con una columna adicional con nombre ‘clave’ compuesta por el id del post, el id del autor, el id de la categoría y las primeras cuatro letras del post en mayúsculas. Eliminar espacios en caso necesario. Ordenar los post en forma ascendente a través de la nueva columna. 
-- 24. Obtener los últimos tres post con ‘Título largo’ de la consulta 21.
SELECT pt.title,
CASE WHEN pt.title > 150 THEN title ELSE 'No' END AS `Título largo`
from posts as pt
order by id desc
limit 0,3;

-- 25. Obtener los post con id 3 a 8.
SELECT pt.id
from posts as pt
limit 3,5;

-- 26. Obtener todos los posts exceptuando del post 5 al post 20.
SELECT * FROM posts WHERE category<5;

-- 27. Obtener 10 posts creados entre el 01 de septiembre al 03 de septiembre.
select created_at from posts
where (created_at between '2023/09/01' and '2023/09/01')
limit 20, 10;

-- 28. Obtener la cantidad de posts creados entre el 01 de septiembre al 03 de septiembre con “Título largo”.
-- 29. Obtener todos los posts por categoría en forma ascendente.
select * from posts
order by category asc;

-- 30. Obtener el título y contenido de todos los registros ordenados de manera ascendente por id, descendente por categoría, ascendente por autor y descendente por status 
select title, content from posts
order by id asc, category desc, autor asc, status desc;









-- VISTAS EN MYSQL

-- Vista del total de posts escritos 
create view posts_totales as
select count(*) as "totalPublicaciones" from users;

-- Vista de posts escritos por autores cuyo nombre comienza con "D"
create view posts_escritos_por_autoresD as
select p.id, p.category, p.title,ui.name as uiname, ui.lastname as uilastname
from posts as p join users as u
on p.autor = u.id
join userinfo as ui
on u.id = ui.id
where ui.name like 'D%';

-- Vista para obtener el título del post, autor y categoría de todos los posts
create view posts_por_autor_y_categoria as
select p.title, u.username, c.category
from posts as p join users as u
on p.autor = u.id join categories as c
on c.id = p.category;


-- Vista de posts, nombre y título del post
create view nombre_de_autor_y_titulo_post as 
select p.title as titulo, u.username as autor
from posts as p join users as u 
on p.autor = u.id;


-- Vista de posts, autor y categoria
create view posts_por_autor_categoria as 
select p.title, u.username, c.category
from posts as p join users as u 
on p.autor= u.id
join categories as c
on c.id = p.category; 