REPORT zgul_egitim_6.

TYPES: BEGIN OF gty_type1,
         col1 TYPE char10,
         col2 TYPE char10,
         col3 TYPE char10,
         col4 TYPE char10,
       END OF gty_type1.

TYPES: BEGIN OF gty_type2,
      col2 TYPE char10,
      col3 TYPE char10,
  END OF gty_type2.

DATA: gs_st1 TYPE gty_type1,
      gs_st2 TYPE gty_type1.

START-OF-SELECTION.

  gs_st1-col1 = 'aaaa'.
  gs_st1-col2 = 'bbbb'.
  gs_st1-col3 = 'cccc'.
  gs_st1-col4 = 'dddd'.

*  gs_st2 = gs_st1.

*  MOVE gs_st1 TO gs_st2.
MOVE-CORRESPONDING gs_st1 TO gs_st2.

   BREAK-POINT.

*DATA: gt_scarr  TYPE TABLE OF scarr,
*      gt_scarr2 TYPE TABLE OF scarr.

*TYPES: BEGIN OF gty_scarr,
**         mandt    TYPE S_mandt,
*         carrid   TYPE S_carr_id,
*         carrname TYPE S_carrname,
*         currcode TYPE S_currcode,
**         url      TYPE S_carrurl,
*       END OF gty_scarr.
*
*DATA: gt_scarr TYPE TABLE OF gty_scarr.
*
*START-OF-SELECTION.
*
**SELECT carrid carrname FROM scarr
**  INTO TABLE gt_scarr.
**
***çekmeye çalışılan colon name ile atmaya çalıştığım
***return tabledaki colone name aynısı varsa atama yapıyo yoksa dokunmuyo
**  SELECT carrid carrname FROM scarr
**    INTO CORRESPONDING FIELDS OF TABLE gt_scarr2.
*
*  SELECT * FROM scarr
*    INTO TABLE gt_scarr.
*
*  BREAK-POINT.