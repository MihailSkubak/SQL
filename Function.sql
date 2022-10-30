USE [SpisLudnosci]
GO

CREATE FUNCTION Obywatel.ufn_DaneZDaty
(
	@DateFrom DATETIME,
	@DateTo DATETIME
)
RETURNS TABLE
AS
RETURN (
	SELECT Id FROM Obywatel.Person
		WHERE dataSpisu BETWEEN @DateFrom AND @DateTo
  
 )
 GO
 SELECT * FROM Obywatel.ufn_DaneZDaty('2020-10-31', '2022-10-31')
 GO