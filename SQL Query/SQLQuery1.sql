--saklı prosedür
USE [otelRezervasyonu]
GO
/****** Object:  StoredProcedure [dbo].[OdaDurum]    Script Date: 2.01.2025 13:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[OdaDurum]
As
Select DurumAd, Count(*) as 'Sayı' 
From TblOda
Inner Join TblDurum
On TblDurum.DurumID = TblOda.Durum
Group By DurumAd

execute	OdaDurum