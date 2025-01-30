
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

