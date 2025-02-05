 
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

	-- Mostrar los emeplados que no son dirigidos por el jefe 2
select * from Employees;
select EmployeeID, ReportsTo 
from Employees 
where ReportsTo != '2' and ReportsTo is null;

-- Clausula Betwenn 
-- between valor inicial and 
-- Mostrar los productos con precio entre 10 y 50

select * from Products;
select ProductName, UnitPrice from Products
where UnitPrice >= 10 and UnitPrice <= 50
;

select ProductName as NombrePorudcto, UnitPrice as PrecioProducto from Products
where UnitPrice between 10 and 50;

-- Seleccionar todos los pedidos realizados desde el primer de enero y 30 de junio de 1997

select * from Orders;
select OrderID, OrderDate from Orders
where  OrderDate between '1997-01-01' and '1997-06-30';

select OrderID, OrderDate from Orders
where OrderDate >= '1997-01-01' and OrderDate <= '1997-06-30';

-- Seleccionar todos los empleados contratados entre 1990 y 1995 que trabajan en Londres
select * from Employees;
select LastName as Apellido, FirstName as Nombre, HireDate as AñoContratacion, City as Ciudad from Employees
where year(HireDate) between 1992 and 1994 and City = 'London';

-- Pedidos con flete (Freight) entre 50 y 200 enviados a Alemania y Francia
select * from Orders;
select OrderID as OrdenID, Freight as Peso, ShipCountry as PaisEnvio from Orders
where Freight between '50' and '200' and ShipCountry='Germany' or ShipCountry='France';

-- Seleccionar todos los productos que tengan un precio entre 5 y 20 dolares o que sean de la categoria 1, 2 o 3
select * from Products;
select ProductName as [Nombre Producto], UnitPrice as [Precio Producto], CategoryID as [Categoria Producto] from Products
where UnitPrice between 5 and 20 and CategoryID in (1, 2, 3);

-- Empleados con numero de trabajador entre 3 y 7 que no trabajan en Londres y Seattle 
select * from Employees

select EmployeeID as [Empleado ID], LastName as [Apellido Empleado], FirstName as [Nombre Empleado], City as [Ciudad Empleado] from Employees
where (EmployeeID between 3 and 7) and City not in ('London', 'Seattle')

-- Clausula Like
-- Patrones :
-- 1) % (Porcentaje) Representa 0 o mas caracteres en el patrón de búsqueda
-- 2) _ (guion bajo) Representa exactamente un caracter en el patrón de busqueda
-- 3) [] Corchetes -> Se utiliza para definir un conjuto de caracteres buscando cualquiera de ellos en la posicion especifica
-- [] -> Se utiliza para buscar caracteres que no estan dentro del conjunto especifico 

--Buscar los productos que comiencen con cha
select * from Products
where ProductName like 'cha%' and UnitPrice = '18';

-- Buscar todos los productos que terminen con E
select * from Products
where ProductName like '%E'

-- Seleccionar todos los clientes cuyo nombre de empresa contiene la palabra "co" en cualquier parte
select CompanyName, CustomerID from Customers
where CompanyName LIKE '%co%'

-- Seleccionar los empleados cuyo nombre comience con A y tenga exactamente 5 caracteres
select FirstName, LastName from Employees
where FirstName like 'A_____';

-- Seleccionar los productos que comiencen con A o B
use Northwind;
select * from Products
where ProductName like '[A-M]%';

-- Muestra los productos de un rango
select * from Products
where ProductName like '[A-M]%';

-- Seleccionar todos los productos que no comiencen con A o V
select * from Products
where ProductName like '[^AB]%';

-- Seleccionar todos los productos donde el nombre comience con A pero no contenga la E
select * from Products
where ProductName like 'A%' and ProductName like '[^E]%';

-- Clausula Order By 
SELECT ProductID, ProductName, UnitPrice, UnitsInStock FROM Products
order by UnitPrice asc;

SELECT ProductID, ProductName, UnitPrice, UnitsInStock FROM Products
order by UnitPrice desc;

SELECT ProductID, ProductName, UnitPrice as Precio, UnitsInStock FROM Products
order by Precio desc;

--Seleccionar los clientes ordenados por el país y dentro por ciudad
select CustomerID ,Country,City  from Customers
order by Country,City asc ;

select CustomerID, Country,City  from Customers
where Country in ('Brazil', 'Germany')
order by Country asc, City desc;

select CustomerID, Country,City  from Customers
where (Country = 'Brazil' or Country = 'Germany')
and Region is not null
order by Country, City desc;

