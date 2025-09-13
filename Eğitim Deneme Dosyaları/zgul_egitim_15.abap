REPORT ZGUL_EGITIM_15.

DATA: gv_ind TYPE i,
      gv_total TYPE i.


START-OF-SELECTION.
  gv_ind = 0.
  DO 1000 TIMES.
    gv_ind = gv_ind + 1.
    gv_total = gv_total + gv_ind.
  ENDDO.
  WRITE: / gv_total.


*DATA: gv_num1 type i,
*      gv_num2 type i,
*      gv_sonuc TYPE i.
*
*START-OF-SELECTION.
*
*PERFORM form1.
*PERFORM form2.
*PERFORM form3.
*
*FORM form1 .
*  gv_num1 = 100.
*  gv_num2 =  5.
*ENDFORM.
*
*FORM form2 .
* CALL FUNCTION 'ZGUL_EGITIM_FONKSIYONLARI'
* EXPORTING
*   IV_NUM1               = gv_num1
*   IV_NUM2               = gv_num2
* IMPORTING
*   EV_SONUC              = gv_sonuc
** CHANGING
**   CV_MES                =
** EXCEPTIONS
**   DIVIDED_BY_ZERO       = 1
**   OTHERS                = 2
*          .
* IF sy-subrc <> 0.
**  Implement suitable error handling here
*  ENDIF.
*  WRITE: 'Sonuc = ', gv_sonuc.
*ENDFORM.
*
*FORM form3 .
*  MESSAGE s000(ZEGT1).
*  MESSAGE s001(ZEGT1).
*  MESSAGE s002(ZEGT1).
*ENDFORM.