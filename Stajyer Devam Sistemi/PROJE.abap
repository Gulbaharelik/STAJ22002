REPORT zgul_egitim_23.

DATA: gv_departman  TYPE zgul_departman-dept_id.

DATA: gv_pernr         TYPE int4,
      gv_staj_ad       TYPE char20,
      gv_staj_soyad    TYPE char20,
      gv_begda         TYPE dats,
      gv_endda         TYPE dats,
      gv_staj_dept     TYPE char4,
      gv_mentor_persnr TYPE char8.

DATA: gv_week_start   TYPE dats,
      gv_total_score  TYPE int2,
      gv_job_tracking TYPE int2.

DATA: gv_att_date TYPE dats,
      gv_status   TYPE char1.

DATA: gv_id     TYPE vrm_id,
      gt_values TYPE vrm_values,
      gs_value  TYPE vrm_value.

DATA: ok_code TYPE sy-ucomm.

DATA: go_container TYPE REF TO cl_gui_custom_container,
      go_alv       TYPE REF TO cl_gui_alv_grid.

TYPES: BEGIN OF ty_stajyer_list,
         pernr         TYPE zgul_stajmaster-pernr,
         stajad        TYPE zgul_stajmaster-stajad,
         stajsoyad     TYPE zgul_stajmaster-stajsoyad,
         dept_name     TYPE zgul_departman-dept_name,
         mentor_persnr TYPE zgul_stajmaster-mentor_persnr,
         job_tracking  TYPE zgul_perf_log-job_tracking,
         total_score   TYPE zgul_perf_log-total_score,
       END OF ty_stajyer_list.

DATA: gt_stajyer_list TYPE STANDARD TABLE OF ty_stajyer_list,
      gs_stajyer_list TYPE ty_stajyer_list.

DATA: gt_stajyer_detail TYPE STANDARD TABLE OF ty_stajyer_list,
      gs_stajyer_detail TYPE ty_stajyer_list.

START-OF-SELECTION.

  CALL SCREEN 0103.

MODULE status_0103 OUTPUT.
  SET PF-STATUS '0103'.
* SET TITLEBAR 'xxx'.

  PERFORM fill_departman_dropdown .
ENDMODULE.

MODULE user_command_0103 INPUT.
  CASE ok_code.
    WHEN '&BACK'.
      LEAVE TO SCREEN 0.
    WHEN '&FILTRELE'.
      PERFORM filter_stajyer_list.
    WHEN '&GO_DETAIL'.
      PERFORM show_stajyer_detail.
    WHEN '&SAVE1'.
      PERFORM save_perf_log.
    WHEN '&UPDATE'.
      PERFORM update_all_data.
  ENDCASE.
ENDMODULE.

FORM save_perf_log .
  DATA: ls_perf  TYPE zgul_perf_log,
        ls_devam TYPE zgul_devam_log.

  ls_perf-pernr        = gv_pernr.        " seçilen stajyer ID
  ls_perf-job_tracking = gv_job_tracking. " iş takibi
  ls_perf-total_score  = gv_total_score.  " toplam puan
  ls_perf-week_start = gv_week_start.

  ls_devam-pernr    = gv_pernr.
  ls_devam-att_date = gv_att_date.
  ls_devam-status   = gv_status.

  " Insert
  INSERT zgul_perf_log FROM ls_perf.
  INSERT zgul_devam_log FROM ls_devam.

  IF sy-subrc = 0.
    COMMIT WORK.
    MESSAGE 'Kayıt başarıyla eklendi' TYPE 'I'.
  ELSE.
    MESSAGE 'Kayıt eklenemedi' TYPE 'I'.
  ENDIF.
ENDFORM.

FORM update_all_data .
  UPDATE zgul_perf_log
    SET job_tracking = @gv_job_tracking,
        total_score  = @gv_total_score,
        week_start = @gv_week_start
    WHERE pernr = @gv_pernr.

  UPDATE zgul_devam_log
    SET att_date = @gv_att_date,
        status   = @gv_status
    WHERE pernr = @gv_pernr.

  IF sy-subrc = 0.
    COMMIT WORK.
    MESSAGE 'Kayıtlar güncellendi' TYPE 'I'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Güncelleme başarısız!' TYPE 'I'.
  ENDIF.
ENDFORM.

FORM fill_departman_dropdown .
  CLEAR gt_values.

  DATA: lt_departman TYPE TABLE OF zgul_departman,
        ls_dep       TYPE zgul_departman.

  SELECT dept_id, dept_name
    FROM zgul_departman
    INTO TABLE @lt_departman.

  LOOP AT lt_departman INTO ls_dep.
    gs_value-key  = ls_dep-dept_id.
    gs_value-text = ls_dep-dept_name.
    APPEND gs_value TO gt_values.
  ENDLOOP.

  gv_id = 'GV_DEPARTMAN'.
  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = gv_id
      values = gt_values.

ENDFORM.

FORM filter_stajyer_list .
  CLEAR gt_stajyer_list.
  CLEAR gs_stajyer_list.

  SELECT a~pernr,
         a~stajad,
         a~stajsoyad,
         b~dept_name,
         a~mentor_persnr,
         c~job_tracking,
         c~total_score
    FROM zgul_stajmaster AS a
    INNER JOIN zgul_departman AS b
      ON a~staj_dept = b~dept_id
    LEFT JOIN zgul_perf_log AS c
      ON a~pernr = c~pernr
    INTO TABLE @gt_stajyer_list
    WHERE a~staj_dept = @gv_departman
      AND a~begda >= @gv_begda
      AND a~endda <= @gv_endda.

  " Field catalog tanımı
  DATA: lt_fieldcat TYPE lvc_t_fcat,
        ls_fieldcat TYPE lvc_s_fcat.

  CLEAR lt_fieldcat.

  " Personel No
  ls_fieldcat-fieldname = 'PERNR'.
  ls_fieldcat-seltext = 'Personel No'.
  APPEND ls_fieldcat TO lt_fieldcat.

  " Ad
  ls_fieldcat-fieldname = 'STAJAD'.
  ls_fieldcat-seltext = 'Ad'.
  APPEND ls_fieldcat TO lt_fieldcat.

  " Soyad
  ls_fieldcat-fieldname = 'STAJSOYAD'.
  ls_fieldcat-seltext = 'Soyad'.
  APPEND ls_fieldcat TO lt_fieldcat.

  " Departman
  ls_fieldcat-fieldname = 'DEPT_NAME'.
  ls_fieldcat-seltext = 'Departman'.
  APPEND ls_fieldcat TO lt_fieldcat.

  " Puan
  ls_fieldcat-fieldname = 'TOTAL_SCORE'.
  ls_fieldcat-seltext = 'Toplam Puan'.
  APPEND ls_fieldcat TO lt_fieldcat.

  IF go_alv IS INITIAL.
    CREATE OBJECT go_container
      EXPORTING
        container_name = 'CONTAINER_0103'.

    CREATE OBJECT go_alv
      EXPORTING
        i_parent = go_container.

    CALL METHOD go_alv->set_table_for_first_display
      EXPORTING
        i_structure_name = 'TY_STAJYER_LIST'
      CHANGING
        it_outtab        = gt_stajyer_list
        it_fieldcatalog  = lt_fieldcat.
    CALL METHOD go_alv->get_frontend_fieldcatalog
      IMPORTING
        et_fieldcatalog = lt_fieldcat.
    go_alv->set_selected_rows( it_index_rows = VALUE #( ) ).
  ELSE.
    CALL METHOD go_alv->refresh_table_display.
  ENDIF.
ENDFORM.

FORM show_stajyer_detail .
  DATA: lt_index TYPE lvc_t_row,
        lv_row   TYPE lvc_s_row.

  " Seçili satırların indekslerini al
  CALL METHOD go_alv->get_selected_rows
    IMPORTING
      et_index_rows = lt_index.

  IF lt_index IS INITIAL.
    MESSAGE 'Lütfen önce bir stajyer seçin' TYPE 'I'.
    RETURN.
  ENDIF.

  READ TABLE lt_index INTO lv_row INDEX 1.
  IF sy-subrc = 0.
    READ TABLE gt_stajyer_list INTO gs_stajyer_list INDEX lv_row-index.
    IF sy-subrc = 0.
      PERFORM display_stajyer_popup USING gs_stajyer_list.
    ENDIF.
  ENDIF.
ENDFORM.

FORM display_stajyer_popup USING ps_stajyer TYPE ty_stajyer_list.
  DATA: lv_msg TYPE string.
  DATA: lv_pernr_str         TYPE string,
        lv_total_score_str   TYPE string,
        lv_mentor_persnr_str TYPE string,
        lv_job_tracking_str  TYPE string.
  lv_pernr_str = ps_stajyer-pernr.
  lv_total_score_str = ps_stajyer-total_score .
  lv_mentor_persnr_str = ps_stajyer-mentor_persnr.
  lv_job_tracking_str = ps_stajyer-job_tracking.
  CONCATENATE 'Personel No:' lv_pernr_str
              'Ad:' ps_stajyer-stajad
              'Soyad:' ps_stajyer-stajsoyad
              'Departman:' ps_stajyer-dept_name
              'Mentor:' lv_mentor_persnr_str
              'Puan:' lv_total_score_str
              'Devam Oranı:' lv_job_tracking_str
              INTO lv_msg SEPARATED BY space.
  MESSAGE lv_msg TYPE 'I'.
ENDFORM.