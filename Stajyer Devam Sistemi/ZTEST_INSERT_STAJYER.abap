REPORT ztest_insert_stajyer.

DATA: lt_stajyer TYPE STANDARD TABLE OF zgul_stajmaster,
      ls_stajyer TYPE zgul_stajmaster.
*
* 1. Kayıt
CLEAR ls_stajyer.
ls_stajyer-pernr          = '0001'.
ls_stajyer-stajad         = 'Gülbahar'.
ls_stajyer-stajsoyad      = 'Elik'.
ls_stajyer-staj_dept      = 'DEV'.
ls_stajyer-begda          = '20250801'.
ls_stajyer-endda          = '20250901'.
ls_stajyer-mentor_persnr  = '00000099'.
APPEND ls_stajyer TO lt_stajyer.

* 2. Kayıt
CLEAR ls_stajyer.
ls_stajyer-pernr          = '0002'.
ls_stajyer-stajad         = 'Ahmet'.
ls_stajyer-stajsoyad      = 'Yılmaz'.
ls_stajyer-staj_dept      = 'HR'.
ls_stajyer-begda          = '20250810'.
ls_stajyer-endda          = '20250910'.
ls_stajyer-mentor_persnr  = '00000100'.
APPEND ls_stajyer TO lt_stajyer.

*-------------------------------------------------------------
* 3. Kayıt
CLEAR ls_stajyer.
ls_stajyer-pernr          = '0003'.
ls_stajyer-stajad         = 'Zeynep'.
ls_stajyer-stajsoyad      = 'Kaya'.
ls_stajyer-staj_dept      = 'FIN'.
ls_stajyer-begda          = '20250815'.
ls_stajyer-endda          = '20250915'.
ls_stajyer-mentor_persnr  = '00000101'.
APPEND ls_stajyer TO lt_stajyer.


*-------------------------------------------------------------
* 5. Kayıt
CLEAR ls_stajyer.
ls_stajyer-pernr          = '0005'.
ls_stajyer-stajad         = 'Evrim'.
ls_stajyer-stajsoyad      = 'Kaya'.
ls_stajyer-staj_dept      = 'HR'.
ls_stajyer-begda          = '20250815'.
ls_stajyer-endda          = '20250915'.
ls_stajyer-mentor_persnr  = '00000102'.
APPEND ls_stajyer TO lt_stajyer.

*-------------------------------------------------------------
* 6. Kayıt
CLEAR ls_stajyer.
ls_stajyer-pernr          = '0006'.
ls_stajyer-stajad         = 'Fevzi'.
ls_stajyer-stajsoyad      = 'Sert'.
ls_stajyer-staj_dept      = 'DEV'.
ls_stajyer-begda          = '20250815'.
ls_stajyer-endda          = '20250915'.
ls_stajyer-mentor_persnr  = '00000102'.
APPEND ls_stajyer TO lt_stajyer.

* VERİLERİ TABLOYA EKLEME
LOOP AT lt_stajyer INTO ls_stajyer.
  INSERT zgul_stajmaster FROM ls_stajyer.
  IF sy-subrc = 0.
    WRITE: / '✅ Kayıt eklendi:', ls_stajyer-pernr, ls_stajyer-stajad, ls_stajyer-stajsoyad.
  ELSE.
    WRITE: / '❌ Hata oluştu. Subrc:', sy-subrc, 'PERNR:', ls_stajyer-pernr.
  ENDIF.
ENDLOOP.
