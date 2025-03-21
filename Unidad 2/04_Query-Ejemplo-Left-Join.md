# Query Ejemplo Left Join


Consulta practicando el uso de left join 

```sql

-- Ejemplo de left join aplicado
-- Ejemplo de left join aplicado
use Northwind
select * from ProductsNew


INSERT INTO ProductsNew
select P.ProductID, P.ProductName, C.CategoryName, CU.CompanyName, OD.UnitPrice, P.Discontinued, GETDATE() as [Fecha actual] from Products as P
inner join Categories as C
on P.CategoryID = C.CategoryID
inner join [Order Details] as OD
on OD.ProductID = P.ProductID
inner join Orders as O
on O.OrderID = OD.OrderID
inner join Customers as CU
on O.CustomerID = CU.CustomerID


INSERT INTO ProductsNew
SELECT  
    P.ProductID, 
    P.ProductName, 
    C.CategoryName, 
    CU.CompanyName, 
    OD.UnitPrice, 
    P.Discontinued, 
    GETDATE() as [Fecha actual] 
FROM Products AS P
INNER JOIN Categories AS C ON P.CategoryID = C.CategoryID
INNER JOIN [Order Details] AS OD ON OD.ProductID = P.ProductID
INNER JOIN Orders AS O ON O.OrderID = OD.OrderID
INNER JOIN Customers AS CU ON O.CustomerID = CU.CustomerID;

INSERT INTO ProductsNew (ProductID, ProductName, Customer, Category, UnitPrice, Discontinued, insertDate)
SELECT 
    p.ProductID,
    p.ProductName,
    cu.CompanyName,   -- Aseg�rate de que esta columna existe en ProductsNew
    c.CategoryName,   -- Remov� el alias "c."
    od.UnitPrice,
    p.Discontinued,
    GETDATE()         -- Aseg�rate de que FechaRegistro existe y es DATETIME o DATE
FROM 
    Products AS p
    INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
    INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
    INNER JOIN Orders AS o ON o.OrderID = od.OrderID
    INNER JOIN Customers AS cu ON cu.CustomerID = o.CustomerID;






select * from ProductsNew
drop table ProductsNew

CREATE TABLE ProductsNew (
    productpk INT IDENTITY(1,1) PRIMARY KEY, -- Clave primaria autoincremental
    productid INT NOT NULL,
    productName NVARCHAR(40) NOT NULL,
    Customer NVARCHAR(40) NOT NULL,
    Category NVARCHAR(15) NOT NULL,
    UnitPrice MONEY NOT NULL,
    discontinued BIT NOT NULL,
    insertDate DATETIME NOT NULL
);

INSERT INTO ProductsNew (productid, productName, Customer, Category, UnitPrice, discontinued, insertDate)
SELECT 
    p.ProductID AS productid,
    p.ProductName AS productName,
    cu.CompanyName AS Customer,
    c.CategoryName AS Category,
    od.UnitPrice AS UnitPrice,
    p.Discontinued AS discontinued,
    GETDATE() AS insertDate
FROM 
    Products AS p
    INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
    INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
    INNER JOIN Orders AS o ON o.OrderID = od.OrderID
    INNER JOIN Customers AS cu ON cu.CustomerID = o.CustomerID;



-- Crear una tabla a partir de una consulta
INSERT INTO ProductsNew (productid, productName, Customer, Category, UnitPrice, discontinued, insertDate as [Insert date])
SELECT 
    p.ProductID AS productid,
    p.ProductName AS productName,
    cu.CompanyName AS Customer,
    c.CategoryName AS Category,
    od.UnitPrice AS UnitPrice,
    p.Discontinued AS discontinued,
    GETDATE() AS insertDate
FROM 
    Products AS p
    INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
    INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
    INNER JOIN Orders AS o ON o.OrderID = od.OrderID
    INNER JOIN Customers AS cu ON cu.CustomerID = o.CustomerID;


	-- Crea la tabla con solo la estructura 

INSERT INTO ProductsNew (productid, productName, Customer, Category, UnitPrice, discontinued, insertDate)
SELECT top 0
    p.ProductID AS productid,
    p.ProductName AS productName,
    cu.CompanyName AS Customer,
    c.CategoryName AS Category,
    od.UnitPrice AS UnitPrice,
    p.Discontinued AS discontinued,
    GETDATE() AS insertDate
	into Products_New
FROM 
    Products AS p
    INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
    INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
    INNER JOIN Orders AS o ON o.OrderID = od.OrderID
    INNER JOIN Customers AS cu ON cu.CustomerID = o.CustomerID;


	INSERT INTO ProductsNew (productid, productName, Customer, Category, UnitPrice, discontinued, insertDate)
SELECT top 0
    p.ProductID AS productid,
    p.ProductName AS productName,
    cu.CompanyName AS Customer,
    c.CategoryName AS Category,
    od.UnitPrice AS UnitPrice,
    p.Discontinued AS discontinued,
    GETDATE() AS insertDate
	into Products_New
FROM 
    Products AS p
    INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
    INNER JOIN [Order Details] AS od ON od.ProductID = p.ProductID
    INNER JOIN Orders AS o ON o.OrderID = od.OrderID
    INNER JOIN Customers AS cu ON cu.CustomerID = o.CustomerID;

	DROP TABLE IF EXISTS ProductsNew;
alter table ProductsNew
add constraint pk_products_new
primary key (product_pk)  

-- Crear la tabla mediante consulta y se agrega el campo identidad despu�s 

drop table ProductsNew
	
SELECT TOP 0
    p.ProductID AS productid,
    p.ProductName AS productName,
    cu.CompanyName AS Customer,
    c.CategoryName AS Category,
    od.UnitPrice AS UnitPrice,
    p.Discontinued AS discontinued,
    GETDATE() AS insertDate
INTO Products_New
FROM
    dbo.Products AS p
    INNER JOIN dbo.Categories AS c ON p.CategoryID = c.CategoryID
    INNER JOIN dbo.[Order Details] AS od ON od.ProductID = p.ProductID
    INNER JOIN dbo.Orders AS o ON o.OrderID = od.OrderID
    INNER JOIN dbo.Customers AS cu ON cu.CustomerID = o.CustomerID;
	alter table products_new
	add productbk int not null

	alter table products_new
	add constraint pk_products_new 
	add constraint pk_products_new
	primary key (productbk)

```

---
**Autor:** Yair Gabriel Corona Galarza  

