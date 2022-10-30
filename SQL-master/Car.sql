USE [BigMarket]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Car](
	[Car_id] [int] NOT NULL,
	[Marka] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL
	CONSTRAINT [PK_CAR] PRIMARY KEY CLUSTERED
	(
	[Car_id] ASC
	)With (IGNORE_DUP_KEY = OFF)
) 
GO
ALTER TABLE [dbo].[Car] ADD
[Year_i] [int] NOT NULL,
[Fuel_i] [int] NOT NULL,
[Engine_i] [int] NOT NULL,
[Amount_i] [int] NOT NULL
GO
ALTER TABLE [dbo].[Car] 
ADD [User_i] [int]
GO

SELECT DISTINCT Marka FROM Car
GO

SELECT * FROM CAR
ORDER BY Marka
GO
INSERT Car VALUES (1,'Toyota','RAV4',5,2,1,5,6)
GO

DELETE Car
GO

Select * from Car
GO
DELETE Car WHERE Marka='Chevrolet' AND Model='New'
GO
SELECT Marka, COUNT (*) AS SomeMarka 
FROM Car
GROUP BY Marka
HAVING COUNT (*)>0
Order by SomeMarka DESC
GO

SELECT Marka, COUNT(*) AS SomeMarka, SUM(Year_i) AS Summa
FROM Car
GROUP BY GROUPING SETS (Marka, Year_i)
GO

SELECT Marka,Model,Year_i,
COUNT (*) OVER (PARTITION BY Marka) AS Marks,
SUM(Year_i) OVER (PARTITION BY Marka) AS SumYears
FROM Car
GO

SELECT Marka,Model,
(SELECT Engine FROM Engine WHERE Engine='Turbo') AS Eng
FROM Car
GO

SELECT * FROM Car
WHERE EXISTS (SELECT * FROM Engine WHERE Engine_i=Engine_id AND Engine='Turbo')
GO

SELECT Car.*,Engine.Engine
FROM Car,Engine
WHERE Engine_i=1 AND Engine='Turbo'
GO

SELECT Car.*,Engine.Engine
FROM Car 
RIGHT JOIN Engine ON Engine_i=1 AND Engine='Turbo'
WHERE Marka = 'BMW'
GO

SELECT Car.*,Engine.Engine,COUNT(Car.Fuel_i)
FROM Car RIGHT JOIN Engine 
ON Engine_i=1 AND Engine='Turbo'
GROUP BY Car.Car_id,Car.Marka,Car.Model,Car.Engine_i,Car.Year_i,Car.Amount_i,Car.Fuel_i,Car.User_i,Engine.Engine
GO

SELECT LEN('Marka') AS MMM
GO
SELECT CHARINDEX('p','Apple')
GO
SELECT SUBSTRING('Galaxy S8 Plus', 8, 2) 
GO
SELECT LOWER('APple') 
GO
SELECT ROUND(1342.3455, -2)
GO
SELECT GETDATE() 
GO
SELECT DATENAME(weekday, GETDATE()) 
GO

SELECT STR(12.47,4,1)
GO
SELECT NCHAR(104)
GO
SELECT UNICODE('h')
GO
DECLARE @name varchar(20),@surname varchar(20);
SET @name='Misha';
SET @surname='Skubak';
PRINT 'Name is: '+ @name+'
'+'Surname is: ' + @surname
GO

BEGIN TRY
DECLARE @name varchar(20);
SET @name='Misha';
SET @name = @name + 123;
PRINT 'Данные успешны!'
END TRY
BEGIN CATCH 
PRINT 'Error '+ CONVERT(VARCHAR, ERROR_NUMBER()) +' : '+ ERROR_MESSAGE()
END CATCH
GO

DECLARE @names TABLE (name_id int, cliend VARCHAR(20))
INSERT INTO @names 
VALUES (1,'Petro'),
(2,'Vasya')
SELECT * FROM  @names
GO


Begin tran
Select * from Car
SELECT COALESCE ((SELECT COUNT(*)
   FROM Car
   WHERE Marka='BMW'), 0) 
   AS InUse

   Select * from Car
Rollback tran
GO
Begin tran
Select * from Car
SELECT COALESCE (Marka, 'BMW')
   AS InUse   
   FROM Car 
   Where Marka = 'Toyota'
   
      Select * from Car
Rollback tran
GO

DECLARE @Var1 VARCHAR(35), @Var2 VARCHAR(35)
   
   SET @Var1 = NULL
   SET @Var2 = 'Hello'
   
   SELECT ISNULL (@Var1, @Var2) AS [ISNULL]
   GO