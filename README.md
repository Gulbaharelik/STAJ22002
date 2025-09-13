# 👨‍💻 Staj22002 – Stajyer Devam Takip Sistemi  

**Stajyer Devam Takip Sistemi**, SAP ABAP üzerinde geliştirilmiş bir takip uygulamasıdır.  
Amaç, şirket bünyesinde staj yapan öğrencilerin devam, performans ve departman bilgilerini sistematik olarak takip etmektir.  

---

## 📌 Proje Amaçları
- Stajyer temel bilgilerinin kayıt altına alınması  
- Devam durumlarının (gelinen/gidilmeyen günler) tutulması  
- Performans puanlarının kaydedilmesi  
- Departman eşleştirmelerinin yapılması  
- ALV raporları ile sorgulama ve çıktı desteği  
- Kullanıcı etkileşimli ekran (dynpro) ile kolay veri girişi  

---

## 🗂️ Veri Modeli  

### 📑 Tablolar
- `ZGUL_STAJMASTER` → Stajyer temel bilgileri (ID, ad, soyad, tarih, mentor)  
- `ZGUL_DEVAM_LOG` → Devam kayıtları (tarih, gelinen günler)  
- `ZGUL_PERF_LOG` → Performans değerlendirmeleri (puan, iş takibi, tarih)  
- `ZGUL_DEPARTMAN` → Departman bilgileri (departman adı, ID)  

### 🔗 İlişkiler
- **1-N** → Bir stajyerin birden fazla devam kaydı olabilir  
- **1-N** → Bir stajyerin birden fazla performans kaydı olabilir  
- **N-1** → Her stajyer bir departmana bağlıdır  

---

## 💻 Program ve Ekranlar
- **Report Programı:** `PROJE.abap`  
- **Dynpro:** 0103 → Stajyer listesi, departman filtreleme, detay popup  
- **ALV Grid:** Stajyerlerin devam ve performans bilgilerinin raporlanması


### 📋 Kullanıcı İşlemleri
- `&GO_DETAIL` → Seçilen stajyerin detaylarını popup’ta göster  
- `&SAVE1` → Yeni performans ve devam kaydı ekle  
- `&UPDATE` → Mevcut kayıtları güncelle  
- `&FILTRELE` → Departmana/tarihe göre filtreleme  
- `&BACK` → Ana ekrana dönüş  

---

## ⚙️ Uygulanan ABAP Yapıları
- `MODULE status_0103 OUTPUT` → PF-STATUS ve titlebar ayarları, dropdown doldurma  
- `MODULE user_command_0103 INPUT` → Kullanıcı butonlarını yakalama  
- `FORM save_perf_log` → Yeni performans kaydı ekleme (COMMIT WORK)  
- `FORM update_all_data` → Kayıt güncelleme (ROLLBACK WORK hatalarda)  
- `FORM show_stajyer_detail` → Stajyer detaylarını popup’ta gösterme  

---

## 📊 Raporlama (ALV)
- Stajyer listeleri filtrelenebilir şekilde ALV Grid üzerinde gösterildi  
- Tarih, departman ve performans bazlı sorgulama yapılabilir  
- `go_alv->refresh_table_display` ile tablo anlık güncellenir  

---

## 🔐 Güvenlik & Veri Bütünlüğü
- Tablolar arası ilişkiler test edildi  
- Veri bütünlüğü sağlandı (ör. bir stajyerin performans kaydı doğru departman ile eşleştirilir)  
- Hatalı veri girişlerinde rollback mekanizması devreye girer  

---

## 🚀 Kurulum & Kullanım
1️⃣ **SAP GUI** üzerinden `PROJE.abap` raporunu indirip SAP GUI kodu se38 ile PROJE dosyasının kodlarını içine aktarın.

2️⃣ Stajyer Devam Sistemi klasörü altındaki ZTEST_INSERT_STAJYER.abap içindeki verileri de aynı adda dosya açıp çalıştırın. Verileriniz hazır olucaktır.

3️⃣ **Dynpro 0103** ekranında departman seçerek stajyerleri listeleyin. 

4️⃣ Yeni kayıt ekleyin veya mevcut kayıtları güncelleyin.  

---

## 📷 Ekran Görüntüleri
> `/Uygulama Görüntüleri/` klasöründe bulunur.  

---

## 👩‍💻 Katkıda Bulunma
Proje eğitim amaçlıdır. Pull request ve issue açılabilir.  
