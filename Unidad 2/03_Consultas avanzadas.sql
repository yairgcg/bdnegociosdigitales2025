-- Joins
--			Syntaxis 
--	select * from TableA
--	inner join TableB
--	on PrimaryKey = Foreign Key

-- Seleccionar todas las categorías y productos
use Northwind
select C.CategoryID AS [Numero de Categoria], C.CategoryName as 'Nombre de Categoria', P.ProductName as 'Nombre de Producto', P.UnitsInStock as Existencia, P.UnitPrice as [Precio] from Categories as C
inner join Products as P
on C.CategoryID = P.CategoryID;

-- Seleccionar los productos de la categoría beverages y condiments donde la existencia esté entre 18 y 30
select CategoryName as [Nombre de categoria], P.ProductName as [Nombre de Producto] ,UnitsInStock as [Unidades en stock]  from Products as P
inner join Categories as C
on C.CategoryID= P.CategoryID
where (CategoryName in ('Beverages', 'Condiments')) and UnitsInStock between '18' and '30'

-- Seleccionar los productos y sus importes realizados de marzo a junio de 1996, mostrando la fecha de la orden,
-- el id del producto y el importe
select OrderDate, Id from Orders as O
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
where OrderDate between '1996-03-01' and '1996-07-31'

-- Consultar el formato de fecha 
select GETDATE()

select O.OrderID, O.OrderDate, OD.ProductID, (OD.UnitPrice * OD.Quantity) from Orders as O
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
where O.OrderDate between '1996-07-01' and '1996-10-31'

-- Seleccionar el importe total de ventas de la consulta anterior
select sum(OD.UnitPrice * OD.Quantity) as 'Dinero total' from Orders as O
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
where O.OrderDate between '1996-07-01' and '1996-10-31'

-- Consultas básicas por Inne Join
-- Obtener el nombre de los clientes y los países a los que enviaron sus pedidos

select O.CustomerID, O.ShipCountry from Orders as O
inner join Customers as C
on C.CustomerID = O.CustomerID
order by o.ShipCountry desc

select O.CustomerID as [Nombre contacto], ShipCountry as 'País' from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
order by 2 asc;

-- Obtener los productos y sus respectivos proveedores
select P.ProductName as [Nombre Producto], S.CompanyName [Nombre Compañía] from Products as P
inner join Suppliers as S
on P.SupplierID = S.SupplierID
order by 2 asc

-- Obtener los pedidos y los empleados que los gestionaron
select OrderID as [Orden ID], CONCAT (E.Title, '  ', E.FirstName, '  ', E.LastName) as 'Nombre' from Orders as O
inner join Employees as E
on O.EmployeeID = E.EmployeeID

-- Listar los productos juntos con sus precios y la categoría a la que pertenecen
select ProductName as [Nombre de Producto], UnitPrice as [Unidad de precio], C.CategoryID as CategoriaID from Products as P
inner join Categories as C
on C.CategoryID = P.CategoryID


-- OBTENER EL NOMBRE DEL CLIENTE, NUMERO DE ORDEN Y FECHA DE ORDEN
select CompanyName AS [Nombre compañía], OrderID as [OrderID], OrderDate as [Fecha de Orden] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID

select CompanyName AS [Nombre compañía], OrderID as [OrderID], OrderDate as [Fecha de Orden] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID

-- Listar las órdenes mostrando el número de órden, el nombre del producto y la cantidad que se vendió
select OrderID, ProductName, Quantity as [Cantidad Vendida]  from [Order Details] as OD
inner join Products as P
on OD.ProductID = P.ProductID
order by 3 desc

select OrderID, ProductName, Quantity as [Cantidad Vendida]  from [Order Details] as OD
inner join Products as P
on OD.ProductID = P.ProductID
where OD.OrderID = 11031
order by 3 desc

select * from [Order Details] as OD
inner join Products as P
on OD.ProductID = P.ProductID


-- CONSULTA CON RECURSIVIDAD DE LA TABLA EMPLOYEES

--  Obtener los empleados y sus respectivos jefes
select CONCAT (E1.FirstName, ' ', E1.LastName) as [Empleado], CONCAT (J1.FirstName, ' ',J1.LastName) as [Jefe]
from Employees as E1
inner join Employees as J1
on E1.EmployeeID = J1.EmployeeID

-- 8 Listar los pedidos y el nombre de la empresa de transporte utilizada 
select ShipName, CompanyName  from Orders as O
inner join Shippers as S
on S.ShipperID = O.ShipVia

-- Consulta de joins intermedias

-- Obtener la cantidad total de productos por categoría
select sum(Quantity) as [Cantidad total], C.CategoryName as [Nombre de Categoria] from [Order Details] as OD
inner join Products as P
on OD.ProductID = P.ProductID
inner join Categories as C
on P.CategoryID = C.CategoryID
GROUP BY CategoryName
Order By C.CategoryName 

-- Obtener el total de ventas por empleado
select CONCAT(E.FirstName, ' ', E.LastName) as [Nombre Completo], (Quantity * UnitPrice - Discount)as [Total de ventas por empleado] from Employees as E
inner join Orders as O
on E.EmployeeID = O.EmployeeID 
inner join [Order Details] as OD
on O.OrderID = OD.OrderID   

select CONCAT(E.FirstName, ' ', E.LastName) as [Nombre Completo], sum((Quantity * UnitPrice) * Discount)as [Total de ventas por empleado] from Employees as E
inner join Orders as O
on E.EmployeeID = O.EmployeeID 
inner join [Order Details] as OD
on O.OrderID = OD.OrderID   


select count(*) from Orders as O

select * from Orders as O
where EmployeeID = 1

select * from Orders as O
where EmployeeID = 1

select * from Orders as O
inner join Employees as E
on O.EmployeeID = E.EmployeeID
INNER JOIN [Order Details] as OD
on OD.OrderID = O.OrderID


