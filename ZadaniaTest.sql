USE [ZadaniaTest]
GO

CREATE TABLE dbo.Pracownik(
Pracownik_ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Nazwisko nvarchar(50),
Szef_ID int
);

GO

CREATE TABLE dbo.Bonus(
Bonus_ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Pracownik_ID int,
Data_bonus datetime,
wartosc float
);

GO

ALTER TABLE dbo.Bonus
ADD FOREIGN KEY (Pracownik_ID) REFERENCES Pracownik(Pracownik_ID);
GO

INSERT INTO dbo.Pracownik(Nazwisko,Szef_ID)
VALUES
('Witkowskij',1),
('Scubac',1),
('Chabert',3),
('Bartk',3),
('Fura',5),
('Gawkowski',5)

GO

INSERT INTO dbo.Bonus(Pracownik_ID,Data_bonus,wartosc)
VALUES
(1,'2021-05-08',1000),
(2,'2020-08-10',200),
(3,'2021-06-05',4000),
(4,'2020-02-09',2000),
(2,'2020-03-09',400),
(1,'2020-03-02',1000)

GO
;with witoutShef as (
	select p.Pracownik_Id from dbo.Pracownik p
	left JOIN dbo.Pracownik p2 ON p.Pracownik_ID = p2.Szef_ID
	where p2.Pracownik_ID IS NULL
),
elseConditions as(
SELECT DISTINCT query.Pracownik_ID, SUM(query.wartosc) as wartoscBonusu, count(query.Pracownik_ID) as bonusCount
FROM (
SELECT p.Pracownik_ID, B.wartosc FROM dbo.Pracownik p
LEFT JOIN dbo.Bonus b ON b.Pracownik_ID = p.Pracownik_ID
WHERE (b.Data_bonus > DATEADD(YEAR, -1 ,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0))
OR b.Data_bonus IS NULL)
GROUP BY p.Pracownik_ID, b.Wartosc
HAVING ISNULL(SUM(wartosc), 0) < 1000

UNION ALL 

SELECT p.Pracownik_ID, B.wartosc FROM dbo.Pracownik p
inner JOIN dbo.Bonus b ON b.Pracownik_ID = p.Pracownik_ID 
WHERE (b.Data_bonus > DATEADD(YEAR, -1 ,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0))
OR b.Data_bonus IS NULL)
and p.Pracownik_ID not in (

SELECT p.Pracownik_ID FROM dbo.Pracownik p
LEFT JOIN dbo.Bonus b ON b.Pracownik_ID = p.Pracownik_ID
GROUP BY p.Pracownik_ID, b.Wartosc
HAVING ISNULL(SUM(wartosc), 0) < 1000
)
GROUP BY p.Pracownik_ID, b.Wartosc 
HAVING COUNT(b.Pracownik_Id) = 1) query
GROUP BY  query.Pracownik_ID
)

SELECT ec.PracowniK_ID, p.Nazwisko, ec.wartoscBonusu, iif(ec.wartoscBonusu is null, 0, ec.bonusCount) as bonusCount FROM elseConditions ec 
JOIN witoutShef ws ON ws.Pracownik_Id = ec.Pracownik_Id
join dbo.Pracownik p on p.PracowniK_ID = ec.PracowniK_ID
ORDER BY ec.wartoscBonusu