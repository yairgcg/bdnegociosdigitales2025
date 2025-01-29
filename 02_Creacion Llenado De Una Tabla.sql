/* Creación de la base de datos tienda 1*/

create database tienda1;  	/* Crea la base de datos tienda 1*/
use tienda1; 	/* Utiliza la base de datos */


create table categoria (
categoriaid int not null,
nombre varchar (20) not null,

constraint pk_categoria 
primary key(categoriaid),

constraint unico_nombre 
unique(nombre)
);


insert into categoria 		-- Crea un registro  
values (
1,
'Carnes frías'
);

insert into categoria (categoriaid, nombre)
values (
2,
'Linea blanca'
);

insert into categoria(nombre, categoriaid)
values (
'Vinos y licores',
3
);

insert into categoria
values (4, 'Ropa'),
(5, 'Dulces'),
(6, 'Cremeria');

insert into categoria(nombre, categoriaid)
values (
'Panaderia',
7
),
('Zapateria', 8),
('Jugueteria', 9);

select * from categoria order by nombre desc; 	-- Checa toda la informacion de una tabla

insert into categoria
values (10, 'Cremeria');

## Diagrama Resultante
!(Diagrama Resultante)[./images/DiagramaPrincipal]