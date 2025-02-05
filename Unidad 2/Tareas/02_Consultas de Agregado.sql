-- Consultas de Agregado
-- NOTA: SOLO DEVUELVEN UN SOLO REGISTRO
-- SUM, AVG, COUNT, COUNT(*), MAX, MIN
use Northwind
select COUNT(distinct Region) as [Registros Totales] from Customers
where Region is not null;

select region from Customers
where region is not null
order by Region asc
