select @@version

/** Insert some data **/
use sampleDB;
CREATE SCHEMA TestSchema;
GO

CREATE TABLE TestSchema.Employees (
  Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Name NVARCHAR(50),
  Location NVARCHAR(50)
);
GO

INSERT INTO TestSchema.Employees (Name, Location) VALUES
(N'Jared', N'Australia'),
(N'Nikita', N'India'),
(N'Tom', N'Germany');
GO

SELECT * FROM TestSchema.Employees;
GO

/** Sample queries **/


/** 5M Rows! **/

WITH a AS (SELECT * FROM (VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS a(a))
SELECT TOP(5000000)
ROW_NUMBER() OVER (ORDER BY a.a) AS OrderItemId
,a.a + b.a + c.a + d.a + e.a + f.a + g.a + h.a AS OrderId
,a.a * 10 AS Price
,CONCAT(a.a, N' ', b.a, N' ', c.a, N' ', d.a, N' ', e.a, N' ', f.a, N' ', g.a, N' ', h.a) AS ProductName
INTO Table_with_5M_rows
FROM a, a AS b, a AS c, a AS d, a AS e, a AS f, a AS g, a AS h;

/** Measure time **/

Set statistics time on
SELECT SUM(Price) FROM Table_with_5M_rows
Set statistics time off

/** ColumnStore Index **/

CREATE CLUSTERED COLUMNSTORE INDEX Columnstoreindex ON Table_with_5M_rows;

/** Measure time with the index **/

Set statistics time on
SELECT SUM(Price) FROM Table_with_5M_rows
Set statistics time off