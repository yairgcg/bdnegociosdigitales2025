
-- Lenguaje SQL LLM (Insert, Update, Select, Delete)
-- Consultas simples
use Northwind;

-- Consulta 1
-- Mostrar todos los clientes de la empresa, proveedores, categorias, productos, ordenes, detalles de la orden, empleados
select * from Customers;
select * from Employees;
select * from Orders;
select * from Suppliers;
select * from Categories;
select * from Products;
select * from [Order Details]; -- Se coloca entre corchetes porque lleva un espacio
select * from Shippers;

-- Consulta 2
-- Proyeccion

select ProductID, ProductName, UnitPrice 
from Products;

-- Consulta 3
-- Seleccionar o mostrar el numero de empleado, su primer nombre, su cargo, ciudad y pais
select * from Employees;

select EmployeeID, FirstName, Title, City, Country from Employees;

-- Alias de columna
-- En base a la consulta anterior, visualizar el employedid como numerommpleado, firstname como primerNombre, title co,o cargo
-- city como ciudad, country como pais

select EmployeeID as numeroEmpleado, FirstName as [primerNombre], Title as 'cargo', City as ciudad, Country as pais
from Employees; -- El as sirve para crear un alias. A la hora de hacer consultas aparecerá como el nombre que le hayamos puestoo

-- Campos calculados
-- Seleccionar el importe de cada uno de los productos vendidos en una orden
select *,(UnitPrice * Quantity) as Importe 
from [Order Details]

-- Seleccionar las fechas de orden, año, mes y dia, el cliente que las ordenó y el empleado que la realizó
select year (OrderDate) as anoOrden, MONTH (OrderDate) as mesOrden, day(OrderDate) as diaOrden, CustomerID, EmployeeID from Orders;

-- Claúsula where
-- Operadores relacionales (<, < <=, >=, !=, <>)
select * from Customers;

-- Seleccionar el cliente Bolid
select CustomerID as clienteID, CompanyName as nombreComania, City as ciudad, Country as pais from Customers
where CustomerID = 'Bolid';


select CustomerID as ClienteID, companyName as nombreCompania, ContactName as nombreContacto, City as ciudad, Country as pais
from Customers
WHERE Country = ('Germany');

--Seleccionar todos los clientes que no sean de Alemania
select CustomerID as ClienteID, companyName as nombreCompania, ContactName as nombreContacto, City as ciudad, Country as pais
from Customers
WHERE Country not in ('Germany');

-- Seleccionar todos los productos mostrando su nombre de producto, categoria a la que pertenecen, sus unidades de existencia, precio pero solamente 
-- donde su precio sea mayor a 100 y mostrar su importe
select * from Products;
select ProductName, CategoryID, UnitsInStock,UnitPrice, (UnitPrice * UnitsInStock) as 'costoInventario' from Products where UnitPrice > 100;

-- Selecionar las ordenes de compra, mostrando la fecha de orden, la fecha de entrega, la fecha de envio, el cliente al que 
-- se vendio de 1996

select * from Orders;
select year(OrderDate) as anoFecha, MONTH (OrderDate) mesFecha, DAY(OrderDate) as diaFecha, 
		year(OrderDate) as anoEntrega, MONTH (OrderDate) mesEntrega, DAY(OrderDate) as diaEntrega,
		year(ShippedDate) as anoRecibido, MONTH (ShippedDate) mesRecibido, DAY(ShippedDate) as diaRecibido,
		CustomerID as 'Cliente'
		from Orders
		where year(OrderDate) = '1996';


-- Mostrar todas las oedenes de compra selecionar 

	select Quantity
	from [Order Details] where Quantity >= 40;

	-- Mostrar el nombre completo del empeado , numero de empleado , 
	-- fecha de nacimiento , cyti y fecha de contratacion 
	-- deve ser mavor de 1993 los resutados en sus encabesados deven ser mostrados en español

	select 
	(FirstName + ' ' +
	LastName) as 'Nombre completo',
	EmployeeID AS 'Numero de Empleado',
	BirthDate AS 'Fecha Nacimiento',
	City AS 'Ciudad',
	HireDate as 'Fecha de contratación'
	from Employees
	where year (HireDate) > 1993;

	select 
	Concat (FirstName, '' ,LastName) as [Nombre completo],
	EmployeeID AS 'Numero de Empleado',
	BirthDate AS 'Fecha Nacimiento',
	City AS 'Ciudad',
	HireDate as 'Fecha de contratación'
	from Employees
	where year (HireDate) > 1993;


	-- Mostrar os emeplados que no son dirigidos por el jefe 2
select * from Employees;
select EmployeeID, ReportsTo 
from Employees 
where ReportsTo != '2' and ReportsTo is null;

-- OPERADORES LOGICOS (OR, AND Y NOT)
-- Seleccionar los productos que tengan un precio de entre 10 y 50 dolares

select ProductName as NombreProducto, UnitPrice as PrecioProducto, UnitsInStock as ExistenciaProducto 
from Products
where UnitPrice >= 10 and UnitPrice <= 50;

-- Mostrar todos los pedidos realizados por clientes que no son enviados a alemania

select * from Orders;
select * from Customers;

select * from Orders where ShipCountry <> 'Germany';

select * from Orders where not ShipCountry = 'Germany';

-- Seleccionar clientes de Mexico o Estados Unidos

select * from Customers
where Country= 'Mexico' or country = 'USA';

-- Seleccionar empleados que nacieron entre 1955 y 1958 y que vivan en Londre

select * from Employees
where (year (BirthDate) >= '1955' and year (BirthDate) <= '1958') and City = 'London'
;

-- Seleccionar los pedidos con flete de peso(Freight) mayor a $100 y enviado a Francia o España
select * from Orders;
select OrderID, OrderDate, ShipCountry, Freight from Orders 
where Freight > 100 and (ShipCountry = 'France' or ShipCountry = 'Spain');

-- Seleccionar las top cinco ordenes de compra 
select top 5 * from orders;

-- Seleccionar los productos que tengan un precio entre $10 y %50
select * from Products;
select ProductName as NombreProducto, UnitPrice as PrecioProducto, Discontinued as Descontinuado, UnitsInStock as Existencia from Products
where UnitPrice >= 10 and UnitPrice <= 50 and Discontinued !=1 and UnitsInStock > 20;

-- Pedidos enviados a Francia o Alemania
select OrderID, ShipCountry, Freight from Orders
where (shipcountry = 'France' or ShipCountry = 'Germany');

-- Clientes que no sean de Mexico o USA y que tengan fax registrado
select Country, City, fax from Customers
where (country != 'Mexico' or country != 'USA') and Fax is not NULL;

select Country, City, fax from Customers
where (country != 'Mexico' and country != 'USA') and Fax is not NULL;

-- Tarea
-- Seleccionar pedidos con un flete mayor a $100, enviados a Brasil o Argentina pero no enviados por el transportista 1
select * from Shippers;

-- Seleccionar empleados que no viven en Londres o Seattle 
select concat(FirstName, '', LastName) as 'Nombre Completo', HireDate, Country, city
from Employees  
where not (city = 'London' or City = 'Seattle')
and year(HireDate) >= 1992;

select concat(FirstName, '', LastName) as 'Nombre Completo', HireDate, Country, city
from Employees  
where not city <> 'London' and City <> 'Seattle'
and year(HireDate) >= 1992;

-- Clausula IN (or)
-- Seleccionar los productos con categoria 1, 3, 5

select ProductName, CategoryID, UnitPrice from products
where CategoryID in (1,3,5);


-- Clausula Between
select ProductName, CategoryID, UnitPrice from products
where CategoryID = 1 or CategoryID = 3 or CategoryID = 5;

-- Seleccionar todas las ordenes de la región RJ, Tachira, y que no tengan region
select OrderID, OrderDate, ShipRegion from Orders;
select ShipRegion from Orders
where ShipRegion in ('RJ', 'Táchira', 'null') or ShipRegion is null;

-- Seleccionar las ordenes que tengan cantidades de 12, 9 y 40 y descuento de 0.15 y 0.5 o 0.05
select * from Orders;
select * from [Order Details];
select OrderID, Quantity, Discount from [Order Details]
where Quantity in (12, 9, 40) and Discount in (0.15, 0.05)
