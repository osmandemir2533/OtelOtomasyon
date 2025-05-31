CREATE TRIGGER StokArttir
ON TblUrunHareket
AFTER INSERT
AS
BEGIN
    DECLARE @deger INT;
    DECLARE @id INT;
    DECLARE @tur NVARCHAR(5);

    -- inserted tablosundan gerekli de�erleri al�yoruz
    SELECT @tur = HareketTuru, @deger = miktar, @id = Urun FROM inserted;

    -- Giri� i�lemi i�in toplam� art�r�yoruz
    IF (@tur = 'Giri�') 
    BEGIN
        UPDATE TblUrun
        SET Toplam = Toplam + @deger
        WHERE UrunID = @id;
    END

    -- ��k�� i�lemi i�in toplam� azalt�yoruz
    ELSE IF (@tur = '��k��') 
    BEGIN
        UPDATE TblUrun
        SET Toplam = Toplam - @deger
        WHERE UrunID = @id;
    END
END;
