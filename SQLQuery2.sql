USE [Klinika]
GO
CREATE TABLE dbo.UrodzoneDzieci(
ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Imie nvarchar(255),
Nazwisko nvarchar(255),
Prod int FOREIGH KEY REFERENCES dbo.porody(ID),
Ocena_dziecka smallint,
waga float
);

INSERT INTO dbo.Lekarze(Imie, Nazwisko, PESEL,data_zatrud)
VALUES
(N'Mihae0',N'Scubac0',0123456789,'1998-01-01'),
(N'Mihae1',N'Scubac1',0123456789,'1998-01-01'),
(N'Mihae2',N'Scubac2',0123456789,'1998-01-01'),
(N'Mihae3',N'Scubac3',0123456789,'1998-01-01'),
(N'Mihae4',N'Scubac4',0123456789,'1998-01-01')

INSERT INTO dbo.Pacjentki(Imie, Nazwisko, PESEL,adress_zam,telefon)
VALUES
(N'Mihae5',N'Scubac5',1123456789,N'Kazubow 5','32323232'),
(N'Mihae6',N'Scubac6',1123456789,N'Kazubow 5','32323232'),
(N'Mihae7',N'Scubac7',1123456789,N'Kazubow 5','32323232'),
(N'Mihae8',N'Scubac8',1123456789,N'Kazubow 5','32323232'),
(N'Mihae9',N'Scubac9',1123456789,N'Kazubow 5','32323232')

INSERT INTO dbo.Wizyty(oplata,przyjmujacy_lekarz,rodzaj_wizyty, umowiona_pacjentka, data_wizyty)
VALUES
(22.22, 3, N'USG', 1, '2021-01-01'),
(22.22, 3, N'USG', 1, '2021-01-02'),
(22.22, 3, N'USG', 1, '2021-01-03'),
(22.22, 3, N'USG', 1, '2021-01-04')

INSERT INTO dbo.Porody(nr_Sali, ID_Pacjentka, typ_porodu,suma_oplat,data_porodu,uwagi)
VALUES
(1, 5, 'naturalny', 99.99, '2021-02-01', N'OK'),
(1, 6, 'naturalny', 99.99, '2021-02-01', N'OK'),
(1, 7, 'naturalny', 99.99, '2021-02-01', N'OK'),
(1, 8, 'naturalny', 99.99, '2021-02-01', N'blizniaczy'),
(1, 9, 'naturalny', 99.99, '2021-02-01', N'OK'),
(1, 10, 'naturalny', 99.99, '2021-02-01', N'OK')

INSERT INTO dbo.UrodzoneDzieci(Imie, ID_Porod,Ocena_dziecka, waga)
VALUES
(N'Piotr1', 1, 7, 10),
(N'Piotr2', 2, 7, 10),
(N'Piotr3', 3, 7, 10),
(N'Piotr4', 4, 7, 10),
(N'Piotr5', 5, 7, 10)

