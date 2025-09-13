REPORT zgul_egitim_4.

*Veri çekilecek tablo için işlem yaptık.
DATA: gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr,
      gv_currcode TYPE s_currcode.

START-OF-SELECTION.

*  SELECT * FROM scarr
*    INTO TABLE gt_scarr
*      WHERE carrid EQ 'AC'.
**
*  READ TABLE gt_scarr INTO gs_scarr INDEX 1.
*
*  WRITE : gs_scarr-currcode.

*Belli sayıda satır sayısını kısıtlayarak veri çekmek denilebilir.
*Ayrıca belirli bir kısım içinden rastgele bir veri alınmak isteniyor ise de etkilidir.
*  SELECT * UP TO 5 ROWS FROM scarr
*    INTO TABLE gt_scarr.
*
*  BREAK-POINT.



**Select fromla arasındaki farkı rows olayı
*   SELECT * UP TO 1 ROWS FROM scarr
*     INTO TABLE gt_scarr
*     WHERE carrid EQ 'AC'.
*
*    READ TABLE gt_scarr INTO gs_scarr INDEX 1.
*
*    WRITE : gs_scarr-currcode.


**Bütün kolanları çeker
*SELECT SINGLE * FROM scarr
*  INTO gs_scarr
*  WHERE carrid EQ 'AC'.
*
*WRITE : gs_scarr-currcode.


*Burada verilen istenilen kolona göre bir işlem yapmak için daha idealdir.
 SELECT SINGLE currcode FROM scarr
   INTO gv_currcode
   WHERE carrid EQ 'AC'.

WRITE : gv_currcode.