# 09_Ejercicio-Pedido-Store-Procedure


Pequeño ejercicio mostrando un SP  

```sql
-- Realizar un pedido, validar que el pedido no exista, que el cliente, empleado y producto exista, la cantidad debe ser validada
-- insertar el pedido. Debe calcular el importe (stock * precioProducto * cantidad vendida)
-- actualizar el stock con la cantidad vendida (restando el stock - la cantidad vendida)
create or alter proc Pedido
@NumeroPedido int
@Cliente int,
@Rep int,
@Fab char(3),
@Producto char(5),
@Cantidad int,
@Importe money
as
begin
	if not exists (select 1 from Pedidos where Num_Pedido= @NumeroPedido)
	begin
		if not exists (select 1 from Pedidos where Cliente = @Cliente)
			begin
				if not exists (select 1 from Pedidos where Rep = @Rep)
					begin
						if not exists (select 1 from Pedidos where Fab = @Fab)
						begin
							if not exists (select 1 from Pedidos where Producto = @Producto)
							begin
								if not exists (select 1 from Pedidos where Importe = @Importe)
									insert into Pedidos(Num_Pedido, Fecha_Pedido, Cliente, Rep, Fab, Producto, Cantidad, Importe)
									values (@NumeroPedido, @Cliente, @Rep, @Fab, @Producto, @Cantidad, @Importe)
							end
						end 
					end 
			end
	end
end


create or alter proc spu_realizar_edidos
@NumPedido int, @cliente int, @repre int, @fab char(3), @producto char(5), @cantidad int
as
begin
if exists (select 1 from Pedidos where Num_Pedido = @NumPedido )
begin 
	print 'El pedido ya existe'
	return
end

if not exists (select 1 from Pedidos where num = @cliente) and
if not exists (select 1 from Pedidos where Num_Emp = @repre) and
if not exists (select 1 from Pedidos where Fab = @fab) and

begin
	print 'Los datos no son v�lidos'
end

exec spu_realizar_edidos @NumPedido = 112961, @cliente = 2117, @fab = 'REY', @producto = '22A44L', @cantidad = 20 

if @cantidad <= 0
begin
print
return
end
declare @stockValido int
select @stockValido from Productos where Id_fab = @fab and Id_producto = @producto

if @cantidad > @stockValido
begin
	print 'No hay suficiente stock'
	return;
end
declare @precio money
@importe money 
select @precio =Precio from Productos
where Id_fab = @fab and Id_producto = @producto
set @importe = @cantidad @precio
insert into Pedidos
values (@NumPedido, GETDATE, @cliente, @repre, @fab, @producto, @cantidad, @importe)



```

---
**Autor:** Yair Gabriel Corona Galarza  

