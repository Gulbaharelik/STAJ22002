REPORT ZTEST_CRUD_STAJYER.

DATA: lt_stajyer TYPE STANDARD TABLE OF zgul_stajmaster,
      ls_stajyer TYPE zgul_stajmaster.

*--------------------------------------------------------------------
* INSERT işlemi (Yeni kayıt ekleme)
*--------------------------------------------------------------------
CLEAR ls_stajyer.
ls_stajyer-pernr         = '0004'.
ls_stajyer-stajad        = 'Mehmet'.
ls_stajyer-stajsoyad     = 'Demir'.
ls_stajyer-staj_dept     = 'IT'.
ls_stajyer-begda         = '20250820'.
ls_stajyer-endda         = '20250920'.
ls_stajyer-mentor_persnr = '00000105'.

INSERT zgul_stajmaster FROM ls_stajyer.
IF sy-subrc = 0.
  WRITE: / '✅ INSERT başarılı:', ls_stajyer-pernr.
ELSE.
  WRITE: / '❌ INSERT hata:', sy-subrc.
ENDIF.

*--------------------------------------------------------------------
* SELECT işlemi (Tek kayıt okuma)
*--------------------------------------------------------------------
CLEAR ls_stajyer.
SELECT SINGLE * FROM zgul_stajmaster INTO ls_stajyer
 WHERE pernr = '0002'.

IF sy-subrc = 0.
  WRITE: / '📌 SELECT sonucu:', ls_stajyer-pernr, ls_stajyer-stajad, ls_stajyer-stajsoyad.
ELSE.
  WRITE: / '❌ Kayıt bulunamadı.'.
ENDIF.

*--------------------------------------------------------------------
* DELETE işlemi (Kayıt silme)
*--------------------------------------------------------------------
DELETE FROM zgul_perf_log WHERE pernr = '0004' and  total_score ='9'.

IF sy-subrc = 0.
  WRITE: / '✅ DELETE başarılı: 0001 kaydı silindi.'.
ELSE.
  WRITE: / '❌ DELETE başarısız.'.
ENDIF.

*--------------------------------------------------------------------
* UPDATE işlemi (Var olan kaydı güncelleme)
*--------------------------------------------------------------------
UPDATE zgul_stajmaster
   SET staj_dept = 'DEV'
 WHERE pernr = '0004'.

IF sy-subrc = 0.
  WRITE: / '✅ UPDATE başarılı: 0003 kaydı güncellendi.'.
ELSE.
  WRITE: / '❌ UPDATE başarısız.'.
ENDIF.