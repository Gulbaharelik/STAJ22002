REPORT zgul_egitim_8.

** sonuç olarak 3 değer ortaya çıkar
*DATA: gt_table1     TYPE TABLE OF zgul_egt_01,
*      gt_table2     TYPE TABLE OF zgul_egt_02,
*      gt_table2_tmp TYPE TABLE OF zgul_egt_02.
*
*START-OF-SELECTION.
*
*  SELECT * FROM zgul_egt_01
*    INTO TABLE gt_table1.
*
*  SELECT * FROM zgul_egt_02
*    INTO TABLE gt_table2_tmp.
*
*  SELECT * FROM zgul_egt_02
*    INTO TABLE gt_table2
*    FOR ALL ENTRIES IN gt_table1
*    WHERE ekip_id EQ gt_table1-ekip_id.
*
*  BREAK-POINT.


**Sonuç olarak 1 ve 2 kayıtları gelir ikisinde de ortak olan kayıtlar
*TYPES: BEGIN OF gty_ekipman,
*         ekip_id   TYPE zgul_ekipid_de,
*         ekip_ad   TYPE zgul_ekipad_de,
*         ekip_stok TYPE zgul_stok_de,
*       END OF gty_ekipman.
*
*DATA: gt_ekipman TYPE TABLE OF gty_ekipman.
*
*START-OF-SELECTION.
*
*  SELECT * FROM zgul_egt_01 AS z1
*    INNER JOIN zgul_egt_02 AS z2 ON z2~ekip_id EQ z1~ekip_id
*    INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.
*
*    BREAK-POINT.

*-----------------------------------------------------------------------

DATA: gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr.

START-OF-SELECTION.

  FIELD-SYMBOLS: <gfs_scarr> TYPE scarr.

  SELECT * FROM scarr
    INTO TABLE gt_scarr.

**Bu işlem anlık bir işlemdir pek de birşey ifade etmez gt_scarr için
*LOOP AT gt_Scarr INTO gs_scarr.
*  IF gs_scarr-carrid eq 'LH'.
*    gs_scarr-carrname = 'Bahar Elik'.
*   MODIFY gt_Scarr FROM gs_scarr.
*  ENDIF.
*ENDLOOP.

  LOOP AT gt_scarr ASSIGNING <gfs_scarr>.
    IF <gfs_scarr>-carrid EQ 'LH'.
      <gfs_scarr>-carrname = 'Bahar Elik'.
    ENDIF.
  ENDLOOP.

  BREAK-POINT.