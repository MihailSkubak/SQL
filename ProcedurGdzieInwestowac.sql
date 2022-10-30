USE [SpisLudnosci]
GO
 CREATE PROCEDURE Obywatel.usp_DodajGdzieInwestowac
	@GdzieInwestowac NVARCHAR(50),
	@ResultText NVARCHAR(255) OUT 
    --WITH EXECUTE AS OWNER
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @actProcName NVARCHAR(255) = OBJECT_NAME(@@PROCID)
	DECLARE @trancount INT = @@trancount

	BEGIN TRY
	
		IF @trancount = 0  
		BEGIN TRANSACTION

		SET @ResultText = 'Done!'

		IF EXISTS(SELECT 1 FROM Inwest.GdzieInwestowac ph 
					WHERE GdzieInwestowac = @GdzieInwestowac)
		BEGIN
			SET @ResultText = 'Such inwest type already exists!'

			RETURN 1;
		END
		
		INSERT INTO Inwest.GdzieInwestowac (GdzieInwestowac)
		SELECT @GdzieInwestowac

		IF @trancount = 0 COMMIT TRANSACTION; 
		ELSE 
		BEGIN
			SET @ResultText = 'Process was not successfull'
			ROLLBACK TRANSACTION;
		END
		
	END TRY
	BEGIN CATCH
		SET @ResultText = 'Process was not successfull'
	END CATCH
								
END 


