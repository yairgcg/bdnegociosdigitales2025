use BDEJEMPLO2;
select PR.Descripcion, PR.Stock, PR.Precio, PR.Id_fab, PE.Fab, PR.Id_producto, PE.Producto from Pedidos as PE
inner join Productos as PR
on PE.Fab = PR.Id_fab
and PE.Producto = PR.Id_producto;

