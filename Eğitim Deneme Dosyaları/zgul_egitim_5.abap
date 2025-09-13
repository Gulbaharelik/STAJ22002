REPORT ZGUL_EGITIM_5.

DATA: gt_scarr TYPE TABLE OF scarr,
      gs_Scarr TYPE scarr.

START-OF-SELECTION.

SELECT * FROM scarr
  INTO TABLE gt_scarr.

* READ TABLE gt_scarr INTO gs_scarr INDEX 4.
* WRITE: gs_scarr.

* Böyle olunca daha basit ve daha kullanışlı bir yapı oluyo bu yüzden daha kullanışlıdır.

* READ TABLE gt_scarr INTO gs_scarr with key carrid = 'AZ'.
* READ TABLE gt_scarr INTO gs_scarr with key carrname = 'Alitalia'.
 READ TABLE gt_scarr INTO gs_scarr with key currcode = 'EUR'
                                            carrname = 'Alitalia'.
 WRITE: gs_scarr.