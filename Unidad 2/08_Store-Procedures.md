# Store Procedures


Introducción a los SP  

```sql
-- Store Procedures
-- Crear un store  procedure para seleccionar todos los clientes
use Northwind;
create or alter procedure spu_mostrar_clientes
as
begin
select * from Customers;
end;
go

-- Crear un store procedures (sp) que muestre los clientes  por pa�s 
-- Par�metros de entrada 

Create or alter proc spu_customerporpais
-- Par�metros 
@pais nvarchar(15), 
@pais2 nvarchar(15)
as 
begin 
	select * from Customers
	where Country in (@pais, @pais2);
end;


declare @p1 nvarchar (15) = 'spain';
declare @p2 nvarchar (15) = 'mexico';

exec spu_customerporpais @p1, @p2;
go

select 

-- Generar un reporte que permita visualizar los datos de compra de un determinado cliente en un rango de
-- fechas, mostrando el monto total de compras por producto, mediante un sp


Create or alter proc spu_reporteDatos
as begin

declare @c1 nchar(5) = '2';
declare @fecha_inicio DATE;
declare @fecha_fin DATE;

set @fecha_inicio = '1995-10-12'
set @fecha_fin = '1998-10-12';


	select @c1, @fecha_inicio, @fecha_fin, ProductName, SUM(Quantity * OD.UnitPrice) as [Monto Total] from Customers as C
	inner join Orders as O
	on C.CustomerID = O.CustomerID
	inner join [Order Details] as OD
	on O.OrderID = OD.OrderID
	inner join Products as P
	on P.ProductID = OD.ProductID
	where (OrderDate) between @fecha_inicio and @fecha_fin
	group by ProductName
end;

exec spu_reporteDatos @c1, @fecha_inicio, @fecha_fin;
go

use Northwind;

go
create or alter proc spu_informe_ventas_clientes
@nombre nvarchar(40) = 'Alfreds'
declare @fecha_inicio DATE;
declare @fecha_fin DATE;

as
begin 
select [Nombre de la Categoria] Producto, SUM(Importe) as [Monto total] from vistaOrdenesdeCompra
where [Nombre Cliente] = @nombre
and [Fecha de Orden] between @fecha_inicio and @fecha_fin
group by [Nombre Producto]
end;

select * from Customers
exec spu_informe_ventas_clientes 

use Northwind
-- Store procedures con par�metros de salida
go
create or alter proc spu_ObtenerNumeroClientes
@customerId int 
@totalCustomers int output -- Par�metro de salida
as 
begin
select @totalCustomers = COUNT(*)  from Customers
	where CustomerID = @customerid
end
go

declare @numero int;
exec spu_ObtenerNumeroClientes @totalCustomers = @numero output;
print @numero
go

-- Crear un store procedure que permita saber si un alumno aprob� o reprob�
create or alter proc spu_compararCalificaci�n
@calificacion decimal (10,2) -- Parametro de entrada
as
begin
	if @calificacion >= 0 and @calificacion <= 10
	begin
		if @calificacion > 8
		print 'La calificaci�n es aprobatoria'
		else 
		print 'La calificacion es reprobatoria'
		end
	else 
	print 'Una calificaic�n no v�lida'
end 
go

exec spu_compararCalificaci�n @calificacion = 11

-- Crear un SP que permita verificar si un cliente existe antes de devolver su informaci�n 
create or alter proc spu_ObtenerClienteSiExiste
@numeroCliente nchar(5)
as 
begin
	if exists (select 1 from Customers where CustomerID = @numeroCliente)
	select * from Customers 
	where CustomerID = @numeroCliente;
	else 
		print 'El cliente no existe'
end
go

exec spu_ObtenerClienteSiExiste @numeroCliente = 'Victor Iv�n'

exec spu_ObtenerClienteSiExiste @numeroCliente = 'Victor Iv�n'


select 1 from Customers 
where CustomerID= 'Arout'

-- Crear un store procedure que permita insertar un cliente pero se debe verificar primero que no exista 
create or alter proc spu_existenciaCliente
@cliente nchar(5),
@nombreCliente nvarchar (40),
@nombreContacto nvarchar (30),
@tituloContacto nvarchar (30),
@direccion nvarchar (60),
@region nvarchar (15),
@codigoPostalnvarchar nvarchar (10),
@pais nvarchar (15),
@telefono nvarchar (24),
@faxCliente nvarchar (24)
as
begin
if exists (select 1 from Customers where CustomerID = @cliente)
	insert into Customers(CompanyName, ContactName, ContactTitle, [Address], City, Region, PostalCode, Country, Phone, Fax)
	values (@cliente,@nombreCliente, @nombreContacto, @tituloContacto, @direccion, @region, @codigoPostalnvarchar, @pais, @telefono,
	@faxCliente);

	else 
	print 'El cliente ya existe';
end
go

CREATE OR ALTER PROC spu_existenciaCliente
@cliente nchar(5),
@nombreCliente nvarchar(40),
@nombreContacto nvarchar(30),
@tituloContacto nvarchar(30),
@direccion nvarchar(60),
@ciudad nvarchar(30), -- Falta la ciudad en la tabla Customers
@region nvarchar(15),
@codigoPostal nvarchar(10), -- Corregido el nombre del par�metro
@pais nvarchar(15),
@telefono nvarchar(24),
@faxCliente nvarchar(24)
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Customers WHERE CustomerID = @cliente)
    BEGIN
        INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, [Address], City, Region, PostalCode, Country, Phone, Fax)
        VALUES (@cliente, @nombreCliente, @nombreContacto, @tituloContacto, @direccion, @ciudad, @region, @codigoPostal, @pais, @telefono, @faxCliente);
        PRINT 'Cliente insertado correctamente.';
    END
    ELSE 
    BEGIN
        PRINT 'El cliente ya existe.';
    END
END
GO


CREATE OR ALTER PROC spu_existenciaCliente_Try_Catch
    @cliente nchar(5),
    @nombreCliente nvarchar(40),
    @nombreContacto nvarchar(30),
    @tituloContacto nvarchar(30),
    @direccion nvarchar(60),
    @ciudad nvarchar(30), -- Falta la ciudad en la tabla Customers
    @region nvarchar(15),
    @codigoPostal nvarchar(10), -- Corregido el nombre del par�metro
    @pais nvarchar(15),
    @telefono nvarchar(24),
    @faxCliente nvarchar(24)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Customers WHERE CustomerID = @cliente)
        BEGIN
            INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, [Address], City, Region, PostalCode, Country, Phone, Fax)
            VALUES (@cliente, @nombreCliente, @nombreContacto, @tituloContacto, @direccion, @ciudad, @region, @codigoPostal, @pais, @telefono, @faxCliente);
            PRINT 'Cliente insertado correctamente.';
        END
        ELSE 
        BEGIN
            PRINT 'El cliente ya existe.';
        END
    END TRY
    BEGIN CATCH
        -- Captura el error y muestra un mensaje
        PRINT 'Error: ' + ERROR_MESSAGE();
        PRINT 'N�mero de error: ' + CAST(ERROR_NUMBER() AS VARCHAR);
        PRINT 'Estado de error: ' + CAST(ERROR_STATE() AS VARCHAR);
        PRINT 'Procedimiento que caus� el error: ' + ERROR_PROCEDURE();
        PRINT 'L�nea del error: ' + CAST(ERROR_LINE() AS VARCHAR);
    END CATCH
END
GO

-- Manejo de ciclos en stores
--Imprimir el n�mero de veces que indique el usuario
CREATE OR ALTER PROCEDURE spu_Imprimir
    @numero INT
AS
BEGIN

    IF @numero <= 0
    BEGIN
        PRINT 'El n�mero debe ser mayor que 0.';
        RETURN; -- SALE DEL PROCEDIMIENTO SI EL RETURN NO ES V�LIDO
    END

    DECLARE @i INT = 1;

    WHILE @i <= @numero
    BEGIN
        PRINT @i; 
        SET @i = @i + 1;
    END
END;
GO

exec spu_Imprimir @numero = 10

```

---
**Autor:** Yair Gabriel Corona Galarza  

