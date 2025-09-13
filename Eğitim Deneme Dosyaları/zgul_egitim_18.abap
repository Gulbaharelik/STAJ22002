REPORT zgul_egitim_18.

*PARAMETERS: p_id TYPE zgul_ekipid_de MATCHCODE OBJECT zgul_egt_001_sh,
*            p_ad TYPE zgul_ekipad_de MATCHCODE OBJECT zgul_egt_001_sh.

*PARAMETERS: p_id TYPE zgul_ekipid_de,
*            p_ad TYPE zgul_ekipad_de.

TYPES: BEGIN OF gty_list,
         ekip_id TYPE zgul_ekipid_de,
         ekip_ad TYPE zgul_ekipad_de,
       END OF gty_list.

DATA: gt_list       TYPE TABLE OF gty_list,
      gt_return_Tab TYPE TABLE OF ddshretval,
      gt_mapping    TYPE TABLE OF dselc,
      gs_mapping    TYPE dselc.

PARAMETERS: p_id TYPE int4,
            p_ad TYPE char30.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_id.

  SELECT * FROM zgul_egt_01
    INTO CORRESPONDING FIELDS OF TABLE gt_list.

  gs_mapping-fldname = 'F0001'.
  gs_mapping-dyfldname = 'p_id'.
  APPEND gs_mapping TO gt_mapping.

  gs_mapping-fldname = 'F0002'.
  gs_mapping-dyfldname = 'p_ad'.
  APPEND gs_mapping TO gt_mapping.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'EKIP_ID'
      dynpprog        = sy-repid
      dynpnr          = sy-dynnr
      dynprofield     = 'P_ID'
      value_org       = 'S'
    TABLES
      value_tab       = gt_list
      return_tab      = gt_return_tab
      dynpfld_mapping = gt_mapping
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


START-OF-SELECTION.