USE [BigMarket]
GO
CREATE TABLE [dbo].[User](
[User_id] [int] PRIMARY KEY IDENTITY,
[Email] [VARCHAR] (50) UNIQUE,
[Phone] [VARCHAR] (50) UNIQUE
)
GO
SELECT * FROM [dbo].[User] WHERE [User_id]=6 OR [Email]='Scoby@m'
GO
SELECT * FROM [dbo].[User] WHERE [User_id]=2
GO