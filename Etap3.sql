create database Etap3
go 

USE [Etap3]
GO
CREATE TABLE dbo.Obrona(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Id_PracaDyplomowa INT,
OczykiwanaDataObrony datetime,
FaktycznaDataObrony datetime,
Id_ZestawOcenPracownikow int,
Id_OcenaKoncowa int
);

GO

CREATE TABLE dbo.Oceny(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Ocena nvarchar(10),
ECTS_Ocena int,
Opis nvarchar(255)
);

GO

CREATE TABLE dbo.PracaDyplomowe(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
TytulPraca nvarchar(255),
Id_Student int,
Id_Pracownik int
);

GO

CREATE TABLE dbo.Student(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Imie nvarchar(255),
Nazwisko nvarchar(255),
Nr_indeksu int,
Id_studia int,
Id_kierunek int
);

GO

CREATE TABLE dbo.Recenzenty(
Id_Pracownik int,
Id_PracaDyplomowa int
);

GO

CREATE TABLE dbo.OcenyPracownikow(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Id_Ocena int,
Id_Pracownik int,
Id_PracaDyplomowa int,
Opinie nvarchar(255)
);

GO

CREATE TABLE dbo.Studia(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Rodzaj_studiow nvarchar(50),
Stopien nvarchar(50),
Opis nvarchar(255)
);

GO

CREATE TABLE dbo.Kierunek(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Kierunek nvarchar(50),
Opis nvarchar(255)
);

GO

CREATE TABLE dbo.StopienPracownika(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Stopien nvarchar(50)
);

GO

CREATE TABLE dbo.SlowaKluczowe(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
SlowaKluczowe nvarchar(50),
Id_PracaDyplomowa int
);

GO

CREATE TABLE dbo.PracownikUczelni(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Imie nvarchar(255),
Nazwisko nvarchar(255),
Id_Stopien int
);

GO

ALTER TABLE dbo.Student
ADD FOREIGN KEY (Id_Studia) REFERENCES Studia(ID);
GO

ALTER TABLE dbo.Student
ADD FOREIGN KEY (Id_kierunek) REFERENCES Kierunek(ID);
GO

ALTER TABLE dbo.PracownikUczelni
ADD FOREIGN KEY (Id_stopien) REFERENCES StopienPracownika(ID);
GO

ALTER TABLE dbo.PracaDyplomowe
ADD FOREIGN KEY (Id_Pracownik) REFERENCES PracownikUczelni(ID);
GO

ALTER TABLE dbo.PracaDyplomowe
ADD FOREIGN KEY (Id_Student) REFERENCES Student(ID);
GO


ALTER TABLE dbo.SlowaKluczowe
ADD FOREIGN KEY (Id_PracaDyplomowa) REFERENCES PracaDyplomowe(ID);
GO


ALTER TABLE dbo.Recenzenty
ADD FOREIGN KEY (Id_Pracownik) REFERENCES PracownikUczelni(ID)
GO

ALTER TABLE dbo.Recenzenty
ADD FOREIGN KEY (Id_PracaDyplomowa) REFERENCES PracaDyplomowe(ID)
GO

ALTER TABLE dbo.OcenyPracownikow
ADD FOREIGN KEY (Id_Pracownik) REFERENCES PracownikUczelni(ID)
GO

ALTER TABLE dbo.OcenyPracownikow
ADD FOREIGN KEY (Id_Ocena) REFERENCES Oceny(ID)
GO

ALTER TABLE dbo.OcenyPracownikow
ADD FOREIGN KEY (Id_PracaDyplomowa) REFERENCES PracaDyplomowe(ID)
GO

ALTER TABLE dbo.Obrona
ADD FOREIGN KEY (Id_PracaDyplomowa) REFERENCES PracaDyplomowe(ID)
GO

ALTER TABLE dbo.Obrona
ADD FOREIGN KEY (Id_ZestawOcenPracownikow) REFERENCES OcenyPracownikow(ID)
GO

ALTER TABLE dbo.Obrona
ADD FOREIGN KEY (Id_OcenaKoncowa) REFERENCES Oceny(ID)
GO

INSERT INTO dbo.Oceny(Ocena,ECTS_Ocena,Opis)
VALUES
('2',50,'Not pass exam'),
('3',60,' '),
('4',80,'Good'),
('5',100,'Very Good')

GO

INSERT INTO dbo.Studia(Rodzaj_studiow,Stopien,Opis)
VALUES
('Stacjonarne','1 stopien',' '),
('Stacjonarne','2 stopien',' '),
('Zaoczne','1 stopien',' '),
('Zaoczne','2 stopien',' ')

GO



INSERT INTO dbo.Kierunek(Kierunek,Opis)
VALUES
('Informatyka stosowana',' ' ),
('Robotyka',' '),
('Electryka',' '),
('Automatyka',' ')

GO


INSERT INTO dbo.Student(Imie,Nazwisko,Nr_indeksu,Id_studia,Id_kierunek)
VALUES
('Mihae1','Scubac1',8223,2,1),
('Mihae2','Scubac2',8224,3,2),
('Mihae3','Scubac3',8225,1,4),
('Mihae4','Scubac4',8226,4,3)

GO

INSERT INTO dbo.StopienPracownika(Stopien)
VALUES
('Doktor'),
('Inzynier'),
('Doktor inzunier'),
('Profesor')

GO

INSERT INTO dbo.PracownikUczelni(Imie,Nazwisko, Id_Stopien)
VALUES
('Oskar1','Witkowskij1',1),
('Oskar2','Witkowskij2',2),
('Oskar3','Witkowskij3',3),
('Oskar4','Witkowskij4',4)

GO

INSERT INTO dbo.PracaDyplomowe(TytulPraca,Id_Student,Id_Pracownik)
VALUES
('The problem of gradient',1,2),
('Problems in database development',2,3),
('SmartHome project',3,1),
('Metodology of numbered methods',4,4)

GO


INSERT INTO dbo.SlowaKluczowe(SlowaKluczowe,Id_PracaDyplomowa)
VALUES
('gradient',1),
('database',2),
('SmartHome',3),
('Metodology',4)

GO

INSERT INTO dbo.Recenzenty(Id_Pracownik,Id_PracaDyplomowa)
VALUES
(1,2),
(2,3),
(3,1),
(3,4)

GO

INSERT INTO dbo.Recenzenty(Id_Pracownik,Id_PracaDyplomowa)
VALUES
(1,3),
(2,4)

GO

INSERT INTO dbo.OcenyPracownikow(Id_Ocena,Id_Pracownik,Id_PracaDyplomowa,Opinie)
VALUES
(1,2,3,'problem with methods'),
(2,3,2, 'the topic is not fully open'),
(3,1,4, 'not all'),
(4,4,1, ' ')

GO

INSERT INTO dbo.Obrona(Id_PracaDyplomowa, OczykiwanaDataObrony, FaktycznaDataObrony,Id_ZestawOcenPracownikow, Id_OcenaKoncowa)
VALUES
(1,'2021-01-07','2021-02-07',2,3),
(2,'2021-02-07','2021-02-07',1,2),
(3,'2021-03-07','2021-04-07',3,2),
(4,'2021-04-07','2021-04-07',2,1)

GO

SELECT pd.TytulPraca, s.Imie, s.Nazwisko,s.Nr_indeksu, sa.rodzaj_studiow, sa.stopien, k.kierunek, sk.SlowaKluczowe
FROM PracaDyplomowe pd
INNER JOIN Student s ON pd.Id_Student = s.ID
INNER JOIN Studia sa ON s.Id_studia = sa.ID
INNER JOIN Kierunek k ON s.Id_kierunek = k.ID
INNER JOIN SlowaKluczowe sk ON sk.Id_PracaDyplomowa = pd.ID
WHERE sk.SlowaKluczowe like '%SmartHome%' 
OR
sk.SlowaKluczowe like '%gradient'
GO

SELECT PD.*,PU.Imie, PU.Nazwisko
FROM PracaDyplomowe PD
INNER JOIN PracownikUczelni PU 
	ON PU.ID = PD.Id_Pracownik
WHERE PU.Imie='Oskar1' AND PU.Nazwisko='Witkowskij1'
GO


		SELECT PD.TytulPraca, PU2.Imie as 'Imie Promotora', PU2.Nazwisko as 'Nazwisko Promotora', S.Imie as 'Imie Studenta', S.Nazwisko as 'Nazwisko Studenta', S.Nr_indeksu, PU.Imie as 'Imie Recenzenta', PU.Nazwisko as 'Nazwisko Recenzenta' 
		FROM PracaDyplomowe PD
		INNER JOIN Student S ON PD.Id_Student = S.ID
		INNER JOIN Recenzenty R ON R.Id_PracaDyplomowa = PD.ID
		INNER JOIN PracownikUczelni PU ON R.Id_Pracownik = PU.ID
		INNER JOIN PracownikUczelni PU2 ON PD.Id_Pracownik = PU2.ID
		WHERE Nr_indeksu=8226
		GO


		SELECT pd.TytulPraca, s.Imie as 'Imie Studenta', s.Nazwisko as 'Nazwisko Studenta', s.Nr_indeksu,
		sa.Stopien, sa.Rodzaj_studiow, k.Kierunek, pu.Imie as 'Imie Promotora', pu.Nazwisko as 'Nazwisko Promotora',
		sp.Stopien as 'Stopien Promotora', o.OczykiwanaDataObrony, o.FaktycznaDataObrony,
		pu2.Imie as 'Imie egzaminatora', pu2.Nazwisko as 'Nazwisko egzaminatora', oc.Ocena as 'Ocena egzaminatora',
		oc2.Ocena as 'Ocena Koncowa'
		FROM dbo.Obrona o
		INNER JOIN dbo.PracaDyplomowe pd ON o.Id_PracaDyplomowa = pd.ID
		INNER JOIN dbo.PracownikUczelni pu ON pu.ID = pd.Id_Pracownik
		INNER JOIN dbo.StopienPracownika sp ON sp.ID = pu.Id_Stopien
		INNER JOIN dbo.Student s ON s.ID = pd.Id_Student
		INNER JOIN dbo.Studia sa ON sa.ID = s.Id_studia
		INNER JOIN dbo.Kierunek k ON k.Id = s.Id_kierunek
		INNER JOIN dbo.OcenyPracownikow op ON op.ID = o.Id_ZestawOcenPracownikow
		INNER JOIN dbo.PracownikUczelni pu2 ON pu2.ID = op.Id_Pracownik
		INNER JOIN dbo.Oceny oc ON oc.ID = op.Id_Ocena
		INNER JOIN dbo.Oceny oc2 ON oc2.ID = o.Id_OcenaKoncowa
		Where (DATEPART(YYYY, o.FaktycznaDataObrony) = '2021'
		OR DATEPART(YYYY, o.OczykiwanaDataObrony) = '2021')
		AND k.Kierunek = 'Automatyka' 
		GO