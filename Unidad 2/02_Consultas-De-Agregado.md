# Consultas de Agregado


Consultas de agregado con SUM, AVG, COUNT, MAX y MIN


```sql

-- Consultas de Agregado
-- NOTA: SOLO DEVUELVEN UN SOLO REGISTRO
-- SUM, AVG, COUNT, COUNT(*), MAX, MIN
use Northwind
select COUNT(distinct Region) as [Registros Totales] from Customers
where Region is not null;

select region from Customers
where region is not null
order by Region asc;

select COUNT(*) from Orders;
select COUNT(ShipRegion) from Orders;

select * from Products;
-- Seleciona el precio m�s bajo de los productos
select * from Products;
select MIN(UnitPrice), MAX(UnitPrice) as 'Precio minimo', AVG(UnitsInStock) as 'Unidades Stock' from Products;

--Seleccionar cuantos pedidos existen 
select COUNT(OrderID) as 'Pedidos' from Orders;

-- Calcula el total de dinero vendido
select * from [Order Details]
select sum(UnitPrice * Quantity  Discount) as 'Total Vendido' from [Order Details];
select sum(UnitPrice * Quantity  - (UnitPrice * Quantity * Discount)) as 'Total Vendido' from [Order Details];

-- Calcula el total de unidades en stock de todos los productos
select * from Products;
select sum(UnitsInStock) as 'Total Stock' from Products;

-- Seleccionar el total de dinero que se gan� en el �ltimo trimestre de 1996
select * from [Order Details];
select sum(UnitPrice * Quantity  Discount) as 'Total Vendido' from [Order Details];
select sum(UnitPrice * Quantity  - (UnitPrice * Quantity * Discount)) as 'Total Vendido' from [Order Details]
inner join Orders
on [Order Details].OrderID = Orders.OrderID

--
select CategoryID, COUNT(*) as 'Categoria' from Products
group by CategoryID

select Categories.CategoryName, COUNT(*) from Categories
inner join Products as P
on Categories.	CategoryID = P.CategoryID
group by p.CategoryID;

-- Calcular el precio promedio de los productos por categoria
select * from Products;
select CategoryID, avg(UnitPrice) as 'Precio Promedio Producto' from Products
group by CategoryID;

-- Selecciona el numero de pedidos realizados por cada empleado por el ultimo trimestre de 1996
select * from Orders;
select EmployeeID, COUNT(*) as 'Numero de pedidos' from Orders
where OrderDate between '1996-10-01' and '1996-12-31'
group by EmployeeID
order by 'Numero de pedidos' asc;

-- Seleccionar la suma total de unidades vendidas por cada producto
select  ProductId, SUM(Quantity) as 'Nunero de productos' from [Order Details]
group by ProductID
order by 2 desc;

select OrderID, ProductID, SUM(Quantity) as 'Numero de Productos Vendidos' from [Order Details]
group by OrderID, ProductID
order by 2 desc;

-- Seleccionar el numero de productos por categoria pero solo aquellos que tengan mas de 10 productos
select CategoryID, COUNT(*) as 'Cantidad Productos' from Products
group by CategoryID
having COUNT(*) > 10;

-- Paso 1
select CategoryID from Products

--Paso 2
select CategoryID, UnitsInStock from Products
where CategoryID in (2, 4, 8)
order by CategoryID asc


-- Paso 3
select CategoryID, sum(UnitsInStock) from Products
where CategoryID in (2, 4, 8)
group by CategoryID
order by CategoryID asc

-- Paso 4
select CategoryID, sum(UnitsInStock) from Products
where CategoryID in (2, 4, 8)
group by CategoryID
having COUNT(*) > 10
order by CategoryID asc

-- Listar las ordenes agrupadas por empleado, pero que solo muestren aquellos que hayan gestionado m�s de 10 pedidos
select * from Orders;
select EmployeeID, count(ShipVia) as 'Ordenes' from Orders
group by EmployeeID
having count(ShipVia) > 10
order by 'Ordenes' asc;




```

---
**Autor:** Yair Gabriel Corona Galarza  

