use tienda1;

create table productos1(
	productoid int not null,
    nombreProducto varchar(20) not null,
    descripcion varchar (80),
    precio decimal(10,2)  not null, -- El decimal se utiliza para valores monetarios
    existencia int not null,
	
    categoriaid int null,
    
    constraint pk_producto1
    primary key (productoid),
	constraint unico_descripcion
	unique (nombreProducto),
    constraint chk_precio
    check (precio>0.0 and precio<=1000),
	constraint chk_existencia
    check (existencia >0.0 and existencia <= 200),
    constraint fk_categoria_producto1
    foreign key (categoriaid)
    references categoria(categoriaid)
    
)

