-- tworzenie bazy danych
create database SpisLudności
go 

--Zaczynamy działalność na bazie którą stworzyliśmy wyżej
USE [SpisLudności]
GO

-- Tworzymy tabeli 
CREATE TABLE dbo.Person( -- 
ID int NOT NULL PRIMARY KEY IDENTITY(1,1), -- klucz głowny / automatyczna inkrementacja ID
Imie nvarchar(50) NOT NULL, -- kolumna nie może być pusta
Nazwisko nvarchar(50) NOT NULL,
Rok datetime NOT NULL,
Id_Zamieszkanie int,
Id_Edukacja int,
Id_Praca int,
Id_Inwestycja INT,
StanBraka bit,
Id_Hobby int,
Id_Inwalidztwo int
);

CREATE TABLE dbo.Zamieszkanie(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Miescowosc nvarchar(50),
Miasto nvarchar(50),
Id_Dzielnica int
);

CREATE TABLE dbo.Dzielnica(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Dzielnica nvarchar(50)
);

CREATE TABLE dbo.DzieciRodziny(
Id_Dziecko int,
Id_Person int
);

CREATE TABLE dbo.Dziecko(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Imie nvarchar(50),
Nazwisko nvarchar(50),
RokDziecka datetime
);

CREATE TABLE dbo.Edukacja(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Id_Specjalnosc int,
Id_StopienUkoncenia int
);

CREATE TABLE dbo.Specjalnosc(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Specjalnosc nvarchar(50)
);

CREATE TABLE dbo.StopienUkoncenia(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
StopienUkoncenia nvarchar(50),
NazwaInstytucji nvarchar(50)
);

CREATE TABLE dbo.Praca(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Id_Specjalnosc int,
NazwaFirmy nvarchar(50),
Poziom nvarchar(50),
Wynagrodzenie nvarchar(50)
);

CREATE TABLE dbo.Inwestycja(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Id_GdzieInwestowac int,
Komentarz nvarchar(255)
);

CREATE TABLE dbo.GdzieInwestowac(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
GdzieInwestowac nvarchar(50)
);

CREATE TABLE dbo.Hobby(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Hobby nvarchar(50),
IleCzasu nvarchar(50),
Komentarz nvarchar(255)
);

CREATE TABLE dbo.Inwalidztwo(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Choroba nvarchar(50),
SocjalniWypłaty bit,
Komentarz nvarchar(255)
);

GO

-- wypełniamy tabeli danymi

INSERT INTO dbo.Person
VALUES
('Bartosz','Cadr','1995-02-07',1,1,1,3,0,4,NULL),
('Albert','Tolak','1998-07-08',2,4,3,4,0,2,NULL),
('Daniel','Gregorok','1947-12-02',3,3,5,1,1,3,1),
('Dominik','Sobon','1965-01-11',4,2,6,2,1,1,2),
('Eva','Vinik','1977-09-04',5,5,7,2,1,2,NULL),
('Anna','Vitt','1983-08-12',7,1,2,2,1,4,NULL),
('Igor','Postek','2002-04-03',6,2,6,4,1,NULL,4),
('Hanna','Gura','1963-11-06',8,5,7,2,1,3,3)

INSERT INTO dbo.Zamieszkanie
VALUES
('Mazowiecka','Warszawa',1),
('Malopolska','Krakow',2),
('Lubelskie','Lublin',3),
('Wielkopolska','Poznań',4),
('Mazowiecka','Warszawa',5),
('Mazowiecka','Warszawa',7),
('Malopolska','Krakow',6),
('Lubelskie','Lublin',8)

INSERT INTO dbo.Dzielnica
VALUES
('Brazownicza'),
('Krakusa'),
('Diamentowa'),
('Słowaskiego'),
('Frontowa'),
('Wspólna'),
('Opatowska'),
('Kroshmalna')

INSERT INTO dbo.DzieciRodziny
VALUES
(1,4),
(2,3),
(3,8),
(4,5),
(5,5)

INSERT INTO dbo.Dziecko
VALUES
('Marcin','Sobon','1991-01-08'),
('Darek','Gregorok','1997-07-01'),
('Aleksandra','Gura','1988-10-03'),
('Dominika','Vinik','2000-05-05'),
('Maxim','Vinik','2004-03-11')

INSERT INTO dbo.Edukacja
VALUES
(1,1),
(4,2),
(2,4),
(5,3),
(7,2)

INSERT INTO dbo.Specjalnosc
VALUES
('Front_End Developer'),
('Electromonter'),
('Fryzjer'),
('Logist'),
('Arhitekt'),
('Sprzedawca'),
('Ekonomista')

INSERT INTO dbo.StopienUkoncenia
VALUES
('2 stopien','Politechnika Warszawska'),
('2 stopien','UTH'),
('1 stopien','Vistula'),
('1 stopien','Uniwersytet Warszawski'),
('wykształcenie średnie','Kosinus')

INSERT INTO dbo.Praca
VALUES
(1,'Microsoft','Middle','Średnia wypłata'),
(1,'Microsoft','Senior','Wysoka wypłata'),
(6,'Zabka','Najstarszy sprzedawca','Niska wypłata'),
(3,'Salon Urody','Fryzjer','Niska wypłata'),
(2,'Elektronika','Inżyner','Średnia wypłata'),
(4,'MATI','Senior','Wysoka wypłata'),
(7,'BuchEconomic','Middle','Średnia wypłata')

INSERT INTO dbo.Inwestycja
VALUES
(1,'Aby dzieci mogły się wygodnie uczyć'),
(2,'O nowe dobre urządzenia, które pomogą wyleczyć człowieka'),
(3,'Szybko dostać się z jednego punktu do drugiego'),
(5,'Aby zwierzęta były dobrze obserwowane')

INSERT INTO dbo.GdzieInwestowac
VALUES
('Szkoła'),
('Szpital'),
('Droga'),
('Uniwersytet'),
('Ogrody zoologiczne')

INSERT INTO dbo.Hobby
VALUES
('Samochody','Jedna godzina na dzień','Bardzo kocham remontować samochody'),
('Łyżwa','Jedna godzina na tydzień','Nie myślisz o problemach'),
('Oglądać filmy','Półtora godziny na dzień','Możesz się czegoś nauczyć z filmu'),
('Programować','Cały wolny czas','Uwielbiam, gdy coś się układa')

INSERT INTO dbo.Inwalidztwo
VALUES
('Sparaliżowany',1,'W stanie wojny'),
('Złamana noga',0,'Spadł z drzewa'),
('Przeziębienie',0,' '),
('Złamana ręka',0,'Spadł z drabiny')

GO


-- Tworzymy klucze kompozytowe
ALTER TABLE dbo.Person
ADD FOREIGN KEY (Id_Zamieszkanie) REFERENCES Zamieszkanie(ID);

ALTER TABLE dbo.Person
ADD FOREIGN KEY (Id_Edukacja) REFERENCES Edukacja(ID);

ALTER TABLE dbo.Person
ADD FOREIGN KEY (Id_Praca) REFERENCES Praca(ID);

ALTER TABLE dbo.Person
ADD FOREIGN KEY (Id_Inwestycja) REFERENCES Inwestycja(ID);

ALTER TABLE dbo.Person
ADD FOREIGN KEY (Id_Hobby) REFERENCES Hobby(ID);

ALTER TABLE dbo.Person
ADD FOREIGN KEY (Id_Inwalidztwo) REFERENCES Inwalidztwo(ID);

ALTER TABLE dbo.Zamieszkanie
ADD FOREIGN KEY (Id_Dzielnica) REFERENCES Dzielnica(ID);

ALTER TABLE dbo.DzieciRodziny
ADD FOREIGN KEY (Id_Dziecko) REFERENCES Dziecko(ID);

ALTER TABLE dbo.DzieciRodziny
ADD FOREIGN KEY (Id_Person) REFERENCES Person(ID);

ALTER TABLE dbo.Edukacja
ADD FOREIGN KEY (Id_Specjalnosc) REFERENCES Specjalnosc(ID);

ALTER TABLE dbo.Edukacja
ADD FOREIGN KEY (Id_StopienUkoncenia) REFERENCES StopienUkoncenia(ID);

ALTER TABLE dbo.Praca
ADD FOREIGN KEY (Id_Specjalnosc) REFERENCES Specjalnosc(ID);

ALTER TABLE dbo.Inwestycja
ADD FOREIGN KEY (Id_GdzieInwestowac) REFERENCES GdzieInwestowac(ID);

GO

-- Zapytanie 1:
-- Pokazuje wszystkich ludzi które chcą inwestować w szpital

SELECT P.Imie,P.Nazwisko,P.Rok,P.StanBraka,Z.Miescowosc,Z.Miasto,DZ.Dzielnica,GI.GdzieInwestowac,I.Komentarz FROM dbo.Person P
INNER JOIN dbo.Inwestycja I ON P.Id_Inwestycja = I.ID
INNER JOIN dbo.GdzieInwestowac GI ON I.Id_GdzieInwestowac = GI.ID
INNER JOIN dbo.Zamieszkanie Z ON P.Id_Zamieszkanie = Z.ID
INNER JOIN dbo.Dzielnica DZ ON Z.Id_Dzielnica = DZ.ID
WHERE GI.GdzieInwestowac = 'Szpital'
GO

-- Zapytanie 2:
-- Pokazuje wszystkich ludzi zawód których nie zgadza się z kierunkiem ukonczonych studiów

SELECT P.Imie,P.Nazwisko,P.Rok,P.StanBraka,Z.Miescowosc,Z.Miasto,DZ.Dzielnica,
SS.Specjalnosc as 'Specjalność Pracy',PR.NazwaFirmy,PR.Poziom,PR.Wynagrodzenie,
S.Specjalnosc as 'Specjalność Edukacji',SU.NazwaInstytucji,SU.StopienUkoncenia
FROM dbo.Person P
INNER JOIN dbo.Zamieszkanie Z ON P.Id_Zamieszkanie = Z.ID
INNER JOIN dbo.Dzielnica DZ ON Z.Id_Dzielnica = DZ.ID
INNER JOIN dbo.Praca PR ON P.Id_Praca = PR.ID
INNER JOIN dbo.Edukacja E ON P.Id_Edukacja = E.ID
INNER JOIN dbo.Specjalnosc S ON E.Id_Specjalnosc = S.ID
INNER JOIN dbo.Specjalnosc SS ON PR.Id_Specjalnosc = SS.ID
INNER JOIN dbo.StopienUkoncenia SU ON E.Id_StopienUkoncenia = SU.ID
WHERE S.Specjalnosc != SS.Specjalnosc
GO

-- tworzenie LOGIN

CREATE LOGIN Administrator  
    WITH PASSWORD = 'qwaszx123';  
GO  

-- tworzenie użytkownika dla LOGIN wyżej  
CREATE USER Administrator  FOR LOGIN Administrator;  
GO  

CREATE LOGIN Ankietnik  
    WITH PASSWORD = '123qw';  
GO  

CREATE USER Ankietnik   FOR LOGIN Ankietnik;  
GO 

CREATE LOGIN Inwestor
    WITH PASSWORD = '1234567890';  
GO  

CREATE USER Inwestor FOR LOGIN Inwestor;  
GO 

-- Nadanie uprawnień dla użytkowników

GRANT SELECT,INSERT,UPDATE ON dbo.Inwestycja TO Inwestor;
GO
GRANT SELECT,INSERT,UPDATE ON dbo.GdzieInwestowac TO Inwestor;
GO

GRANT SELECT,INSERT,UPDATE ON SCHEMA :: dbo TO Ankietnik;
GO
GRANT SELECT,INSERT,UPDATE,ALTER,DELETE ON SCHEMA :: dbo TO Administrator;
GO
