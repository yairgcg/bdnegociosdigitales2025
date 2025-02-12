-- Joins
--			Syntaxis 
--	select * from TableA
--	inner join TableB
--	on PrimaryKey = Foreign Key

-- Seleccionar todas las categorías y productos
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


