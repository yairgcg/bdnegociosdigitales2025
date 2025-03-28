-- Crear un trigger que cada vez que se elimine un pedido se debe actualizar el stock de los productos de la cantidad eliminada

create or alter trigger tg_Cantidad_Eliminada
on Pedidos
instead of delete
as
	begin
			declare @existencia int
		   declare @fab char(3)
			declare @prod char(5)
			declare @cantidad int

select @fab = fab, @prod = producto, @cantidad = cantidad 
from deleted;

select @existencia = stock from Productos
where Id_fab = @fab and Id_producto = @prod;

		update Productos
		set stock = stock + @cantidad
		where Id_fab = @fab and Id_producto = @prod;
delete from Pedidos where Num_Pedido in (select Num_Pedido from deleted);
end;
