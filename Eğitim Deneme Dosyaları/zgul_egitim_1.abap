REPORT zgul_egitim_1.

DATA: gv_degs1 TYPE p DECIMALS 2,
      gv_degs1_1 TYPE i,
      gv_degs2 TYPE int4,
      gv_degs3 TYPE n,
      gv_degs4 TYPE c,
      gv_degs5 TYPE string,
      gv_sonuc TYPE i,
      gv_metin TYPE string.


gv_degs1 = '12.73'.
gv_degs1_1 = 0.

gv_degs2 = 120.
gv_degs2 = 480.

*gv_degs3 = 654.

*gv_degs4 = 'A'.
*gv_degs4 = 'c'.
*
*gv_degs5 = 'Herhangi bir cümle yazılabilir.'.
*
*WRITE: / 'gv_degs1:', gv_degs1,
*       / 'gv_degs2:', gv_degs2,
*       / 'gv_degs3:', gv_degs3,
*       / 'gv_degs4:', gv_degs4,
*       / 'gv_degs5:', gv_degs5.



*DATA: gv_degs6 TYPE i,
*      gv_degs7 TYPE n LENGTH 10.
*
*gv_degs6 = 10.
*gv_degs7 = 10.
*
*write / gv_degs6.
*write / gv_degs7.


*gv_metin = 'Toplamı = '.
*gv_sonuc = gv_degs1 + gv_degs2.
*WRITE: gv_metin ,gv_sonuc.
*WRITE /.
*
*gv_sonuc = gv_degs2 - gv_degs1.
*WRITE:'Farkı = ',gv_sonuc.
*WRITE /.
*
*gv_sonuc = gv_degs2 * gv_degs1.
*WRITE:'Çarpımı = ',gv_sonuc.
*WRITE /.
*
*gv_sonuc = gv_degs2 / gv_degs1.
*WRITE:'Bölümü = ',gv_sonuc.
*WRITE /.




*IF gv_degs1 < gv_degs2.
*  WRITE: 'Birinci sayı küçüktür!', /.
*ENDIF.
*
*IF gv_degs1 > gv_degs2.
*  WRITE: 'Birinci sayı büyüktür!', /.
*ENDIF.
*
*IF gv_degs1 = gv_degs2.
*  WRITE: 'İki sayı eşittir!', /.
*ENDIF.



*IF gv_degs1 > gv_degs2.
*   WRITE: 'Birinci sayı büyüktür!', /.
*ELSEIF gv_degs1 < gv_degs2.
*   WRITE: 'İkinci sayı büyüktür', /.
*ELSE.
*   WRITE: 'İki sayı eşittir!', /.
*ENDIF.




*IF gv_degs1 = 1.
*   WRITE 'Degisken değerim 1.'.
*ELSEIF gv_degs1 = 2.
*   WRITE 'Degisken değerim 2.'.
*ELSEIF gv_degs1 = 3.
*   WRITE 'Degisken değerim 3.'.
*ELSEIF gv_degs1 = 4.
*   WRITE 'Degisken değerim 4.'.
*ELSEIF gv_degs1 = 5.
*   WRITE 'Degisken değerim 5.'.
*ELSEIF gv_degs1 = 6.
*   WRITE 'Degisken değerim 6.'.
*ELSEIF gv_degs1 = 7.
*   WRITE 'Degisken değerim 7.'.
*ELSE.
*   WRITE 'Hiçbir değere eşit değil!'.
*ENDIF.



*CASE gv_degs1.
*  WHEN 1.
*    WRITE 'Degisken değerim 1.'.
*  WHEN 2.
*    WRITE 'Degisken değerim 2.'.
*  WHEN 3.
*    WRITE 'Degisken değerim 3.'.
*  WHEN 4.
*    WRITE 'Degisken değerim 4.'.
*  WHEN 5.
*    WRITE 'Degisken değerim 5.'.
*  WHEN 6.
*    WRITE 'Degisken değerim 6.'.
*  WHEN 7.
*    WRITE 'Degisken değerim 7.'.
*  WHEN OTHERS.
*    WRITE 'Hiçbir değere eşit değil!'.
*ENDCASE.




** 10 defa bu ifadenin dönmesini sağlar.
*DO 10 TIMES.
*   gv_degs1_1 = gv_degs1_1 + 1.
*   WRITE: / gv_degs1_1 ,'DO döngüsünü öğreniyoruz!'.
*ENDDO.



** Koşulun sağlanması durumunda olucak olan işlemleri belirler.
*WHILE gv_degs1_1 LT 10. 
*  gv_degs1_1 = gv_degs1_1 + 1.
*  WRITE: / gv_degs1_1, 'WHİLE döngüsünü öğreniyoruz! '.
*ENDWHILE.



" <   LT (LEFT)
" >   RT (RİGHT)
" <=  LE (LEFT)
" >=  GE (RİGHT)
" =   EQ
