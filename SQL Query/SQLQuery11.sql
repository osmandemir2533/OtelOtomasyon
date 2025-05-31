--kursor
-- �rnek: Personelin departman ad�n� e�le�tirip bir log tablosuna yazd�rma

-- De�i�kenlerin tan�mlanmas�
DECLARE @PersonelID INT
DECLARE @AdSoyad NVARCHAR(100)
DECLARE @DepartmanID INT
DECLARE @DepartmanAd NVARCHAR(100)

-- Kursor tan�mlanmas�
DECLARE PersonelCursor CURSOR FOR
SELECT PersonelID, AdSoyad, Departman
FROM TblPersonel

-- Kursor a��lmas�
OPEN PersonelCursor

-- �lk sat�r�n al�nmas�
FETCH NEXT FROM PersonelCursor INTO @PersonelID, @AdSoyad, @DepartmanID

-- D�ng�: T�m personel bilgileri i�leniyor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- DepartmanAd bilgisini alma
    SELECT @DepartmanAd = DepartmanAd
    FROM TblDepartman
    WHERE DepartmanID = @DepartmanID

    -- Log tablosuna ekleme (�rnek i�lem)
    INSERT INTO TblLog (PersonelID, AdSoyad, DepartmanAd, Tarih)
    VALUES (@PersonelID, @AdSoyad, @DepartmanAd, GETDATE())

    -- Sonraki sat�ra ge�
    FETCH NEXT FROM PersonelCursor INTO @PersonelID, @AdSoyad, @DepartmanID
END

-- Kursor kapat�lmas�
CLOSE PersonelCursor

-- Kursor'un bellekten temizlenmesi
DEALLOCATE PersonelCursor

SELECT * FROM TblLog;
