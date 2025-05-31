--view ürün ve ürün harkeket birleþimi
CREATE VIEW vw_UrunStokDurumu
AS
SELECT 
    uh.Hareketid,
    u.UrunID,
    u.UrunAd AS UrunAdi,
    u.UrunGrup,
    u.Birim,
    u.Fiyat AS UrunFiyati,
    u.Toplam AS StokMiktari,
    uh.HareketTuru,
    uh.Miktar AS HareketMiktari,
    uh.Tarih AS HareketTarihi,
    uh.Aciklama AS HareketAciklama,
    uh.BirimFiyat AS HareketBirimFiyati,
    uh.ToplamFiyat AS HareketToplamFiyati
FROM 
    TblUrun u
LEFT JOIN 
    TblUrunHareket uh ON u.UrunID = uh.Urun;


SELECT * FROM vw_UrunStokDurumu;
