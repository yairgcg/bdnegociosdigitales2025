# Views


Introducción a las vistas  

```sql

-- Views
-- Sirve para encapsular una consulta grande
-- SYNTAXIS

--		create view nombreVista
--		as select columnas from table
--		where condicion

use Northwind

go
create view vistaCategoriasTodas
as
select CategoryID, CategoryName, [Description], Picture from Categories
go

select * from vistaCategoriasTodas
where CategoryName = 'Beverages'

-- Crear una vista que permita visualizar solamente los clientes de Mexico y Brasil
go
create or alter view vistaPaises
as
select CustomerID ,CompanyName as [Nombre cliente], ContactName as [Nombre contacto], Country as [Pais contacto] from Customers
where Country in ('Mexico', 'Brazil')
go

select * from vistaPaises

select * from Orders as O
inner join  vistaPaises as VP
on VP.CustomerID = O.CustomerID

-- Crear una vista que obtenga los datos de todas las ordenes, los productos, 
-- categorias del producto, en la orden calcular el importe
GO
CREATE OR ALTER VIEW [vistaOrdenesdeCompra] 
AS 
SELECT 
    O.OrderID AS [Numero Orden], 
    O.OrderDate AS [Fecha de Orden], 
    O.RequiredDate AS [Fecha Requerida], -- Se cambi� el alias para evitar duplicaci�n
    CONCAT(E.FirstName, ' ', E.LastName) AS [Nombre Empleado],
    C.CategoryName AS [Nombre de la Categoria], 
    OD.UnitPrice, 
    OD.Quantity AS [Cantidad Vendida], 
    (OD.Quantity * OD.UnitPrice) AS [Importe]
FROM Categories AS C
INNER JOIN Products AS P ON C.CategoryID = P.CategoryID
INNER JOIN [Order Details] AS OD ON OD.ProductID = P.ProductID
INNER JOIN Orders AS O ON OD.OrderID = O.OrderID
INNER JOIN Customers AS CU ON CU.CustomerID = O.CustomerID
INNER JOIN Employees AS E ON E.EmployeeID = O.EmployeeID;
GO


create schema rh

create table rh.tablarh (
id int primary key,
nombre nvarchar(50)
)

-- Vista horizontal
go
create or alter view rh.viewCategoriasProductos
as
select C.CategoryID, CategoryName, P.ProductID, P.ProductName from Categories as C
inner join Products as P
on C.CategoryID = P.CategoryID;
go

select * from rh.viewCategoriasProductos

-- Vista vertical
select sum(Importe) as [Importe] from vistaOrdenesdeCompra
where year([Fecha de Orden]) between  '1995' and '1996'

create or alter view vistaOrdenes1995-1996
as
select [Nombre del cliehte] , sum(Importe) as [Importe] from vistaOrdenesdeCompra
where year([Fecha de Orden]) between  '1995' and '1996'
group by [Nombre del cliente]
havin count(*)> 2


select * from vistaOrdenesdeCompra



```

---
**Autor:** Yair Gabriel Corona Galarza  

