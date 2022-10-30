USE [SpisLudnosci]
GO
CREATE NONCLUSTERED INDEX indexZamieszkanie ON SpisLudnosci.Obywatel.Person (Id_Zamieszkanie);
GO
CREATE NONCLUSTERED INDEX indexEdukacja ON SpisLudnosci.Obywatel.Person (Id_Edukacja);
GO
CREATE NONCLUSTERED INDEX indexPraca ON SpisLudnosci.Obywatel.Person (Id_Praca);
GO
CREATE NONCLUSTERED INDEX indexInwestycja ON SpisLudnosci.Obywatel.Person (Id_Inwestycja);
GO
CREATE NONCLUSTERED INDEX indexHobby ON SpisLudnosci.Obywatel.Person (Id_Hobby);
GO
CREATE NONCLUSTERED INDEX indexInwalidztwo ON SpisLudnosci.Obywatel.Person (Id_Inwalidztwo);
GO

CREATE NONCLUSTERED INDEX indexSpecjalnosc ON SpisLudnosci.Dzialalnosc.Edukacja (Id_Specjalnosc);
GO
CREATE NONCLUSTERED INDEX indexStopienUkoncenia ON SpisLudnosci.Dzialalnosc.Edukacja (Id_StopienUkoncenia);
GO

CREATE NONCLUSTERED INDEX indexGdzieInwestowac ON SpisLudnosci.Inwest.Inwestycja (Id_GdzieInwestowac);
GO

CREATE NONCLUSTERED INDEX indexMiasto ON SpisLudnosci.obywatel.Dzielnica (Id_Miasto);
GO

CREATE NONCLUSTERED INDEX indexSpecjalnoscPraca ON SpisLudnosci.Dzialalnosc.Praca (Id_Specjalnosc);
GO

CREATE NONCLUSTERED INDEX indexDziecko ON SpisLudnosci.Obywatel.DzieciRodziny (Id_Dziecko);
GO
CREATE NONCLUSTERED INDEX indexForPerson ON SpisLudnosci.Obywatel.DzieciRodziny (Id_ForPerson);
GO


CREATE NONCLUSTERED INDEX indexImie ON SpisLudnosci.Obywatel.Person (Imie);
GO
CREATE NONCLUSTERED INDEX indexNazwisko ON SpisLudnosci.Obywatel.Person (Nazwisko);
GO
CREATE NONCLUSTERED INDEX indexDataUrodzenia ON SpisLudnosci.Obywatel.Person (DataUrodzenia);
GO
CREATE NONCLUSTERED INDEX indexUlica ON SpisLudnosci.Obywatel.Person (Ulica);
GO
CREATE NONCLUSTERED INDEX indexMieszkanie ON SpisLudnosci.Obywatel.Person (Mieszkanie);
GO


SELECT * FROM Obywatel.Person
SELECT * FROM Obywatel.Person WITH(INDEX(indexZamieszkanie))
SELECT * FROM Obywatel.Person WITH(INDEX(indexImie))