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

## Uygulama
  Uygulamamızı Flutter kullanarak yazdık. Backend olarak ise Firebase'i veritabanı olarak ve kimliklendirme sağlayacısı olarak kullandık. 