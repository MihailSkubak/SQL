-- tworzenie bazy danych
create database SpisLudnosci
go 

--Zaczynamy działalność na bazie którą stworzyliśmy wyżej
USE [SpisLudnosci]
GO

Create schema Obywatel
Go
Create schema Inwest
Go
Create schema Dzialalnosc
Go
Create schema Journal
Go

-- Tworzymy tabeli 
CREATE TABLE Obywatel.Person(  
ID int NOT NULL PRIMARY KEY IDENTITY(1,1), -- klucz głowny / automatyczna inkrementacja ID
Imie nvarchar(50) NOT NULL, -- kolumna nie może być pusta
Nazwisko nvarchar(50) NOT NULL,
DataUrodzenia date NOT NULL,
NumerDocumentu nvarchar(50) NOT NULL,
Id_Zamieszkanie int,
Ulica nvarchar(50),
Dom nvarchar(10),
Mieszkanie smallint,
KodPocztowy nvarchar(10),
Id_Edukacja int,
Id_Praca int,
Id_Inwestycja INT,
StanBraka bit,
Id_Hobby int,
Id_Inwalidztwo int,
dataSpisu date
);


CREATE TABLE Journal.PersonHistory(  
ID_Person int NOT NULL PRIMARY KEY IDENTITY(1,1), 
Imie nvarchar(50) NOT NULL, -- kolumna nie może być pusta
Nazwisko nvarchar(50) NOT NULL,
DataUrodzenia date NOT NULL,
NumerDocumentu nvarchar(50) NOT NULL,
Id_Zamieszkanie int,
Ulica nvarchar(50),
Dom nvarchar(10),
Mieszkanie smallint,
KodPocztowy nvarchar(10),
Id_Edukacja int,
Id_Praca int,
Id_Inwestycja INT,
StanBraka bit,
Id_Hobby int,
Id_Inwalidztwo int,
dataSpisu date
);


CREATE TABLE Obywatel.Zamieszkanie(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Wojewodztwo nvarchar(50),
Miasto nvarchar(50)
);

CREATE TABLE Obywatel.Dzielnica(
ID_Miasto int,
Dzielnica nvarchar(50)
);

CREATE TABLE Obywatel.DzieciRodziny(
Id_Dziecko int,
Id_ForPerson int
);

CREATE TABLE Obywatel.Dziecko(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Imie nvarchar(50),
Nazwisko nvarchar(50),
RokUrodzeniaDziecka date
);

CREATE TABLE Dzialalnosc.Edukacja(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Id_Specjalnosc int,
Id_StopienUkoncenia int
);

CREATE TABLE Dzialalnosc.Specjalnosc(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Specjalnosc nvarchar(50)
);

CREATE TABLE Dzialalnosc.StopienUkoncenia(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
StopienUkoncenia nvarchar(50),
NazwaInstytucji nvarchar(50)
);

CREATE TABLE Dzialalnosc.Praca(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Id_Specjalnosc int,
NazwaFirmy nvarchar(50),
Poziom nvarchar(50),
Wynagrodzenie nvarchar(50)
);

CREATE TABLE Inwest.Inwestycja(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Id_GdzieInwestowac int,
Komentarz nvarchar(255)
);

CREATE TABLE Inwest.GdzieInwestowac(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
GdzieInwestowac nvarchar(50)
);

CREATE TABLE Obywatel.Hobby(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Hobby nvarchar(50),
IleCzasu nvarchar(50),
Komentarz nvarchar(255)
);

CREATE TABLE Obywatel.Inwalidztwo(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Choroba nvarchar(50),
SocjalniWyplaty bit,
Komentarz nvarchar(255)
);

GO

-- wypelniamy tabeli danymi

INSERT INTO Obywatel.Person
VALUES
('Bartosz','Cadr','1995-02-07','12345321',1,'Wrzeciono','10A',21,'01-961',1,1,3,0,4,NULL,'2021-01-01'),
('Albert','Tolak','1998-07-08','JD663452',2,'Aspekt','6',12,'01-951',4,3,4,0,2,NULL,'2021-01-01'),
('Daniel','Gregorok','1947-12-02','123222',3,'Krakusa','8B',33,'01-861',3,5,1,1,3,1,'2021-01-01'),
('Dominik','Sobon','1965-01-11','1234221111',4,'Brazownicza','9A',43,'02-961',2,6,2,1,1,2,'2021-01-01'),
('Eva','Vinik','1977-09-04','123111',5,'Andromedy','3',22,'01-551',5,7,2,1,2,NULL,'2021-01-01'),
('Anna','Vitt','1983-08-12','222233311',7,'Popiela','3G',2,'01-501',1,2,2,1,4,NULL,'2021-01-01'),
('Igor','Postek','2002-04-03','HG2123311',6,'Słowaskiego','4',1,'02-461',2,6,4,1,NULL,4,'2021-01-01'),
('Hanna','Gura','1963-11-06','231122234',8,'Frontowa','6H',5,'01-441',5,7,2,1,3,3,'2021-01-01')

INSERT INTO Journal.PersonHistory
VALUES
('Agata','Wesolowska','1985-03-09','444433333',1,'Lekka','1A',22,'04-441',1,1,3,0,4,NULL,'2010-01-01'),
('Karolina','Mielion','1998-05-08','6666555',2,'Wspolna','3F',27,'03-451',4,3,4,0,2,NULL,'2010-01-01'),
('Konrat','Prusik','1947-11-10','222211111',3,'Lindego','2',28,'02-321',3,5,1,1,3,1,'2010-01-01'),
('Marcin','Boddek','1965-03-11','99997777',4,'Opatowska','3A',66,'01-161',2,6,2,1,1,2,'2010-01-01')

INSERT INTO Obywatel.Zamieszkanie
VALUES
('Mazowiecka','Warszawa'),
('Malopolska','Krakow'),
('Lubelskie','Lublin'),
('Wielkopolska','Poznan'),
('Mazowiecka','Warszawa'),
('Mazowiecka','Warszawa'),
('Malopolska','Krakow'),
('Lubelskie','Lublin')

INSERT INTO Obywatel.Dzielnica
VALUES
(1,'Ursus'),
(2,'Sorus'),
(3,'Bursus'),
(4,'Warwas'),
(5,'Bielany'),
(6,'Mokotow'),
(7,'Korutow'),
(8,'Lopow')

INSERT INTO Obywatel.DzieciRodziny
VALUES
(1,4),
(2,3),
(3,8),
(4,5),
(5,5)

INSERT INTO Obywatel.Dziecko
VALUES
('Marcin','Sobon','1991-01-08'),
('Darek','Gregorok','1997-07-01'),
('Aleksandra','Gura','1988-10-03'),
('Dominika','Vinik','2000-05-05'),
('Maxim','Vinik','2004-03-11')

INSERT INTO Dzialalnosc.Edukacja
VALUES
(1,1),
(4,2),
(2,4),
(5,3),
(7,2)

INSERT INTO Dzialalnosc.Specjalnosc
VALUES
('Front_End Developer'),
('Electromonter'),
('Fryzjer'),
('Logist'),
('Arhitekt'),
('Sprzedawca'),
('Ekonomista')

INSERT INTO Dzialalnosc.StopienUkoncenia
VALUES
('2 stopien','Politechnika Warszawska'),
('2 stopien','UTH'),
('1 stopien','Vistula'),
('1 stopien','Uniwersytet Warszawski'),
('wyksztalcenie srednie','Kosinus')

INSERT INTO Dzialalnosc.Praca
VALUES
(1,'Microsoft','Middle','Srednia wyplata'),
(1,'Microsoft','Senior','Wysoka wyplata'),
(6,'Zabka','Najstarszy sprzedawca','Niska wyplata'),
(3,'Salon Urody','Fryzjer','Niska wyplata'),
(2,'Elektronika','Inzyner','Srednia wyplata'),
(4,'MATI','Senior','Wysoka wyplata'),
(7,'BuchEconomic','Middle','Srednia wyplata')

INSERT INTO Inwest.Inwestycja
VALUES
(1,'Aby dzieci mogly sie wygodnie uczyc'),
(2,'O nowe dobre urzadzenia, ktore pomoga wyleczyc czlowieka'),
(3,'Szybko dostac sie z jednego punktu do drugiego'),
(5,'Aby zwierzeta byly dobrze obserwowane')

INSERT INTO Inwest.GdzieInwestowac
VALUES
('Szkola'),
('Szpital'),
('Droga'),
('Uniwersytet'),
('Ogrody zoologiczne')

INSERT INTO Obywatel.Hobby
VALUES
('Samochody','Jedna godzina na dzien','Bardzo kocham remontowac samochody'),
('Lyzwa','Jedna godzina na tydzien','Nie myslisz o problemach'),
('Ogladac filmy','Poltora godziny na dzien','Mozesz się czegos nauczyc z filmu'),
('Programowac','Caly wolny czas','Uwielbiam, gdy cos sie uklada')

INSERT INTO Obywatel.Inwalidztwo
VALUES
('Sparalizowany',1,'W stanie wojny'),
('Zlamana noga',0,'Spadl z drzewa'),
('Przeziebienie',0,' '),
('Zlamana reka',0,'Spadl z drabiny')

GO


-- Tworzymy klucze obce
ALTER TABLE Obywatel.Person
ADD FOREIGN KEY (Id_Zamieszkanie) REFERENCES Obywatel.Zamieszkanie(ID);

ALTER TABLE Obywatel.Person
ADD FOREIGN KEY (Id_Edukacja) REFERENCES Dzialalnosc.Edukacja(ID);

ALTER TABLE Obywatel.Person
ADD FOREIGN KEY (Id_Praca) REFERENCES Dzialalnosc.Praca(ID);

ALTER TABLE Obywatel.Person
ADD FOREIGN KEY (Id_Inwestycja) REFERENCES Inwest.Inwestycja(ID);

ALTER TABLE Obywatel.Person
ADD FOREIGN KEY (Id_Hobby) REFERENCES Obywatel.Hobby(ID);

ALTER TABLE Obywatel.Person
ADD FOREIGN KEY (Id_Inwalidztwo) REFERENCES Obywatel.Inwalidztwo(ID);

ALTER TABLE Obywatel.Dzielnica
ADD FOREIGN KEY (Id_Miasto) REFERENCES Obywatel.Zamieszkanie(ID);

ALTER TABLE Obywatel.DzieciRodziny
ADD FOREIGN KEY (Id_Dziecko) REFERENCES Obywatel.Dziecko(ID);

ALTER TABLE Obywatel.DzieciRodziny
ADD FOREIGN KEY (Id_ForPerson) REFERENCES Obywatel.Person(ID);

ALTER TABLE Dzialalnosc.Edukacja
ADD FOREIGN KEY (Id_Specjalnosc) REFERENCES Dzialalnosc.Specjalnosc(ID);

ALTER TABLE Dzialalnosc.Edukacja
ADD FOREIGN KEY (Id_StopienUkoncenia) REFERENCES Dzialalnosc.StopienUkoncenia(ID);

ALTER TABLE Dzialalnosc.Praca
ADD FOREIGN KEY (Id_Specjalnosc) REFERENCES Dzialalnosc.Specjalnosc(ID);

ALTER TABLE Inwest.Inwestycja
ADD FOREIGN KEY (Id_GdzieInwestowac) REFERENCES Inwest.GdzieInwestowac(ID);

GO

-- Zapytanie 1:
-- Pokazuje wszystkich ludzi które chcą inwestować w szpital

SELECT P.Imie,P.Nazwisko,P.DataUrodzenia,P.StanBraka,Z.Wojewodztwo,Z.Miasto,DZ.Dzielnica,GI.GdzieInwestowac,I.Komentarz FROM Obywatel.Person P
INNER JOIN Inwest.Inwestycja I ON P.Id_Inwestycja = I.ID
INNER JOIN Inwest.GdzieInwestowac GI ON I.Id_GdzieInwestowac = GI.ID
INNER JOIN Obywatel.Zamieszkanie Z ON P.Id_Zamieszkanie = Z.ID
INNER JOIN Obywatel.Dzielnica DZ ON DZ.ID_Miasto = Z.ID
WHERE GI.GdzieInwestowac = 'Szpital'
GO

-- Zapytanie 2:
-- Pokazuje wszystkich ludzi zawód których nie zgadza się z kierunkiem ukonczonych studiów

SELECT P.Imie,P.Nazwisko,P.DataUrodzenia,P.StanBraka,Z.Wojewodztwo,Z.Miasto,DZ.Dzielnica,
SS.Specjalnosc as 'Specjalność Pracy',PR.NazwaFirmy,PR.Poziom,PR.Wynagrodzenie,
S.Specjalnosc as 'Specjalność Edukacji',SU.NazwaInstytucji,SU.StopienUkoncenia
FROM Obywatel.Person P
INNER JOIN Obywatel.Zamieszkanie Z ON P.Id_Zamieszkanie = Z.ID
INNER JOIN Obywatel.Dzielnica DZ ON DZ.ID_Miasto = Z.ID
INNER JOIN Dzialalnosc.Praca PR ON P.Id_Praca = PR.ID
INNER JOIN Dzialalnosc.Edukacja E ON P.Id_Edukacja = E.ID
INNER JOIN Dzialalnosc.Specjalnosc S ON E.Id_Specjalnosc = S.ID
INNER JOIN Dzialalnosc.Specjalnosc SS ON PR.Id_Specjalnosc = SS.ID
INNER JOIN Dzialalnosc.StopienUkoncenia SU ON E.Id_StopienUkoncenia = SU.ID
WHERE S.Specjalnosc != SS.Specjalnosc
GO

-- tworzenie LOGIN

CREATE LOGIN Administrator3  
    WITH PASSWORD = 'qwaszx123';  
GO  

-- tworzenie użytkownika dla LOGIN wyżej  
CREATE USER Administrator3  FOR LOGIN Administrator3;  
GO  

CREATE LOGIN Ankietnik3 
    WITH PASSWORD = '123qw';  
GO  

CREATE USER Ankietnik3   FOR LOGIN Ankietnik3;  
GO 

CREATE LOGIN Inwestor3
    WITH PASSWORD = '1234567890';  
GO  

CREATE USER Inwestor3 FOR LOGIN Inwestor3;  
GO 

-- Nadanie uprawnień dla użytkowników

GRANT SELECT,INSERT,UPDATE ON SCHEMA :: Inwest TO Inwestor3;
GO

GRANT SELECT,INSERT,UPDATE ON SCHEMA :: Obywatel TO Ankietnik3;
GO
GRANT SELECT,INSERT,UPDATE ON SCHEMA :: Dzialalnosc TO Ankietnik3;
GO
GRANT SELECT,INSERT,UPDATE ON SCHEMA :: Inwest TO Ankietnik3;
GO
GRANT SELECT,INSERT,UPDATE,ALTER,DELETE ON SCHEMA :: Obywatel TO Administrator3;
GO
GRANT SELECT,INSERT,UPDATE,ALTER,DELETE ON SCHEMA :: Dzialalnosc TO Administrator3;
GO
GRANT SELECT,INSERT,UPDATE,ALTER,DELETE ON SCHEMA :: Inwest TO Administrator3;
GO
GRANT SELECT,INSERT,UPDATE,ALTER,DELETE ON SCHEMA :: Journal TO Administrator3;
GO