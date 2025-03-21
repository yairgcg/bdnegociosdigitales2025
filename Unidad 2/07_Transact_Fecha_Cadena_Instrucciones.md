# 07 Transact Fecha Cadena

Explicación a las funciones de cadena más comunes  

```sql

-- Funciones de cadena

-- Transact es programaci�n en SQL
-- Las funciones de cadena permiten manipular tipos de datos como varchar nvarchar,
-- char, nchar

-- Funcion Len -> Devuelve la longitud de una cadena

-- Declaraci�n de variable

declare @numero int;
set @numero = 10;

-- Asigna el valor a la variable despu�s de crearlo

-- Obtener el tama�o de la cadena almacenada en la variable texto 
select len(@texto) as [Longitud]
select CompanyName ,LEN(CompanyName) as [Cantidad de caracteres] from Customers;

-- Funci�n left
-- Extrae un determinado n�mero espec�fico de car�cteres desde el inicio de la cadena

select LEFT(@texto, 10) as inicio

-- Funcion right
-- Extrae un determinado numero de caracteres del final de la cadena
select right(@texto, 6) as inicio

select CompanyName, LEN(CompanyName) as [Numero de caracteres], 
left(CompanyName, 4) as Inicio,
right(CompanyName, 5) as Final
from Customers

-- Substring
-- Extrae una  parte de la cadena, donde el segundo par�metro es la posici�n inicial
-- y el tercer el recorrido

select SUBSTRING(@texto, 6, 6 ) as [Mundo]
select CompanyName, LEN(CompanyName) as [Numero de caracteres], 
left(CompanyName, 4) as Inicio,
right(CompanyName, 5) as Final,
SUBSTRING (CompanyName, 7, 4) as [Subcadena]
from Customers

-- Funcion replace
-- Reemplaza una subcadena por otra
-- SYNTAXIS
-- REPLACE(string_exp1, string_exp2, string_exp3) (ODBC 1.0)
declare @texto2 varchar(50) = 'Amigo';
select REPLACE (@texto2, 'Amigo' ,'Mundo')

-- Char Index
select CHARINDEX('Amigo', @texto)

declare @texto varchar(50) = 'Hola, mundo!'
-- UPPER
-- Convierte una cadena en ma�sculas
select UPPER (substring (@texto, 6, 10)) as Mundo


update Customers
set
select UPPER(CompanyName) as [Nombre cliente] from Customers

select * from Customers
update Customers
set CompanyName = UPPER(CompanyName)
where Country in ('Mexico', 'Germany')


-- Funcion Trim
-- Quita espacios en blanco de una cadena
select TRIM ('						hola				') as 'Resultado'

declare @texto2 varchar(50) = 'Amigo mio';
select LTRIM (@texto2) as Resultado




```

---
**Autor:** Yair Gabriel Corona Galarza  

