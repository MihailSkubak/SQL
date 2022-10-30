USE [SpisLudnosci]
GO

DECLARE @RC int
DECLARE @DateFrom datetime = '2020-01-01'
DECLARE @DateTo datetime = '2022-01-01'
DECLARE @ResultCode smallint
DECLARE @ResultText nvarchar(255)

-- TODO: Set parameter values here.

EXECUTE @RC = [Obywatel].[usp_SpisDoHistorii] 
   @DateFrom
  ,@DateTo
  ,@ResultCode OUTPUT
  ,@ResultText OUTPUT

  SELECT @ResultCode, @ResultText
  --GO
  --SELECT * FROM Journal.PersonHistory
  --SELECT * FROM Obywatel.Person
  --DELETE Journal.PersonHistory
  --DELETE Obywatel.Person
