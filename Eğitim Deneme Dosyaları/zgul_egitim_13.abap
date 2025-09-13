REPORT ZGUL_EGITIM_13 MESSAGE-ID ZEGT1.


START-OF-SELECTION.

**SUCCESS
*MESSAGE 'Hello Abap World!' type 'S'.

**Information
*MESSAGE 'Hello Abap World!' type 'I'.

**Warning: Errora göre düzenlenebilir hata olarak geçer.
*MESSAGE 'Hello Abap World!' type 'W'.

**ERROR
*MESSAGE 'Hello Abap World!' type 'E'.

**Abant: Tamamen ana ekrana döner ve kırmızı hata verir.
*MESSAGE 'Hello Abap World!' type 'A'.

**Exit
*MESSAGE 'Hello Abap World!' type 'X'.


*MESSAGE 'Hello Abap World!' type 'S' DISPLAY LIKE 'X'.
*MESSAGE 'Hello Abap World!' type 'I' DISPLAY LIKE 'E'.
*MESSAGE 'Hello Abap World!' type 'W'.
*MESSAGE 'Hello Abap World!' type 'E'.
*MESSAGE 'Hello Abap World!' type 'A'.
*MESSAGE 'Hello Abap World!' type 'X'.

*MESSAGE text-000 TYPE 'I'.
*MESSAGE text-001 TYPE 'S'.

** Bu message class olarak geçen bir
*MESSAGE i000(ZEGT1).
*MESSAGE i000.

*MESSAGE i001 WITH 'Çarşamba'.

MESSAGE i002 WITH 'Çarşamba' 'Perşembe'.

WRITE: 'Message Eğitim Videosu'.