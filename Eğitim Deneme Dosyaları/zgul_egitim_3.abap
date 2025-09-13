REPORT ZGUL_EGITIM_3.

*Variable Tanımlaması yaptık
DATA: gv_persid TYPE ZGUL_PERSI_DE,
      gv_persad TYPE ZGUL_PERSAD_DE,
      gv_perssoyad TYPE ZGUL_PERSSOYAD_DE,
      gv_perscins TYPE ZGUL_PERSCINS_DE.

*Structure Tanımlaması
DATA gs_pers_t TYPE ZGUL_PERS_T1.

*Tablo Tanımlaması
DATA gt_pers_t TYPE TABLE OF ZGUL_PERS_T1.


*                 SELECT: Data çekmeye yarar
*Tablonun tümünü çekmekte kullanılır.
SELECT * FROM ZGUL_PERS_T1
  INTO TABLE gt_pers_t.

*Tablonun belirli bir satır veya satırını almak istersek
SELECT * FROM ZGUL_PERS_T1
  INTO TABLE gt_pers_t
  WHERE PERS_ID EQ 1.

*Structure çekerken kullanılır
SELECT SINGLE * FROM ZGUL_PERS_T1
  INTO gs_pers_t.

*Sadece belli bir kolan çekilmek istenirse
SELECT SINGLE PERS_ID FROM ZGUL_PERS_T1
  INTO gv_persid.

*                 UPDATE: Data güncellemek için kullanılır.
UPDATE ZGUL_PERS_T1 SET PERS_AD = 'GULBAHAR' WHERE PERS_ID EQ 1.
WRITE:'Update komutu çalıştırıldı!'.

*                 INSERT: Veri oluşturmak için kullanılır.
gs_pers_t-pers_id = 3.
gs_pers_t-pers_ad = 'EREN'.
gs_pers_t-pers_soyad = 'YILMAZ'.
gs_pers_t-pers_cins = 'E'.
INSERT ZGUL_PERS_T1 FROM gs_pers_t.
WRITE: / 'INSERT komutu çalıştırıldı!'.

*                 DELETE: İstenilen satır veya satırları silmekte kullanılır.
DELETE FROM ZGUL_PERS_T1 WHERE PERS_ID EQ 2.
WRITE: / 'DELETE komutu çalıştırıldı!'.


*                 MODIFY: Update ve insert komutlarının birleşimi şeklinde çalışır.
gs_pers_t-pers_id = 4.
gs_pers_t-pers_ad = 'MERVE'.
gs_pers_t-pers_soyad = 'YALÇIN'.
gs_pers_t-pers_cins = 'K'.
MODIFY ZGUL_PERS_T1 FROM gs_pers_t.
WRITE: / 'MODIFY komutu çalıştırıldı!'.