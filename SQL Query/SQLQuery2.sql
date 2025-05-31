CREATE TRIGGER StokArttir
ON TblUrunHareket
AFTER INSERT
AS
BEGIN
    DECLARE @deger INT;
    DECLARE @id INT;
    DECLARE @tur NVARCHAR(5);

    -- inserted tablosundan gerekli deðerleri alýyoruz
    SELECT @tur = HareketTuru, @deger = miktar, @id = Urun FROM inserted;

    -- Giriþ iþlemi için toplamý artýrýyoruz
    IF (@tur = 'Giriþ') 
    BEGIN
        UPDATE TblUrun
        SET Toplam = Toplam + @deger
        WHERE UrunID = @id;
    END

    -- Çýkýþ iþlemi için toplamý azaltýyoruz
    ELSE IF (@tur = 'Çýkýþ') 
    BEGIN
        UPDATE TblUrun
        SET Toplam = Toplam - @deger
        WHERE UrunID = @id;
    END
END;
