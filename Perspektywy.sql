USE [SpisLudnosci]
GO

CREATE VIEW Obywatel.[PokazLudziZWyksztalceniemWyzszym] AS
SELECT p.Imie, p.Nazwisko, p.NumerDocumentu, s.Specjalnosc, su.StopienUkoncenia
FROM Obywatel.Person p
JOIN [Dzialalnosc].Edukacja e ON e.Id = p.Id_Edukacja
JOIN [Dzialalnosc].StopienUkoncenia su ON su.ID = e.Id_StopienUkoncenia
JOIN [Dzialalnosc].Specjalnosc s ON s.ID = e.Id_Specjalnosc
WHERE su.StopienUkoncenia IN ('1 stopien', '2 stopien')



CREATE VIEW Inwest.[InwestycjaMiast] AS
SELECT DISTINCT z.Miasto, di.GdzieInwestowac, COUNT(di.GdzieInwestowac) as iloscCasow
FROM Inwest.GdzieInwestowac di 
JOIN Inwest.Inwestycja i ON i.Id_GdzieInwestowac = di.Id
JOIN Obywatel.Person p ON p.Id_Inwestycja = i.Id
JOIN Obywatel.Zamieszkanie z ON z.Id = p.Id_Zamieszkanie
GROUP BY z.Miasto, di.GdzieInwestowac