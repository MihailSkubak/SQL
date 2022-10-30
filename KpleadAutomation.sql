USE [KpleadAutomationBase]
GO

CREATE TABLE dbo.Accounts(
id int NOT NULL PRIMARY KEY IDENTITY(1,1),
ID_Number nvarchar(100) UNIQUE,
Name nvarchar(50),
Login nvarchar(50) UNIQUE,
Password nvarchar(50),
Mail nvarchar(50) UNIQUE,
MailPassword nvarchar(50),
Country nvarchar(50),
Groups nvarchar(50),
Status INT,
Cookies nvarchar(50),
TokenEEAB nvarchar(50),
UserAgent nvarchar(50),
Description nvarchar(50)
);

GO
INSERT INTO dbo.Accounts(ID_Number,Name,Login,Password,Mail,MailPassword,Country,Groups,Status,Cookies,TokenEEAB,UserAgent,Description)
VALUES
('12345','Misha','Mihailsss','1234567890','ms@gmail.com','1234567890','Poland','i3',1,'Cookies','Token','UserAgent','Description')

GO

INSERT INTO dbo.Accounts(ID_Number,Name,Login,Password,Mail,MailPassword,Country,Groups,Status,Cookies,TokenEEAB,UserAgent,Description)
VALUES
('123456','Vasya','Vasyasss','1234','vs@gmail.com','12345','Poland','i3',1,'Cookies','Token','UserAgent','Description')

GO
INSERT INTO dbo.Accounts
VALUES
('1234567','Vasya2','Vasyasss222','123455','vs2@gmail.com','123455','Poland','i8',2,'Cookies','Token','UserAgent','Description')

GO
