# Otel Otomasyon Projesi

Otel Otomasyon, otel yönetimi süreçlerini dijitalleştiren, modern, kapsamlı ve çok katmanlı bir otomasyon sistemidir. Proje, ileri düzey veritabanı modellemesi, SQL ve yazılım mühendisliği prensipleriyle geliştirilmiştir.

[![GitHub](https://img.shields.io/badge/GitHub-Repo-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/osmandemir2533/OtelOtomasyon)

---

## 🚀 Projeyi Çalıştırmak İçin

### 1. Repoyu Klonlayın

```bash
git clone https://github.com/osmandemir2533/OtelOtomasyon.git
cd OtelOtomasyon/OtelYeniProje/OtelYeniProje
```

### 2. Veritabanı Kurulumu ve Migration Sırası

#### a) Veritabanı Oluşturma
- `scripts yeni.txt` dosyasındaki komutları **SQL Server Management Studio**'da çalıştırarak temel veritabanı ve tabloları oluşturun.

#### b) App.config Connection String Ayarı
- `App.config` dosyasındaki `<connectionStrings>` bölümünü kendi SQL Server ayarınıza göre düzenleyin:

```xml
<connectionStrings>
  <add name="DbOtelYeniEntities" 
       connectionString="metadata=res://*/Entity.Model1.csdl|res://*/Entity.Model1.ssdl|res://*/Entity.Model1.msl;
       provider=System.Data.SqlClient;
       provider connection string='data source=YOUR_SERVER_NAME;
       initial catalog=otelRezervasyonu;
       integrated security=True;
       pooling=False;
       multipleactiveresultsets=True;
       encrypt=True;
       trustservercertificate=True;
       application name=EntityFramework'" 
       providerName="System.Data.EntityClient"/>
</connectionStrings>
```
> **Not:** `YOUR_SERVER_NAME` kısmını kendi bilgisayarınızdaki SQL Server adıyla değiştirin.

#### c) Migration İşlemleri
- Visual Studio'da **Package Manager Console**'u açın.
- Varsayılan projeyi doğru seçin.
- Sırayla şu komutları çalıştırın:
  ```powershell
  Add-Migration InitialCreate
  Update-Database
  ```
- Bu adımlar, Entity Framework ile modeldeki değişiklikleri veritabanına uygular.

#### d) NuGet Paketleri
- Projeyi açtıktan sonra NuGet paketlerini geri yükleyin (Restore).

---

### 3. Projeyi Çalıştırma
- Visual Studio'da `OtelYeniProje.sln` dosyasını açın.
- **Başlangıç projesi** olarak ana katmanı seçin.
- **Ctrl+F5** ile (hata ayıklama olmadan) başlatın.  
  > Hata ayıklama olmadan başlatmak, performans ve test açısından önerilir.

---

## 📁 Güncel Proje Klasör ve Dosya Yapısı

```
OtelOtomasyon/
│
├── OtelYeniProje/
│   ├── OtelYeniProje/
│   │   ├── App.config
│   │   ├── Program.cs
│   │   ├── OtelYeniProje.csproj
│   │   ├── Model1.edmx
│   │   ├── Model1.Designer.cs
│   │   ├── Model1.edmx.diagram
│   │   ├── packages.config
│   │   ├── Form1.cs
│   │   ├── Form1.Designer.cs
│   │   ├── Form1.resx
│   │   ├── XtraReport1.cs / XtraReport2.cs / XtraReport3.cs
│   │   ├── XtraReport1.Designer.cs / ...
│   │   ├── XtraReport1.resx / ...
│   │   ├── bin/
│   │   ├── obj/
│   │   ├── Entity/
│   │   ├── Formlar/
│   │   ├── Properties/
│   │   ├── Repositories/
│   │   ├── Resources/
│   │   └── ...
│   ├── OtelYeniProje.sln
│
├── SQL Query/
│   ├── SQLQuery1.sql
│   ├── SQLQuery2.sql
│   ├── SQLQuery4.sql
│   ├── SQLQuery11.sql
│
├── scripts yeni.txt
├── ER Diagram Açıklamalar.txt
├── Veri Ekleme Silme Güncelleme.txt
├── otel_Otomasyon__yeni.drawio
└── ...
```

---

## 🗄️ Veritabanı Modeli ve İlişkiler

### ER Diyagramı ve İlişkisel Model

- Projenin ER diyagramı hem görsel (drawio, png) hem de açıklamalı olarak dosyalarda mevcuttur.
- **Tablolar arası ilişkiler**:  
  - Bire-bir, bire-çok, çok-çok ilişkiler
  - Zayıf varlıklar, varolma bağımlılığı, ayrışma, örtüşme, dışlama gibi tüm kavramsal yapılar uygulanmıştır.

#### Temel Tablolar ve İlişkiler
- **TblPersonel**: Otel çalışanları
- **TblMisafir**: Otel misafirleri
- **TblOda**: Odalar
- **TblRezervasyon**: Rezervasyonlar (TblMisafir ve TblOda ile ilişkili)
- **TblSaatliCalisan, TblSozlesmeliCalisan**: Personel alt tipleri (ISA ilişkisi)
- **TblProjeler, TblPersonelProjeler**: Çok-çok ilişki örneği
- **TblTasIt, TblTaksi, TblOtobus**: Dışlama (exclusion) ilişkisi
- **TblEsya, TblElektronik, TblMobilya**: Ayrışma (disjoint) ilişkisi
- **reservation_types, online_reservations, phone_reservations**: Örtüşme (overlapping) ilişkisi

#### ER Diyagramı Açıklamaları ve SQL Kodları

### • Varolma Bağımlılığı (Existence Dependency)
Bir `TblSaatliCalisan` kaydının yalnızca `TblPersonel` tablosundaki bir kayda bağlı olarak var olmasını sağlıyoruz. Yani `TblPersonel` silinirse, ona bağlı olan `TblSaatliCalisan` kaydı da silinir.

```sql
CREATE TABLE TblSaatliCalisan (
    SaatliCalisanID INT PRIMARY KEY IDENTITY(1,1),
    PersonelID INT NOT NULL,
    SaatUcreti DECIMAL(10,2),
    CalisilanSaat INT,
    FOREIGN KEY (PersonelID) REFERENCES TblPersonel(PersonelID) ON DELETE CASCADE
);
```

### • Zayıf Varlık (Weak Entity)
Bir sözleşme numarasına bağlı çalışan kaydı oluşturuyoruz. `TblSozlesme` tablosu `TblSozlesmeliCalisan`'a bağımlı bir zayıf varlık olacak:

```sql
CREATE TABLE TblSozlesme (
    SozlesmeID INT PRIMARY KEY IDENTITY(1,1),
    SozlesmeliCalisanID INT NOT NULL,
    SozlesmeDetay NVARCHAR(200),
    FOREIGN KEY (SozlesmeliCalisanID) REFERENCES TblSozlesmeliCalisan(SozlesmeliCalisanID) ON DELETE CASCADE
);
```

### • ISA Bağıntısı
`TblPersonel` tablosu ile `TblSaatliCalisan` ve `TblSozlesmeliCalisan` tabloları arasında bir ISA bağıntısı oluşturmak için bir ilişki kuruyoruz. Her iki tablo da `PersonelID` ile ana tabloyu referans alır:

```sql
CREATE TABLE TblSozlesmeliCalisan (
    SozlesmeliCalisanID INT PRIMARY KEY IDENTITY(1,1),
    PersonelID INT NOT NULL,
    SozlesmeNumarasi NVARCHAR(50),
    FOREIGN KEY (PersonelID) REFERENCES TblPersonel(PersonelID)
);

CREATE TABLE TblSaatliCalisan (
    SaatliCalisanID INT PRIMARY KEY IDENTITY(1,1),
    PersonelID INT NOT NULL,
    SaatUcreti DECIMAL(10,2),
    CalisilanSaat INT,
    FOREIGN KEY (PersonelID) REFERENCES TblPersonel(PersonelID) ON DELETE CASCADE
);
```

### • Dışlama (Exclusion) Yapısı
Bir varlık yalnızca bir alt varlığa ait olabilir. Örneğin, bir "Taşıt" ya bir "Taksi" ya da bir "Otobüs" olabilir ama ikisi birden olamaz.

```sql
CREATE TABLE TblTasIt (
    TasItID INT PRIMARY KEY,
    Plaka NVARCHAR(20) NOT NULL,
    TasItTur NVARCHAR(20) NOT NULL CHECK (TasItTur IN ('Taksi', 'Otobus'))
);

CREATE TABLE TblTaksi (
    TaksiID INT PRIMARY KEY,
    TasItID INT UNIQUE,
    SarıRenk BIT NOT NULL,
    FOREIGN KEY (TasItID) REFERENCES TblTasIt(TasItID)
);

CREATE TABLE TblOtobus (
    OtobusID INT PRIMARY KEY,
    TasItID INT UNIQUE,
    YolcuKapasitesi INT NOT NULL,
    FOREIGN KEY (TasItID) REFERENCES TblTasIt(TasItID)
);

-- Trigger ile tür kontrolü
CREATE TRIGGER trg_TblTaksi_Check
ON TblTaksi
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        JOIN TblTasIt t ON i.TasItID = t.TasItID
        WHERE t.TasItTur <> 'Taksi'
    )
    BEGIN
        RAISERROR('TasItID için uygun TasItTur bulunamadı. Yalnızca "Taksi" türü eklenebilir.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO TblTaksi (TaksiID, TasItID, SarıRenk)
        SELECT TaksiID, TasItID, SarıRenk
        FROM INSERTED;
    END
END;
```

### • Ayrışma (Disjoint)
Bir varlık aynı anda birden fazla alt varlığa ait olamaz. Örneğin, bir "Eşya" ya bir "Elektronik Ürün" ya da bir "Mobilya Ürün" olabilir ama ikisi birden olamaz.

```sql
CREATE TABLE TblEsya (
    EsyaID INT PRIMARY KEY,
    EsyaAd NVARCHAR(50),
    EsyaTur NVARCHAR(20) CHECK (EsyaTur IN ('Elektronik', 'Mobilya'))
);

CREATE TABLE TblElektronik (
    ElektronikID INT PRIMARY KEY,
    EsyaID INT UNIQUE,
    Voltaj INT NOT NULL,
    FOREIGN KEY (EsyaID) REFERENCES TblEsya(EsyaID)
);

CREATE TABLE TblMobilya (
    MobilyaID INT PRIMARY KEY,
    EsyaID INT UNIQUE,
    Malzeme NVARCHAR(50) NOT NULL,
    FOREIGN KEY (EsyaID) REFERENCES TblEsya(EsyaID)
);
```

### • Örtüşme (Overlapping)
Bir varlık aynı anda birden fazla alt varlığa ait olabilir. Örneğin, bir çalışan hem eğitmen hem danışman olabilir. Projede örnek:

```sql
CREATE TABLE reservation_types (
    ReservationType_ID INT IDENTITY(1,1) PRIMARY KEY,
    ReservationTypeName VARCHAR(50) NOT NULL
);

INSERT INTO reservation_types (ReservationTypeName) VALUES ('Online Rezervasyon'), ('Telefonla Rezervasyon');

CREATE TABLE online_reservations (
    Reservation_ID INT IDENTITY(1,1) PRIMARY KEY,
    Start_Date DATE,
    End_Date DATE,
    ReservationType_ID INT,
    FOREIGN KEY (ReservationType_ID) REFERENCES reservation_types(ReservationType_ID)
);

CREATE TABLE phone_reservations (
    Reservation_ID INT IDENTITY(1,1) PRIMARY KEY,
    Start_Date DATE,
    End_Date DATE,
    ReservationType_ID INT,
    FOREIGN KEY (ReservationType_ID) REFERENCES reservation_types(ReservationType_ID)
);

-- Örtüşme Durumu Sorgusu
SELECT o.Reservation_ID, p.Reservation_ID, 
       CASE WHEN o.Start_Date <= p.End_Date AND o.End_Date >= p.Start_Date THEN 'Evet' ELSE 'Hayır' END AS Overlap_Status
FROM online_reservations o
JOIN phone_reservations p ON o.Start_Date <= p.End_Date AND o.End_Date >= p.Start_Date;
```

### • Çoğa Çok İlişki (Many-to-Many)
Çoğa çok ilişki olduğu için ara tabloya ihtiyacımız var. `TblPersonelProjeler` ile personel ve projeler arasında çoğa çok ilişki kurulmuştur.

```sql
CREATE TABLE TblProjeler (
    ProjeID INT IDENTITY(1,1) NOT NULL,
    ProjeAd NVARCHAR(100) NOT NULL,
    BaslangicTarih DATE,
    BitisTarih DATE,
    PRIMARY KEY (ProjeID)
);

CREATE TABLE TblPersonelProjeler (
    PersonelID INT NOT NULL,
    ProjeID INT NOT NULL,
    PRIMARY KEY (PersonelID, ProjeID),
    FOREIGN KEY (PersonelID) REFERENCES TblPersonel(PersonelID) ON DELETE CASCADE,
    FOREIGN KEY (ProjeID) REFERENCES TblProjeler(ProjeID) ON DELETE CASCADE
);
```

---

## 🛠️ SQL Kavramları ve Kodları

### Saklı Prosedür (Stored Procedure)
**Amaç:** Sık kullanılan sorguları ve işlemleri saklamak.  
**Örnek:** `SQLQuery1.sql` dosyasında `OdaDurum` prosedürü:
```sql
ALTER Procedure [dbo].[OdaDurum]
As
Select DurumAd, Count(*) as 'Sayi'
From TblOda
Inner Join TblDurum On TblDurum.DurumID = TblOda.Durum
Group By DurumAd
```

### Trigger
**Amaç:** Tabloya veri eklenince/çıkınca otomatik işlem yapmak.  
**Örnek:** `SQLQuery2.sql` dosyasında stok güncelleme trigger'ı:
```sql
CREATE TRIGGER StokArttir
ON TblUrunHareket
AFTER INSERT
AS
BEGIN
    -- Giriş/Çıkış türüne göre stok güncelle
END
```

### View
**Amaç:** Sık kullanılan, birden fazla tabloyu birleştiren sanal tablo oluşturmak.  
**Örnek:** `SQLQuery4.sql` dosyasında ürün stok durumu view'ı:
```sql
CREATE VIEW vw_UrunStokDurumu AS
SELECT ... FROM TblUrun u LEFT JOIN TblUrunHareket uh ON u.UrunID = uh.Urun;
```

### Cursor
**Amaç:** Satır satır işlem yapmak için kullanılır.  
**Örnek:** `SQLQuery11.sql` dosyasında personel departman loglama:
```sql
DECLARE PersonelCursor CURSOR FOR
SELECT PersonelID, AdSoyad, Departman FROM TblPersonel
...
```

---

## 🔄 Veri Ekleme, Silme, Güncelleme (Çalışan/Çalışmayan Kısımlar)

- **GÖREV** ekleme işleminde id sıralaması otomatik yapıyor, sen yazma id numara (IDENTITY)
- **DEPARTMAN** ekleme işleminde id sıralaması otomatik yapamıyor, manuel id numara yaz
- **KASA**'da giren ve çıkan değerler trigger'larla çalışıyor
- **ODA** ekleme işleminde id sıralaması otomatik yapıyor, sen yazma id numara (IDENTITY)
- **TELEFON** ekleme işleminde id sıralaması otomatik yapıyor, sen yazma id numara (IDENTITY)
- **ÜLKE** ekleme işleminde id sıralaması otomatik yapıyor, sen yazma id numara (IDENTITY)
- **ÜRÜN GRUP** ekleme işleminde id sıralaması otomatik yapıyor, sen yazma id numara (IDENTITY)
- **İLLER** ekleme işleminde id sıralaması otomatik yapıyor, sen yazma id numara (IDENTITY) -- sadece SSMS'de ekleniyor
- **İLÇELER** ekleme işleminde IDENTITY özelliğini açmak lazım (sadece SSMS'de ekleniyor):
  ```sql
  SET IDENTITY_INSERT [otelRezervasyonu].[dbo].[ilceler] ON;
  -- insert işlemleri
  SET IDENTITY_INSERT [otelRezervasyonu].[dbo].[ilceler] OFF;
  ```
- **Müşteri (misafir)** kısmı arayüzden eklenmiyor. SSMS'den şu komutları yaz:
  ```sql
  INSERT INTO [otelRezervasyonu].[dbo].[TblMisafir] 
  ([AdSoyad], [TC], [Mail], [Telefon], [Adres], [Aciklama], [KimlikFoto1], [KimlikFoto2], [Ulke], [Durum], [sehir], [ilce])
  VALUES 
  ('Osman Demir', '12345678901', 'osman.demir@example.com', '05001234567', 'Örnek Mah. 123 Sokak No: 5', 'Yeni müşteri', NULL, NULL, 3, 7, 30, 86);
  ```
- **Personel** kısmı arayüzden eklenmiyor. SSMS'den şu komutları yaz:
  ```sql
  INSERT INTO [otelRezervasyonu].[dbo].[TblPersonel]
  ([AdSoyad], [TC], [Adres], [Telefon], [Mail], [IseGirisTarih], [IstenCikisTarih], [Departman], [Gorev], [Aciklama], [Durum], [KimlikOn], [KimlkArka], [Sifre], [Yetki])
  VALUES 
  ('Osman Al Mansouri', '12345678901', 'Örnek Mah. 123 Sokak No: 5', '05001234567', 'osman.almansouri@example.com', '2024-01-01', NULL, 8, 5, 'Staj işlemleri hakkında bilgiler girildi.', 7, NULL, NULL, 'parola123', 3);
  ```
- **Ürünler** kısmında trigger'lar kullanıldı. Hem arayüzde hem de SSMS'de ekleme/güncelleme işlemleri yapılabiliyor.
  ```sql
  INSERT INTO [otelRezervasyonu].[dbo].[TblUrun]
  ([UrunAd], [UrunGrup], [Birim], [Fiyat], [Toplam], [Kdv], [Durum])
  VALUES 
  ('Mercimek', 12, 2, 6, 100, 10, 7);

  UPDATE [otelRezervasyonu].[dbo].[TblUrun]
  SET [Durum] = 13
  WHERE [UrunAd] = 'Mercimek' AND [Fiyat] = 6;
  ```
- **Rezervasyon** kısmı hem arayüzde hem de SSMS'de ekleme/güncelleme işlemleri yapılabiliyor. Veriyi güncelleme veya silme işleminde otomatik olarak iptal olan/aktif rezervasyon gibi ilişkili kutucuklar da güncelleniyor.
  ```sql
  INSERT INTO [otelRezervasyonu].[dbo].[TblRezervasyon]
  (
    [Misafir], [GirisTarih], [CikisTarih], [Kisi], [Oda], [Telefon], [Aciklama], [Durum], [Kisi1], [Kisi2], [Kisi3], [Toplam]
  )
  VALUES
  (
    3, '2024-12-25', '2024-12-30', 1, 5, '0555 123 45 67', 'Oda 5 rezervasyonu yapıldı.', 20, NULL, NULL, NULL, 1500
  );

  UPDATE [otelRezervasyonu].[dbo].[TblRezervasyon]
  SET [Telefon] = '5788523456'
  WHERE [Misafir] = 3;
  ```

---

## 🧩 Migration ve Sıfırdan Kurulum

1. **Veritabanı scriptini** (`scripts yeni.txt`) çalıştırın.
2. Eğer Entity Framework kullanıyorsanız:
   - Migration oluşturun: `Add-Migration InitialCreate`
   - Veritabanını güncelleyin: `Update-Database`
3. **Tüm tablolar, ilişkiler, trigger, view ve prosedürler otomatik oluşacaktır.**
4. **Dikkat:** Migration dosyaları repoda olmayabilir, her geliştirici kendi ortamında migration basmalıdır.

---

## 🖼️ Diyagramlar ve Görseller

- **ER Diyagramı**:  
  ![ER Diyagramı](./otel_Otomasyon__yeni.drawio.png)  
  (drawio dosyasını açarak veya export ederek görüntüleyebilirsiniz)
- **EDMX/Database Diagram**:  
  ![Database Diagram](./dbdiagram.png)  
  (Proje dosyalarında veya yukarıdaki görsellerde mevcut)

---

## ⚙️ Proje Çalıştırma Notları

- Projeyi **Ctrl+F5** ile başlatın (hata ayıklama olmadan).
- Gerekli NuGet paketlerini yükleyin (ör. EntityFramework, SQLClient vs.).
- Bağlantı ayarlarını kendi bilgisayarınıza göre güncelleyin.
- Migration işlemlerini kendi ortamınızda yapın.
- SQL Server'ın çalışır durumda olduğundan emin olun.

---

## 📬 İletişim

Her türlü soru ve destek için:

[![Web Sitem](https://img.shields.io/badge/Web%20Site-1976d2?style=for-the-badge&logo=google-chrome&logoColor=white)](https://osmandemir2533.github.io/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0a66c2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/osmandemir2533/)

---

> Proje, ileri düzey veritabanı modellemesi, SQL ve yazılım mühendisliği prensipleriyle geliştirilmiştir.  
> Tüm kod, diyagram ve açıklamalar repoda ve yukarıdaki dosyalarda mevcuttur.

---

**Not:**  
- Proje ile ilgili tüm SQL, ER, trigger, view, prosedür, migration ve CRUD örnekleri dosyalarda detaylıca açıklanmıştır.
- Herhangi bir hata veya eksiklikte yukarıdaki adımları ve dosyaları kontrol ediniz.

---

## ⚠️ Kritik Notlar

- **Veritabanı oluşturulduktan sonra mutlaka App.config güncellenmeli.**
- **Migration işlemleri, veritabanı ve bağlantı ayarı tamamlandıktan sonra yapılmalı.**
- **Projeyi çalıştırmadan önce NuGet paketleri yüklenmeli.**
- **Projeyi Ctrl+F5 ile başlatın (hata ayıklama olmadan).**
- **Migration dosyaları repoda olmayabilir, her geliştirici kendi ortamında migration basmalıdır.**