# Tarea consultas simples
```sql
-- Tareas de consultas simples

--1.    Productos con categor�a 1, 3 o 5
--2.    Clientes de M�xico, Brasil o Argentina
--3.    Pedidos enviados por los transportistas 1, 2 o 3 y con flete mayor a 50
--4.    Empleados que trabajan en Londres, Seattle o Buenos Aires
--5.    Pedidos de clientes en Francia o Alemania, pero con un flete menor a 100
--6.    Productos con categor�a 2, 4 o 6 y que NO est�n descontinuados
--7.    Clientes que NO son de Alemania, Reino Unido ni Canad�
--8.    Pedidos enviados por transportistas 2 o 3, pero que NO sean a USA ni Canad�
--9.    Empleados que trabajan en 'London' o 'Seattle' y fueron contratados despu�s de 1995
--10.    Productos de categor�as 1, 3 o 5 con stock mayor a 50 y que NO est�n descontinuados

use Northwind;
-- Consulta 1
select * from Products;
select ProductID as ProductoId, ProductName as NombreProducto, CategoryID as CategoriaId from Products
where CategoryID in ('1', '3', '5');

-- Consulta 2
select * from Customers;
select CustomerID as ClienteID, Country as PaisCliente from Customers
where Country in ('Mexico', 'Brazil', 'Argentina');

-- Consulta 3
select * from Orders;
select ShipVia, Freight from Orders
where ShipVia in ('1', '2', '3') and Freight > 50;

--4.    Empleados que trabajan en Londres, Seattle o Buenos Aires
select * from Customers;
select CustomerID as ClienteID, City as CiudadCliente, Country as PaisCliente from Customers
where City in ('London', 'Seattle', 'Buenos Aires');

--5.    Pedidos de clientes en Francia o Alemania, pero con un flete menor a 100
select * from Orders;
select CustomerID as ClienteID, ShipCountry as PaisEnvio, Freight as Flete from Orders
where ShipCountry in ('France', 'Germany') and Freight < 100;

--6.    Productos con categor�a 2, 4 o 6 y que NO est�n descontinuados
select * from Products;
select ProductName as NombreProducto, CategoryID as CategoriaID, Discontinued as Discontinuado from Products
where CategoryID in ('2', '4', '6') and Discontinued = 0;

--7.    Clientes que NO son de Alemania, Reino Unido ni Canad�
select * from Customers;
select CustomerID as IdCliente, Country as PaisCliente from Customers
where Country not in ('Germany', 'UK');

--8.    Pedidos enviados por transportistas 2 o 3, pero que NO sean a USA ni Canad�
select * from Orders;
select ShipVia as TransportistaEnvio, ShipCountry as PaisEnvio from Orders
where ShipVia in ('2', '3') and ShipCountry not in ('USA', 'Canada');

--9.    Empleados que trabajan en 'London' o 'Seattle' y fueron contratados despu�s de 1995
select * from Employees;
select FirstName as PrimerNombre, LastName as Apellido, City as Ciudad, year(HireDate) as A�oContratacion from Employees
where City in ('London', 'Seattle') and year(HireDate) > 1995;

--10.    Productos de categor�as 1, 3 o 5 con stock mayor a 50 y que NO est�n descontinuados
use Northwind;
select * from Products;
select CategoryID, UnitsInStock, Discontinued from Products
where CategoryID in ('1', '3','5') and UnitsInStock > 50 and Discontinued = 0;

```

---
**Autor:** Yair Gabriel Corona Galarza  

