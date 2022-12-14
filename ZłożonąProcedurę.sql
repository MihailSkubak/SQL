USE [SpisLudnosci]
GO

CREATE PROCEDURE [Obywatel].[usp_SpisDoHistorii]
	@DateFrom DATETIME,
	@DateTo DATETIME,
	@ResultCode SMALLINT OUT,
	@ResultText NVARCHAR(255) OUT 
    --WITH EXECUTE AS OWNER
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @actProcName NVARCHAR(255) = OBJECT_NAME(@@PROCID)
	DECLARE @trancount INT = @@trancount

	DECLARE @CandidateToDelete AS TABLE(
		Person_Id INT
	)

	BEGIN TRY
	
		IF @trancount = 0  
		BEGIN TRANSACTION

		SET @ResultText = 'Done' 
		SET @ResultCode = 0

		INSERT INTO @CandidateToDelete
		SELECT Id FROM Obywatel.ufn_DaneZDaty (@DateFrom, @DateTo) 

		IF EXISTS(SELECT 1 FROM Journal.PersonHistory ph 
					JOIN @CandidateToDelete cd ON cd.Person_Id = ph.ID_Person)
		BEGIN
			SET @ResultText = 'Something went wrong! Person/s that supposed to be deleted already exist in journal!'
			SET @Resultcode = 111

			RETURN 1;
		END
		
		DELETE p
		FROM Obywatel.Person p 
		JOIN @CandidateToDelete cd ON cd.Person_Id = p.Id


		IF @trancount = 0 COMMIT TRANSACTION; 
		ELSE 
		BEGIN
			SET @ResultText = 'Process was not successfull'
			SET @Resultcode = 404
			ROLLBACK TRANSACTION;
		END
		
	END TRY
	BEGIN CATCH
		SET @ResultText = 'Process was not successfull'
		SET @Resultcode = 505
	END CATCH
								
END 