begin tran



Select * from Car

declare @TableWithModel as table(
	Model NVARCHAR(50)
)

INSERT INTO @TableWithModel SELECT 'M4'
INSERT INTO @TableWithModel SELECT 'X5'
INSERT INTO @TableWithModel SELECT 'X2'
INSERT INTO @TableWithModel SELECT 'Z4'

while EXISTS (SELECT 1 FROM @TableWithModel)
begin

declare @Model NVARCHAR(50)
select TOP (1) @Model = Model FROM @TableWithModel

	INSERT INTO dbo.Car
	SELECT TOP 1 
		  [Marka] = 'BMW'
		  ,[Model] = @Model
		  ,[Year_i]
		  ,[Fuel_i]
		  ,[Engine_i]
		  ,[Amount_i]
		  ,[User_i]
	  FROM [BigMarket].[dbo].[Car]
	  WHERE Marka != 'BMW'

	  delete @TableWithModel
	  WHERE Model = @Model 
end

  
Select * from Car

rollback tran -- commit



Select * from Car