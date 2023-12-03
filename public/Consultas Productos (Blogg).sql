use blogg;

-- 1. Lista todos los productos registrados.
select * from products;

-- 2. Lista los últimos 10 productos.
select * from products order by id desc limit 10; 
-- select * from products limit 90,100;

-- 3. Lista los primeros 3 productos.
-- select * from products limit 3;
-- select * from products order by id asc limit 3; 
select * from products limit 0,3;

-- 4. Lista los productos registrados en el mes de septiembre de 2023.
select * from products where created_at between '2023/09/01' and '2023/09/30';

-- 5. Lista todos los productos registrados de enero 2023 a septiembre de 2023.
select * from products where created_at between '2023/01/01' and '2023/08/30';

-- 6. Lista todos los productos registrados de enero 2023 a septiembre de 2023 exceptuando los registrados en el periodo de semana santa del año 2023.
select * from products
where created_at between '2023-01-01' and '2023-09-30'
and (created_at not between '2023-04-02' and '2017-07-08');

-- 7. Lista todos los productos ordenados de manera ascendente por unit_price.
select * from products order by unit_price asc;

-- 8. Lista todos los productos ordenados de manera ascendente por category.
select * from products order by category asc;

-- 9. Lista todos los productos con precios menores a $100.00 MXN.
select * from products where (unit_price <100.0);

--  10. Lista todos los productos con precios menores a $100.00 MXN que contengan observaciones.
select * from products where (unit_price <100.0) and observation=true;

-- 11. Lista el nombre del producto y la descripción de todos los productos registrados.
select name, description from products;

-- 12. Lista el nombre del producto y la descripción de los productos con precios mayores a $500.00 MXN.
select name, description from products where (unit_price >500.0);

-- 13. Devuelve la cantidad de productos registrados.
select count(*) from products;

-- 14. Devuelve la cantidad de productos registrados ordenados de forma descendente por status.


-- 15. Devuelve la cantidad de productos registrados donde se especifiquen la dimensiones del producto.

-- 16. Calcula el promedio del unit_price de la tabla products

-- 17. Devuelve la suma del stock de todos los productos.
-- 18. Devuelve el nombre y la descripción del producto o productos con el unit_price más bajo.
-- 19. Devuelve el nombre del producto, el purchase_price, el unit_price y la diferencia entre el purchase_price menos el unit price para determinar la cantidad en pesos mexicanos que se le gana a cada producto.


-- 20. Calcula el IVA sobre todos los productos y devuelve una tabla con el nombre del producto, el unit_price, una columna con el importe del IVA (16%) y una más con el unit_price + importe del IVA.
select name, unit_price, (unit_price * 0.16) as 'IVA(16%)',
(unit_price * 1.16) as 'Precio IVA'
from products;

-- 21. Aplica el 15% de descuento en todos los productos descontinuados. Devuelve una tabla con el nombre del producto, el unit price y el precio con descuento.
-- select id, name, discontinued from products where discontinued = 1;
select name, unit_price, (unit_price * 0.85) as 'Precio con descuento'
from products where discontinued =1;

-- 22. Aplica el 65% de descuento en todos los productos descontinuados y cuyo unit_price supera los $500.00 MXN. Devuelve una tabla con el nombre del producto, el unit price y el precio con descuento.
-- 23. Aplica el 85% de descuento en todos los productos descontinuados y cuyo unit_price se encuentra entre los $700.00 MXN y $999.99 MXN. Devuelve una tabla con el nombre del producto, el unit price, el precio con descuento.
-- 24. Devuelve el nombre de los productos cuyo weight supere los 5 kg.
select name from products where weight>5;

-- 25. Devuelve el nombre de los productos cuyo weight supere los 5 kg y cuyo precio sea menor a $100.00 MXN



-- Consultas de referencia miércoles 11 de Septiembre 2023

use blog;

-- 1. Lista todos los productos registrados.
select * from products;

-- 2. Lista los últimos 10 productos (+1 21te0131).
select * from products order by id desc limit 10;

-- 3. Lista los primeros 3 productos. (+1 21te0146)
select * from products order by id asc limit 3;

-- 4. Lista los productos registrados en el mes de septiembre de 2023.
select * from products where created_at BETWEEN '2023/09/01' AND  '2023/09/30';

-- 5. Lista todos los productos registrados de enero 2023 a septiembre de 2023.
select * from products where created_at BETWEEN '2023/01/01' AND  '2023/09/30';


-- 6. Lista todos los productos registrados de enero 2023 a septiembre de 2023 exceptuando los registrados en el periodo de semana santa del año 2023.
-- domingo 2 de abril Hasta: sábado 8 de abril (+1 21te0390)
-- select * from products WHERE created_at BETWEEN '2023/01/01' and '2023/04/02';
select * from products where created_at BETWEEN '2023/01/01' and '2023/09/30' and (created_at not BETWEEN '2023/04/02' and '2023/04/08');

-- 7. Lista todos los productos ordenados de manera ascendente por unit_price.
select * from products ORDER by unit_price asc;

-- 8. Lista todos los productos ordenados de manera ascendente por category.
select * from products order by category asc;

-- 9. Lista todos los productos con precios menores a $100.00 MXN.
select * from products where unit_price < 100.00;

-- 10. Lista todos los productos con precios menores a $100.00 MXN que contengan observaciones.
-- Para tema 2.3.1 -- select * from products WHERE unit_price < 100.00 

-- 11. Lista el nombre del producto y la descripción de todos los productos registrados
select name, description from products;

-- 12. Lista el nombre del producto y la descripción de los productos con precios mayores a $500.00 MXN.
select unit_price, name, description from products where unit_price > 500;

-- 13. Devuelve la cantidad de productos registrados.
select count(*) from products;


-- 14. Calcula el IVA sobre todos los productos y devuelve una tabla con el nombre del producto, el unit_price, una columna con el importe del IVA (16%) y una más con el unit_price + importe del IVA.
select name, unit_price, (unit_price * 0.16) as 'IVA(16%)',
	(unit_price * 1.16) as 'Precio + IVA'
	from products;


-- Aplica el 15% de descuento en todos los productos descontinuados. Devuelve una tabla con el nombre del producto, el unit price y el precio con descuento.
select name, unit_price, (unit_price * 0.85) as 'Precio con descuento' from products where discontinued = 1;




-- Consultas de referencia martes 19 de Septiembre 2023

use blogg;
-- Consultar el nombre del post y el nombre del autor
select * from posts;
select * from users;

-- JOIN -> UNIR

select posts.title, users.username
from posts join users
on posts.autor= users.id;-- campo en común entre posts y users

-- Consultar el nombre del post y el nombre del autor usando alias
select p.title, u.username
from posts as p join users as u
on p.autor = u.id;

-- Consultar el título y la categoría de todos los posts
select p.title, c.category
from posts as p join categories as c
on p.category = c.id;

-- Consultar título del post, autor y categoría de cada post
select * from posts;
select p.title, u.username, c.category
	from posts as p join users as u
		on p.autor= u.id
        join categories as c
        on c.id = p.category;
        
-- Crear un código conformado por las primeras dos letras del nombre de la categoría, las primeras dos letras del título del post y el id del autor
select 
concat (substring(c.category, 1, 2), 
substring(p.title, 1, 2),
u.id) as 'código',
c.category,
p.title,
u.id
from categories as c
	join posts as p
	on c.id = p.category
		join users as u
        on p.autor= u.id;
        
-- Mostrar el username del usuario y los comentarios que escribió
select u.username, p.id, c.message
from users as u
	join posts as p
	on u.id= p.autor
    join comments as c
    on p.id= c.post
    order by username asc;
    
select p.id, p.title, c.message
from posts as p
join comments as c
on p.id= c.post
where c.message like '%earum%';

select * from userinfo;

-- Listar el nombre real y número de teléfono del usuario que comentó el post con id 15

select concat (ui.name, ' ' ,ui.lastname) as 'Nombre completo', ui.phone
from userinfo as ui
join users as u
on ui.id= u.id
join posts as p
on p.autor= ui.id
where p.id = 15;