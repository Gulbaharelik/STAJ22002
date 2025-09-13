REPORT ZGUL_EGITIM_20.

START-OF-SELECTION.
*PBO: Screen açılmadan önce yapmak istenilen kodlamalar yazılır.
*PAI: Buton yönetimi gibi şeyler için kullanılır.
*GUI STATUS: Ekranda oluşturulmak istenen menubar,toolbarların yönetiminde kullanılır.
*GUI TITLE: Screne rilmek istenen title yapısı için kullanılır.

CALL SCREEN 0100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS 'STATUS_0100'.
 SET TITLEBAR 'TITLE_0100'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
*butonun function kodunu tutar
  IF sy-ucomm eq '&BACK'.
    LEAVE to SCREEN 0.
  ENDIF.
ENDMODULE.