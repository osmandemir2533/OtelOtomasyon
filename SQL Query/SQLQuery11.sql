--kursor
-- Örnek: Personelin departman adýný eþleþtirip bir log tablosuna yazdýrma

-- Deðiþkenlerin tanýmlanmasý
DECLARE @PersonelID INT
DECLARE @AdSoyad NVARCHAR(100)
DECLARE @DepartmanID INT
DECLARE @DepartmanAd NVARCHAR(100)

-- Kursor tanýmlanmasý
DECLARE PersonelCursor CURSOR FOR
SELECT PersonelID, AdSoyad, Departman
FROM TblPersonel

-- Kursor açýlmasý
OPEN PersonelCursor

-- Ýlk satýrýn alýnmasý
FETCH NEXT FROM PersonelCursor INTO @PersonelID, @AdSoyad, @DepartmanID

-- Döngü: Tüm personel bilgileri iþleniyor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- DepartmanAd bilgisini alma
    SELECT @DepartmanAd = DepartmanAd
    FROM TblDepartman
    WHERE DepartmanID = @DepartmanID

    -- Log tablosuna ekleme (örnek iþlem)
    INSERT INTO TblLog (PersonelID, AdSoyad, DepartmanAd, Tarih)
    VALUES (@PersonelID, @AdSoyad, @DepartmanAd, GETDATE())

    -- Sonraki satýra geç
    FETCH NEXT FROM PersonelCursor INTO @PersonelID, @AdSoyad, @DepartmanID
END

-- Kursor kapatýlmasý
CLOSE PersonelCursor

-- Kursor'un bellekten temizlenmesi
DEALLOCATE PersonelCursor

SELECT * FROM TblLog;
