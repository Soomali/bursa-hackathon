# AKÇE

Akçe, "Akıllı Çadır Kent Uyguluması"'nın kısaltılmış halidir. Akçe ile deprem sonrasında afet bölgesine gönderilen ve çadır kentleri kendilerine atanan yetkili personelin çadır kenti yönetmesini kolaylaştırmak için yapılmıştır   

# Temel İşlevler

## Yönetici

### Depremzede İşlemleri

 Yöneticiler depremzedeleri kentlerine kaydedebilir, sisteme kayıtlı depremzedeleri arayabilir ve kendi çadır kentlerindeki depremzedeleri silebilirler.

 Yöneticiler ayrıca depremzedelerin QR kodlarını telefonlarına okutarak bu kişileri çadır kente girdi / çadır kentten çıktı olarak işaretleyebilirler.

### Envanter Yönetimi 
 
 Yöneticiler çadır kentlerinde bulunan yardım malzemesini (su,yiyecek, kıyafet gibi) uygulamada görür ve güncelleyebilirler. Bu yardım malzemelerine göre depremzedeler ihtiyaç talebinde bulunabilirler

### Talep Yönetimi

 Depremzedelerin taleplerini onaylamak veya reddetmek yöneticinin yetkisi altındadır. Not edilmelidir ki talep onaylama sonrasında envanter güncellemesi *yapılmamaktadır.*

### İstek / Şikayet Yönetimi 
 
 Depremzedelerden gelen istek ve şikayetleri değerlendirmeye alındı şekline işaretleme yetkisine sahiptir. Değerlendirmeye alındı bilgisi depremzedeye gösterilmekle beraber değerlendirmeye alınmış olan istek ve şikayetlerin yöneticiye gözükmesini engeller.

### Depremzede girdi / çıktı işlemleri 
 
 Uygulamaya kaydedilen depremzedelerden telefonu olan ve uygulamayı kullanabilecek yeterlilikte olan depremzedelerin, giriş çıkış işlemlerini gerçekleştirmek ve ileride kendi adlarına oluşturulan bir qr kod ile farklı işlemleri daha hızlı bir şekilde gerçekleştirmelerini sağlamak için bir qr kod sistemi kurulmuştur.

 Bu özellik şu an için sadece qr kodu okunan depremzedenin bilgilerini yetkili kişiye gösterip depremzedenin o an çadır kente girmesini veya çadır kentten çıkmasını sisteme yüklemeye yarayan bir sistem olarak bulunmaktadır.

### Duyuru Görüntüleme 

 Yöneticiler şu anki versiyondaki uygulamalarından duyuru oluşturamıyor olsa da çadır kentleri ile alakalı olan duyuruları görüntülebiliyorlar.

## Depremzede 

  Yöneticiler tarafından telefon numaraları ile birlikte sisteme kaydedilen depremzedeler sonrasında bu telefon numaralarını kullanarak uygulamaya giriş yapabilirler.

### Talep Oluşturma 
  
  Depremzedeler, uygulama üzerinden çadır kentlerinden çeşitli yardım malzemeleri (su,süt kıyafet gibi) talep edebilirler. Depremzedeler, farklı kategorilerden istedikleri malzemeyi taleplerine ekleyebilirler. 

### İstek ve Şikayet Oluşturma

  Depremzedeler uygulama üzerinde nbir konu hakkında yetkililere görüşlerini bildirebilirler

### Talep ve İsteklerin Durumunu Görüntüleme
  
  Talepler için üç durum (kabul edildi,reddedildi,değerlendirmede) ve istek/şikayet için iki farklı durum (değerlendirmede, değerlendirildi) bulunmaktadır. Depremzedeler kendi oluşturdukları talep ve istek/şikayetlerinin durumunu görüntüleyebilir.

### Kendine Ait Bilgileri Görüntüleme
  
   Depremzedeler kendine ait bilgileri uygulama üzerinden görüntüleyebilirler.

### Duyuru Görüntüleme 

 Depremzedeler kendi çadır kentlerindeki duyuruları uygulama üzerinden görüntüleyebilirler.


# Yol Haritası

## Tasarım
 
 Uygulamamızın tasarımını figma üzerinden yaptık. Daha çok kırmızı ve beyaz tonlarını kullandık. 

## Planlama
 
 Uygulamamızın tasarımının belirli bir kısmı bittikten sonra veri yapıları ve kullanabileceğimiz teknolojiler hakkında tartışmaya başladık. Uygulamamızın ana amacını ve yardımcı amaçlarını belirledik. Bu amaçlara uygun olacak şekilde ve uygulamanın hepsini kapsamasa da temelini oluşturan bir UML diyagramı çizdik.  

### UML Diyagramı

![uml diyagramı](https://github.com/Soomali/bursa-hackathon/assets/63963472/6de822ab-b83b-49ce-a90c-c96c8cff7e9c)

## Uygulama
  Uygulamamızı Flutter kullanarak yazdık. Backend olarak ise Firebase'i veritabanı olarak ve kimliklendirme sağlayacısı olarak kullandık. 
### Uygulamamızın Fotoğrafları
![4564WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/b94b9a67-0f82-406b-bb4c-97d63d79c64f)
![5465WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/1db8e6b7-154d-496c-b9dc-b390ae6bee13)
![45465WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/2f1a2c05-e7f2-4720-aa5b-bdd1a6614810)
![54654WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/26e0bbee-e3ab-40bd-bb9f-f2f8760882a8)
![65454WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/600e60c6-beef-4182-b713-4a3e89cfb419)
![78987WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/a2277759-6daa-438a-b6e7-a04de7fe6e4e)
![87564WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/12d5f9aa-7bb1-4a77-b889-c1d54fae9561)
![87845WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/c554a57a-5c20-4e66-913f-868210bd959e)
![465457WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/10bbdc34-d2ae-4102-86c5-2d4b06a491c3)
![545678WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/693cda41-2e86-41b7-bacb-731c1b53cbc0)
![5456464WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/8c42eaf8-99c4-446e-ae5a-baf21d7f978c)
![87987654WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/caebca06-1902-40ae-8f29-a970c93defe0)
![Wh54654atsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/47e7cbe5-7bb9-4601-a762-8949d5d371ea)
![WhatsApp 977987Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/922cd279-9918-4918-a897-cbea3d329a3e)
![WhatsApp 546782023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/99a4938b-91f2-4a5c-821b-7c60f776784b)
![WhatsApp G45654örsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/c8b40bca-7471-48de-9e05-1775ec6f5b43)
![WhatsApp Görsel 2023-06-18 saat 10 44 18(1)](https://github.com/Soomali/bursa-hackathon/assets/63963472/37d91350-8481-467a-aa99-9661eda17e26)
![WhatsApp Görsel 2023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/fe184585-817b-481e-b242-a3e49f613e9e)
![WhatsApp Görsel 2023-06-18 saat 10 44 1845](https://github.com/Soomali/bursa-hackathon/assets/63963472/5be70ddd-793c-42bc-9aed-cd9e616b574d)
![WhatsApp Görsel 2023-06-18 saat4564 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/96dec238-3447-42cf-94e9-5e2bf5e6c360)
![WhatsApp Görsel 2023-06-18 saat4654 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/27b0f81a-595a-4ee2-8f96-4de41475b5bd)
![WhatsApp Görsel49872023-06-18 saat 10 44 18](https://github.com/Soomali/bursa-hackathon/assets/63963472/5dff0fca-1865-47c2-9be2-217da27604d6)
