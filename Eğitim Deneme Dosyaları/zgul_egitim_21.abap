REPORT ZGUL_EGITIM_21.

START-OF-SELECTION.
CALL SCREEN 0100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS '0100'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  DATA: lv_text TYPE char200.

*iki ya da ikiden fazla string ifadeyi birleştirip tutmaya yarayan yapıdır.
  CONCATENATE sy-ucomm
              'butonuna basılmıştır.'
               into lv_text
               SEPARATED BY space. "aralarında boşluk olması istendiğinde kullanılır.
  MESSAGE lv_text TYPE 'I'.
  CASE sy-ucomm.
    WHEN '&BCK'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.