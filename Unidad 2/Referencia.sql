--use BDEJEMPLO2;
select PR.Descripcion, PR.Stock, PR.Precio, PR.Id_fab, PE.Fab, PR.Id_producto, PE.Producto from Pedidos as PE
inner join Productos as PR
on PE.Fab = PR.Id_fab
and PE.Producto = PR.Id_producto;

use Northwind
select top 10 *
into products2
from Products

select * 
from Products as PR
inner join products2 as P2
on PR.ProductID = P2.ProductID


select * 
from Products as PR
right join products2 as P2
on PR.ProductID = P2.ProductID



