# Consultas Avanzadas


Consultas haciendo uso de INNER JOINS con group by y having

```sql

-- Joins
--			Syntaxis 
--	select * from TableA
--	inner join TableB
--	on PrimaryKey = Foreign Key

-- Seleccionar todas las categor�as y productos
use Northwind
select C.CategoryID AS [Numero de Categoria], C.CategoryName as 'Nombre de Categoria', P.ProductName as 'Nombre de Producto', P.UnitsInStock as Existencia, P.UnitPrice as [Precio] from Categories as C
inner join Products as P
on C.CategoryID = P.CategoryID;

-- Seleccionar los productos de la categor�a beverages y condiments donde la existencia est� entre 18 y 30
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

-- Consultas b�sicas por Inne Join
-- Obtener el nombre de los clientes y los pa�ses a los que enviaron sus pedidos

select O.CustomerID, O.ShipCountry from Orders as O
inner join Customers as C
on C.CustomerID = O.CustomerID
order by o.ShipCountry desc

select O.CustomerID as [Nombre contacto], ShipCountry as 'Pa�s' from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
order by 2 asc;

-- Obtener los productos y sus respectivos proveedores
select P.ProductName as [Nombre Producto], S.CompanyName [Nombre Compa��a] from Products as P
inner join Suppliers as S
on P.SupplierID = S.SupplierID
order by 2 asc

-- Obtener los pedidos y los empleados que los gestionaron
select OrderID as [Orden ID], CONCAT (E.Title, '  ', E.FirstName, '  ', E.LastName) as 'Nombre' from Orders as O
inner join Employees as E
on O.EmployeeID = E.EmployeeID

-- Listar los productos juntos con sus precios y la categor�a a la que pertenecen
select ProductName as [Nombre de Producto], UnitPrice as [Unidad de precio], C.CategoryID as CategoriaID from Products as P
inner join Categories as C
on C.CategoryID = P.CategoryID


-- OBTENER EL NOMBRE DEL CLIENTE, NUMERO DE ORDEN Y FECHA DE ORDEN
select CompanyName AS [Nombre compa��a], OrderID as [OrderID], OrderDate as [Fecha de Orden] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID

select CompanyName AS [Nombre compa��a], OrderID as [OrderID], OrderDate as [Fecha de Orden] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID

-- Listar las �rdenes mostrando el n�mero de �rden, el nombre del producto y la cantidad que se vendi�
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

-- Obtener la cantidad total de productos por categor�a
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


-- Listar los clientes y la cantidad de pedidos que han realizado
select CompanyName as Cliente, COUNT(*) as [Numero de �rdenes]  from Customers as C
inner join Orders as O
on  C.CustomerID = O.CustomerID
group by CompanyName
order by [Numero de �rdenes]


-- Obtener los empleados que han gestionado pedidos enviados a Alemania
select distinct CONCAT(FirstName, ' ', LastName) as [Nombre completo], O.CustomerID, O.ShipCountry from Employees as E
inner join Orders as O
on E.EmployeeID = O.EmployeeID 
where O.ShipCountry = 'Germany'

select * from Orders


-- Listar los productos junto con el nombre del proveedor y el pa�s de origen
select ProductName as [Nombre Producto], CompanyName as [Proveedor], Country as [Pais de origen] from Products as P
inner join Suppliers as S
on P.SupplierID = S.SupplierID
order by 1 

-- Obtener los pedidos agrupados por pa�s de env�o 
select OrderID, ShipCountry as [Pa�s de envio], COUNT(OrderID) as [Numero de ordenes] 
from Orders as O
group by o.ShipCountry
order by 2


-- Obtener los empleados y la cantidad  de territorios en los que trabaja
select E.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) as [Nombre Completo], count(et.TerritoryID) from Employees as E
inner join EmployeeTerritories as ET
on E.EmployeeID = ET.EmployeeID
inner join Territories as T
on ET.TerritoryID = T.TerritoryID
group by CONCAT(FirstName, ' ', LastName) 


-- Listar las categor�as y la cantidad de productos que contienen
select C.CategoryName, P.ProductName ,count(ProductID) as [Cantidad de Productos] from Categories as C
inner join Products as P
on C.CategoryID = P.CategoryID
group by C.CategoryName
order by 2 desc

-- Obtener la cantidad total de productos vendidos por proveedor
select S.CompanyName, P.ProductName, SUM(od.Quantity) as [Total de Productos vendidos] from Suppliers as S
inner join Products as P
on S.SupplierID = P.SupplierID
inner join [Order Details] as od
on od.ProductID = P.ProductID
group by S.CompanyName
order by 2 desc


use Northwind

-- Obtener la cantidad total de Pedidos vendidos por cada empresa de transporte
select CompanyName as [Transportista], count(*) as [Total de pedidos] from Orders as O
inner join Shippers as S
on ShipVia = ShipperID
group by s.CompanyName


-- Consultas avannzadas
-- Obtener los clientes que han realizado pedidos de productos distintos
select C.CompanyName, COUNT(distinct ProductID) as [Numero de Productos] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
inner join [Order Details] as OD
on OD.OrderID = O.OrderID
group by C.CompanyName
order by 2 desc

select C.CompanyName, COUNT( ProductID) as [Numero de Productos] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
inner join [Order Details] as OD
on OD.OrderID = O.OrderID
group by C.CompanyName
order by 2 desc

select (ProductID) as [Numero de Productos] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
inner join [Order Details] as OD
on OD.OrderID = O.OrderID
order by 1 desc

-- Listar los empleados con la cantidad  total de pedidos que han gestionado y a qye cliebtes les han, vendido agrupando por nombre completo y dentro de este 
 -- nombre por cliente, ordenando por la cantidad mayor de pedidos

 select CONCAT(E.FirstName, ' ', E.LastName) as Nombre ,COUNT(OrderID) as [Numero de Ordenes] from Orders as O
 inner join Employees as E
 on O.EmployeeID = E.EmployeeID
 group by E.FirstName, E.LastName
 order by [Nombre] asc

 select CONCAT(E.FirstName, ' ', E.LastName) as Nombre ,COUNT(OrderID) as [Numero de Ordenes], C.CompanyName as Cliente from Orders as O
 inner join Employees as E
 on O.EmployeeID = E.EmployeeID
 inner join Customers as C
 on O.CustomerID = C.CustomerID
 group by E.FirstName, E.LastName, C.CompanyName
 order by [Nombre] asc, [Cliente]


 -- Listar las categor�as con el total de ingresos, generados por sus productos
select CategoryName, sum(OD.UnitPrice * OD.Quantity) as [Ingresos Totales] from Categories as C
inner join Products as P
on P.CategoryID = C.CategoryID
inner join [Order Details] as OD
on P.ProductID = OD.ProductID
group by CategoryName

select CategoryName, P.ProductName ,sum(OD.UnitPrice * OD.Quantity) as [Ingresos Totales] from Categories as C
inner join Products as P
on P.CategoryID = C.CategoryID
inner join [Order Details] as OD
on P.ProductID = OD.ProductID
group by CategoryName, P.ProductName
order by CategoryName

-- Listar los clientes con el dinero total gastado en pedidos
select C.CompanyName as [Nombre Cliente], SUM(OD.Quantity * OD.UnitPrice) as [Total gastado] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
inner join [Order Details] as OD
on OD.OrderID = O.OrderID
order by C.CompanyName

select c.CompanyName,
sum (Quantity * UnitPrice) as total
from Customers as c
inner join Orders  as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
group by c.CompanyName

-- Listar los pedidos realizados enyte el 1 de enero de 1997 y el 30 de junio de 1997 y mostrar el total de dinero
select O.OrderID, OrderDate, (Quantity * UnitPrice) as [Total Dinero] from Orders as O
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
where O.OrderDate between '1997-01-01' and '1997-06-30' 

-- Listar los productos con las categor�as Beverages, Seaffod, Confections
select ProductName as [Nombre Producto], CategoryName as [Categoria Producto] from Products as P
inner join Categories as C
on P.CategoryID = C.CategoryID
where CategoryName in ('Beverages', 'Seafood', 'Confections')

-- Listar los clientes ubicados en Alemania y que hayan realizado pedidos antes del 1 de enero de 1997
select CompanyName as [Nombre Cliente], OrderDate as [Fecha Orden] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
where Country = 'Germany' and year(OrderDate) < '1997'

select CompanyName as [Nombre Cliente], C.Country as Pais, OrderDate as [Fecha Orden] from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
where Country = 'Germany' and OrderDate < '1997-01-01'


-- Listar los clientes que han realizado pediddos con un total entre $500 y $2000
select CompanyName, (Quantity * UnitPrice) as [Total Pedido]  from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
where (Quantity * UnitPrice) between 500 and 2000 

select CompanyName, sum(Quantity * UnitPrice) as [Total Pedido]  from Customers as C
inner join Orders as O
on C.CustomerID = O.CustomerID
inner join [Order Details] as OD
on O.OrderID = OD.OrderID
group by CompanyName
having sum(Quantity * UnitPrice)  between 500 and 2000 

-- Practica de utilizaci�n del Left Join

-- Seleccionar los datos que se van a utilizar para insertar en la tabla products new
-- Product_id, ProductName, CustomerCategory, UnitPrice, Discontinued, Inserted

use Northwind
```

---
**Autor:** Yair Gabriel Corona Galarza  

