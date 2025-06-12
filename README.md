# Otel Otomasyon Projesi

Otel Otomasyon, otel yönetimi süreçlerini dijitalleştiren, modern, kapsamlı ve çok katmanlı bir otomasyon sistemidir. Proje, ileri düzey veritabanı modellemesi, SQL, C# ve yazılım mühendisliği prensipleriyle geliştirilmiştir.

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/osmandemir2533)

---

## 🚀 Projeyi Çalıştırmak İçin

### 1. Repoyu Klonlayın

```bash
git clone https://github.com/osmandemir2533/OtelOtomasyon.git
cd OtelOtomasyon/OtelYeniProje/OtelYeniProje
```

### 2. Veritabanı Kurulumu ve Migration Sırası

#### a)  Veritabanı İlk Kurulum: scripts yeni.txt Kullanımı

Veritabanını ilk kez kurarken aşağıdaki adımları izleyin:

1. **SQL Server Management Studio (SSMS)** programını açın.
2. Sunucunuza bağlanın.
3. Sol menüde **Databases** (Veritabanları) kısmına sağ tıklayın ve **New Database...** seçeneğini seçin.
4. Açılan pencerede veritabanı adını (ör: `otelRezervasyonu`) yazın ve **OK** ile oluşturun.
5. Yeni oluşturduğunuz veritabanına tıklayın (sol menüde).
6. Üst menüden **New Query** butonuna tıklayın.
7. Açılan sorgu penceresine, projenizdeki `scripts yeni.txt` dosyasının içeriğini **tamamını kopyalayıp yapıştırın**.
8. Üstteki **Execute** (veya F5) butonuna basarak scripti çalıştırın.
9. Script başarıyla çalıştıysa, tüm tablolar, ilişkiler, trigger, view ve prosedürler otomatik olarak oluşacaktır.

> **Not:** Scripti çalıştırmadan önce doğru veritabanı üzerinde olduğunuzdan emin olun (sorgu penceresinin sol üstünde veritabanı adı seçili olmalı).

Bu adımları tamamladıktan sonra, App.config bağlantı ayarınızı yapıp migration işlemlerine geçebilirsiniz.


#### b) App.config Connection String Ayarı
- `App.config` dosyasındaki `<connectionStrings>` bölümünü kendi SQL Server ayarınıza göre düzenleyin:

```xml
<connectionStrings>
  <add name="DbOtelYeniEntities" 
       connectionString="metadata=res://*/Entity.Model1.csdl ...;
       provider connection string='data source=YOUR_SERVER_NAME;
       initial catalog=otelRezervasyonu;
       ...
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
> **Not:** Bu adımlar, Entity Framework ile modeldeki değişiklikleri veritabanına uygular. Veri Ekleme konusunda ise Kullanıcı kendi Veritabanına istediği verileri ekleyebilecektir, projede veritabanı paylaşılmamıştır. Aşağıdaki arayüz kısmından örnek veriler görülebilir ve buna benzer veriler ekleyebilir. Veri ekleme işlemi SQL Server Management Studio (SSMS) üzerinden veya program arayüzünden yapılabilir.

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


# 🖼️ Arayüz (UI) Ekran Görüntüleri

Aşağıda uygulamanın temel ekran görüntüleri (arayüz) yer almaktadır.

- **Ana Menü **
  > ![Ana Menü](https://github.com/user-attachments/assets/798b9664-b6bd-4320-8743-5c148e098d24)

- **Müşteri Ekranı**
  > ![Müşteri Ekranı](https://github.com/user-attachments/assets/2366cf58-c13c-44c5-bddf-5e7ade3e24c9)

- **Personel Yönetimi**
  > ![Personel Yönetimi](https://github.com/user-attachments/assets/80e4b12d-b6f1-49c3-bee4-209cc7affb0e)

- **Ürün Yönetimi**
  > ![Ürün Yönetimi](https://github.com/user-attachments/assets/40b1db09-93a4-4bf6-afe4-a721f489570a)

- **Rezervasyon Ekranı**
  > ![Rezervasyon Ekranı](https://github.com/user-attachments/assets/2c67f643-7e36-41d2-992f-8381bcc1b2aa)

- **Tanımlamalar Ekranı**
  > ![Tanımlamalar Ekranı](https://github.com/user-attachments/assets/03d84186-c21d-4e60-88d8-a2c5a0a33eb2)

- >>>>>>>>>Durum Tanımlamaları
  > ![Durum Tanımlamaları](https://github.com/user-attachments/assets/30b56c5b-db0e-4efe-887b-a21089c265c8)
- >>>>>>>>>Birim Tanımlamaları
  > ![Birim Tanımlamaları](https://github.com/user-attachments/assets/af1b751b-085f-45da-8b1a-0ae06cb2b260)
- >>>>>>>>>Departman Tanımlamaları
  > ![Departman Tanımlamaları](https://github.com/user-attachments/assets/18e3c66f-d7ef-4c84-829a-ff41d5ee1225)
- >>>>>>>>>Görev Tanımlamaları
  > ![Görev Tanımlamaları](https://github.com/user-attachments/assets/0c532053-b639-4f42-89db-ab9313d8b274)
- >>>>>>>>>Kasa Tanımlamaları
  > ![Kasa Tanımlamaları](https://github.com/user-attachments/assets/1bf8ebfa-9411-4e4b-8f58-a57f0822147c)
- >>>>>>>>>Kur Tanımlamaları
  > ![Kur Tanımlamaları](https://github.com/user-attachments/assets/ea850b69-7e3f-4f46-abfa-419c68032eb7)
- >>>>>>>>>Oda Tanımlamaları
  > ![Oda Tanımlamaları](https://github.com/user-attachments/assets/df2549ae-b23e-4acf-848f-466804415614)
- >>>>>>>>>Telefon Tanımlamaları
  > ![Telefon Tanımlamaları](https://github.com/user-attachments/assets/fdcc93f1-6cf6-4b5a-84a9-79aa67cf5810)
- >>>>>>>>>Ülke Tanımlamaları
  > ![Ülke Tanımlamaları](https://github.com/user-attachments/assets/50893395-e2a4-4c8a-a139-767114ac1183)
- >>>>>>>>>Ürün Grubu
  > ![Ürün Grubu Tanımlamaları](https://github.com/user-attachments/assets/b1b29e96-af86-4b0c-b7d5-ecec6066de58)

- **Araçlar Ekranı**
  > ![Araçlar Ekranı](https://github.com/user-attachments/assets/dc4fa371-c194-4ffe-b823-c20c3c2ce646)

- **Kasa Ekranı**
  > ![Kasa Ekranı](https://github.com/user-attachments/assets/52864687-6a7c-4846-8e8f-cf5ddf082de3)

- **Grafikler Ekranı**
  > ![Grafikler Ekranı](https://github.com/user-attachments/assets/e96b7688-c6f4-4067-babb-c6592ea5f8bd)

- **Web Site Ekranı**
  > ![Web Site Ekranı](https://github.com/user-attachments/assets/a772deb0-7d5d-4df6-a71d-60a6632965e0)

---

## 🗄️ Veritabanı Modeli ve İlişkiler

#### Temel Tablolar ve İlişkiler
> ![Tablolar Arası İlişkiler](https://github.com/user-attachments/assets/b0c6228e-f20a-4b7b-bf97-4028bb2cccac)
- Projenin Tablolar ve İlişkileri görsel olarak dosyalarda mevcuttur.
- **TblPersonel**: Otel çalışanları
- **TblMisafir**: Otel misafirleri
- **TblOda**: Odalar
- **TblRezervasyon**: Rezervasyonlar (TblMisafir ve TblOda ile ilişkili)
- **TblSaatliCalisan, TblSozlesmeliCalisan**: Personel alt tipleri (ISA ilişkisi)
- **TblProjeler, TblPersonelProjeler**: Çok-çok ilişki örneği
- **TblTasIt, TblTaksi, TblOtobus**: Dışlama (exclusion) ilişkisi
- **TblEsya, TblElektronik, TblMobilya**: Ayrışma (disjoint) ilişkisi
- **reservation_types, online_reservations, phone_reservations**: Örtüşme (overlapping) ilişkisi

### EDMX/Database Diagram

> ![Database Diagram SSMS](https://github.com/user-attachments/assets/121f690f-48a2-4f5a-ab5d-e0c1af8428ae)
> ![EDMX DİAGRAM](https://github.com/user-attachments/assets/201e4f5f-5e65-405c-8389-e24e9e25d81c)
- Projenin EDMX/Database Diagramı hem görsel (png) hem dosya (pdf) hem de açıklamalı olarak dosyalarda mevcuttur.

### ER Diyagramı ve İlişkisel Model
> ![ER Diagram](https://github.com/user-attachments/assets/eb2b2867-ec12-4323-a502-566edbd98636)
- Projenin ER diyagramı hem görsel (drawio, png) hem de açıklamalı olarak dosyalarda mevcuttur.
- **Tablolar arası ilişkiler**:  
  - Bire-bir, bire-çok, çok-çok ilişkiler
  - Zayıf varlıklar, varolma bağımlılığı, ayrışma, örtüşme, dışlama gibi tüm kavramsal yapılar uygulanmıştır.


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

- **GÖREV** ekleme işleminde id sıralaması otomatik yapıyor, id numara yazmana gerek yok (IDENTITY)
- **DEPARTMAN** ekleme işleminde id sıralaması otomatik yapamıyor, manuel id numara yaz
- **KASA**'da giren ve çıkan değerler trigger'larla çalışıyor
- **ODA** ekleme işleminde id sıralaması otomatik yapıyor, id numara yazmana gerek yok (IDENTITY)
- **TELEFON** ekleme işleminde id sıralaması otomatik yapıyor, id numara yazmana gerek yok (IDENTITY)
- **ÜLKE** ekleme işleminde id sıralaması otomatik yapıyor, id numara yazmana gerek yok (IDENTITY)
- **ÜRÜN GRUP** ekleme işleminde id sıralaması otomatik yapıyor, id numara yazmana gerek yok (IDENTITY)
- **İLLER** ekleme işleminde id sıralaması otomatik yapıyor, id numara yazmana gerek yok (IDENTITY) -- sadece SSMS'de ekleniyor
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
  ('Büşra Aksakallı', '12345678901', 'Örnek Mah. 123 Sokak No: 5', '05001234567', 'busra.aksakalli@example.com', '2024-01-01', NULL, 8, 5, 'Staj işlemleri hakkında bilgiler girildi.', 7, NULL, NULL, 'parola123', 3);
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
    3, '2024-12-25', '2024-12-30', 1, 5, '0555 555 55 55', 'Oda 5 rezervasyonu yapıldı.', 20, NULL, NULL, NULL, 1500
  );

  UPDATE [otelRezervasyonu].[dbo].[TblRezervasyon]
  SET [Telefon] = '5555555556'
  WHERE [Misafir] = 3;
  ```

---

## ⚙️ Proje Çalıştırma Notları

- Projeyi **Ctrl+F5** ile başlatın (hata ayıklama olmadan).
- Gerekli NuGet paketlerini yükleyin (ör. EntityFramework, SQLClient vs.).
- Bağlantı ayarlarını kendi bilgisayarınıza göre güncelleyin.
- Migration işlemlerini kendi ortamınızda yapın.
- SQL Server'ın çalışır durumda olduğundan emin olun.


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
---

## 📬 İletişim

Her türlü soru ve destek için:

[![Web Sitem](https://img.shields.io/badge/Web%20Site-1976d2?style=for-the-badge&logo=google-chrome&logoColor=white)](https://osmandemir2533.github.io/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0a66c2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/osmandemir2533/)

---

> Proje, ileri düzey veritabanı modellemesi, SQL, C# ve yazılım mühendisliği prensipleriyle geliştirilmiştir.  
> Tüm kod, diyagram ve açıklamalar repoda ve yukarıdaki dosyalarda mevcuttur.

---

