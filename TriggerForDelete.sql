USE SpisLudnosci
GO
CREATE TRIGGER Obywatel.trg_MoveToHistory 
   ON Obywatel.Person
   AFTER DELETE
AS 
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Journal.PersonHistory
	(
	ID_Person,
	Imie, 
	Nazwisko ,
	DataUrodzenia,
	NumerDocumentu,
	Id_Zamieszkanie,
	Ulica,
	Dom,
	Mieszkanie,
	KodPocztowy,
	Id_Edukacja,
	Id_Praca,
	Id_Inwestycja,
	StanBraka,
	Id_Hobby,
	Id_Inwalidztwo,
	dataSpisu
	)
    SELECT 
	d.ID,
	d.Imie, 
	d.Nazwisko ,
	d.DataUrodzenia,
	d.NumerDocumentu,
	d.Id_Zamieszkanie,
	d.Ulica,
	d.Dom,
	d.Mieszkanie,
	d.KodPocztowy,
	d.Id_Edukacja,
	d.Id_Praca,
	d.Id_Inwestycja,
	d.StanBraka,
	d.Id_Hobby,
	d.Id_Inwalidztwo,
	d.dataSpisu
	FROM deleted d

END
GO
