# Android APK Builder Script (apk.sh)
created by omerakgoz34

* Download link sample for platform.zip v7.1.1: https://dl-ssl.google.com/android/repository/platform-25_r03.zip
(only need android.jar)

## Android üzerinde APK oluşturma:

* Önce [Termux](https://play.google.com/store/apps/details?id=com.termux)'u yükleyin.
* Yüklendikten sonra Termux'u açın ve ilk kurulumu yapmasını bekleyin. Kurulum bittikten sonra "`pkg upgrade`" yazarak bütün paketleri güncelleyin.
* Sonra "`pkg install git aapt ecj dx apksigner nano`" ile gerekli paketleri yükleyin.
* "`git clone https://gitlab.com/omerakgoz34/apk-builder-script.git`" ile script'i ve örnek projeyi indirin.
* "`cd apk-builder-script`" yazarak projenin içine girin ve "`cp apt_tr.sh app_sample/apk.sh`" yazarak script dosyasını örnek projenin içine kopyalayın ve "`cd app_sample`" yazarak örnek projenin içine girin.
* "`chmod +x apk.sh`" yazarak script dosyasını çalıştırılabilir hale getirin.
* Script dosyasını çalıştırmadan önce "`cd`" ile ana klsöre gidin ve "`nano ../usr/bin/dalvikvm`" yazarak "dalvikvm" dosyasını açın. Sonra "export ANDROID_DATA..." ve "mkdir -p $ANDROID_DATA..." ile başlayan satırların en başına "#" işareti koyun. Yazmakta sıkıntı yaşıyorsanız [Hacker's Keyboard](https://play.google.com/store/apps/details?id=org.pocketworkstation.pckeyboard) klavye uygulamasını yükleyerek ok tuşları ile daha rahat yazabilirsiniz.
* Örnek: "# export ANDROID_DATA..." ve "# mkdir -p $ANDROID_DATA..." gibi olacak.
* Doğru bir şekilde yaptıktan sonra önce CTRL, sonra X'e basın ve ardından Y'e ve ENTER'a basarak dosyayı kayıt edin. Kayıt ettikten sonra bildirim çekmecesinden Termux'un bildirimini bulup EXIT'a basarak uygulamadan çıkış yapın.
* Ardından Termux'u tekrar açıp "`cd`" komutunu kullanarak tekrar "app_sample" klasörünün içine gelin ve "`sh apk.sh`" yazıp bir boşluk bırakın ve APK'yı imzalamak için oluşturulacak yeni anahtarın şifresini yazın ve ENTER ile APK oluşturma işlemini başlatın. İşlemleri doğru bir şekilde yaptıysanız hata mesajı almadan APK oluşturulacaktır.
* APK oluştuktan sonra sistem ayarlarından Termux'a depolama izni verin ve ardından Termux'a dönüp "`cp bin/org.author.appname.apk /sdcard/uygulama.apk`" yazarak oluşturduğunuz APK dosyasını dosyalar bölümüne kopyalayın.
* Artık cihazınızın Dosya Yöneticisi uygulamasına girip uygulama.apk dosyasına basarak uygulamanızı yükleyebilirsiniz.

## Özelleştirme

* [apk.sh](https://gitlab.com/omerakgoz34/apk-builder-script/raw/master/apk_tr.sh) Script dosyasını istediğiniz gibi modifiye edebilir *ismini, paket adını, dosyaların konumunu vs.* özelleştirebilirsiniz.
* İsteğinize ve uygulamanıza göre ekstra aşamalar eklyip kendinize göre uyarlayabilirsiniz.

## Bir sorun mu var?

Bir sorun ile karşılaşırsanız [SoftDevTR Discord](https://discord.gg/4aVWp5S) sunucusu üzerinden bana(omerakgoz34) mesaj atabilir, omerakgoz34@gmail.com adresine email atabilir veya [issues](https://gitlab.com/omerakgoz34/apk-builder-script/issues) bölümünden yeni bir hata bildirimi(issue) açıp sorununuzu bildirebilirsiniz.