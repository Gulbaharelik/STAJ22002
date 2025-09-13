REPORT zgul_egitim_10.

*PARAMETERS: p_num TYPE int4.
*
*Initialization.
*p_num = 12.
*
*At Selection-Screen.
*p_num = p_num + 1.
*
*Start-Of-Selection.
*WRITE 'Start-Of-Selection'.
*
*End-Of-Selection.
*WRITE 'End-Of-Selection'.

*
*DATA: gv_num1 TYPE int4,
*      gv_num2 TYPE int4,
*      gv_num3 TYPE int4.
*
*INITIALIZATION.
*
*AT SELECTION-SCREEN.
*
*START-OF-SELECTION.
*  PERFORM sayiya_bir_ekle.
*  PERFORM sayiya_bir_ekle.
*  PERFORM sayiya_bir_ekle.
*  PERFORM sayiya_bir_ekle.
*  PERFORM sayiya_bir_ekle.
*  WRITE gv_num1.
*
*  PERFORM iki_sayının_carpimi USING 10
*                                    5.
*  gv_num2 = 15.
*  gv_num3 = 6.
*  PERFORM iki_sayının_farki USING gv_num2
*                                  gv_num3.
*End-Of-Selection.
*
*FORM sayiya_bir_ekle.
*  gv_num1 = gv_num1 + 1.
*ENDFORM.
*
*FORM iki_sayının_carpimi USING p_num1
*                               p_num2.
*  DATA: lv_sonuc TYPE int4.
*  lv_sonuc = p_num1 * p_num2.
*  WRITE: / 'Sonuc = ' ,lv_Sonuc.
*ENDFORM.
*
*FORM iki_sayının_farki  USING  p_num2
*                               p_num3.
*  DATA: lv_sonuc TYPE int4.
*  lv_sonuc = p_num2 - p_num3.
*  WRITE: / 'Farkı = ' ,lv_Sonuc.
*ENDFORM.
*


DATA: gv_num1 TYPE int4.

START-OF-SELECTION.

PERFORM form1.
PERFORM form2.
*&---------------------------------------------------------------------*
*& Form form1
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM form1 .
    DATA: lv_num2 TYPE int4.
    gv_num1 = gv_num1 + 1.
    lv_num2 = lv_num2 + 1.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form form2
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM form2 .
    gv_num1 = gv_num1 + 1.
    lv_num2 = lv_num2 + 1.
ENDFORM.