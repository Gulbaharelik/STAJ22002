REPORT ZGUL_EGITIM_11.

DATA: go_egitim_class TYPE REF TO Z_CL_EGITIM_CLASS.
DATA: gv_num1 TYPE int4,
      gv_num2 TYPE int4,
      gv_result TYPE int4.

START-OF-SELECTION.

CREATE OBJECT go_egitim_class.

gv_num1 = 12.
gv_num2 = 15.

go_egitim_class->sum_numbers(
  EXPORTING
    iv_num1   = gv_num1           " 4 bayt işaretli tamsayı
    iv_num2   = gv_num2          " 4 bayt işaretli tamsayı
  IMPORTING
    ev_result = gv_result           " 4 bayt işaretli tamsayı
).

WRITE: gv_result.

**static method olarak tanımlama yapmıştık. Ama iç boş olduğundan böyle görünüyo.
*Z_CL_EGITIM_CLASS=>sum_numbers_v2( ).