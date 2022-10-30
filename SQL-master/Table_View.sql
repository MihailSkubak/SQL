USE [BigMarket]
GO

/****** Object:  View [dbo].[Table_View]    Script Date: 19.09.2018 17:54:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Table_View]
AS
SELECT        dbo.Car.Car_id, dbo.Car.Marka, dbo.Car.Model, dbo.Car.Year_i, 
dbo.Car.Fuel_i, dbo.Car.Engine_i, dbo.Car.Amount_i, dbo.Amount.Amount, dbo.Fuel.Fuel, 
                         dbo.Engine.Engine, dbo.Year.Year
FROM            dbo.Amount CROSS JOIN
                         dbo.Car CROSS JOIN
                         dbo.Engine CROSS JOIN
                         dbo.Fuel CROSS JOIN
                         dbo.Year
GO

UPDATE Table_View
SET Fuel='Benzin' WHERE Fuel_i=1
GO