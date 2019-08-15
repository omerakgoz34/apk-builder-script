# Android APK Builder Script

## Android üzerinde APK oluşturma:

1. Önce **[Termux](https://play.google.com/store/apps/details?id=com.termux)**'u yükleyin.
2. Yüklendikten sonra Termux'u açın ve ilk kurulumu yapmasını bekleyin. Kurulum bittikten sonra `pkg upgrade` yazarak bütün paketleri güncelleyin.
3. Sonra `pkg install git aapt ecj dx apksigner nano` ile gerekli paketleri yükleyin.
4. `git clone https://gitlab.com/omerakgoz34/apk-builder-script.git` ile script'i ve örnek projeyi indirin.
5. `cd apk-builder-script` yazarak projenin içine girin ve `cp apt_tr.sh app_sample/apk.sh` yazarak script dosyasını örnek projenin içine kopyalayın ve `cd app_sample` yazarak örnek projenin içine girin.
6. `chmod +x apk.sh` yazarak script dosyasını çalıştırılabilir hale getirin.
7. Script dosyasını çalıştırmadan önce `cd` ile ana klsöre gidin ve `nano ../usr/bin/dalvikvm` yazarak **"dalvikvm"** dosyasını açın. Sonra **"export ANDROID_DATA..."** ve **"mkdir -p $ANDROID_DATA..."** ile başlayan satırların en başına **"#"** işareti koyun. Yazmakta sıkıntı yaşıyorsanız [Hacker's Keyboard](https://play.google.com/store/apps/details?id=org.pocketworkstation.pckeyboard) klavye uygulamasını yükleyerek ok tuşları ile daha rahat yazabilirsiniz.
8. Örnek: **"# export ANDROID_DATA..."** ve **"# mkdir -p $ANDROID_DATA..."** gibi olacak.
9. Doğru bir şekilde yaptıktan sonra önce CTRL, sonra X'e basın ve ardından Y'e ve ENTER'a basarak dosyayı kayıt edin. Kayıt ettikten sonra bildirim çekmecesinden Termux'un bildirimini bulup EXIT'a basarak uygulamadan çıkış yapın.
10. Ardından Termux'u tekrar açıp `cd` komutunu kullanarak tekrar **"app_sample"** klasörünün içine gelin ve `sh apk.sh` yazıp bir boşluk bırakın ve APK'yı imzalamak için oluşturulacak yeni anahtarın şifresini yazın ve ENTER ile APK oluşturma işlemini başlatın. İşlemleri doğru bir şekilde yaptıysanız hata mesajı almadan APK oluşturulacaktır.
11. NOT: bir kez anahtar(keystore) oluşturduktan sonra o anahtarı silmediğiniz sürece aynı şifreyi kullanmanız gerekecek.
12. APK oluştuktan sonra sistem ayarlarından Termux'a depolama izni verin ve ardından Termux'a dönüp `cp bin/org.author.appname.apk /sdcard/uygulama.apk` yazarak oluşturduğunuz APK dosyasını dosyalar bölümüne kopyalayın.
13. Artık cihazınızın Dosya Yöneticisi uygulamasına girip uygulama.apk dosyasına basarak uygulamanızı yükleyebilirsiniz.

## platform.zip(sdk) indirme linkleri:

* [Android 8.1](https://dl-ssl.google.com/android/repository/platform-27_r03.zip)
* [Android 8.0](https://dl-ssl.google.com/android/repository/platform-26_r02.zip)
* [Android 7.1](https://dl-ssl.google.com/android/repository/platform-25_r03.zip)
* [Android 7.0](https://dl-ssl.google.com/android/repository/platform-24_r02.zip)
* [Android 6.0](https://dl-ssl.google.com/android/repository/platform-23_r03.zip)

**NOT**: APK oluşturabilmek için sadece zip içindeki android.jar dosyası yeterlidir. Tema, font, UI gibi ekstra bileşenleri `platform.zip` içerisinden elde edebilirsiniz.

## Özelleştirme

* **[apk.sh]()** script dosyasını istediğiniz gibi modifiye edebilir *ismini, paket adını, dosyaların konumunu vs.* özelleştirebilirsiniz.
* İsteğinize ve uygulamanıza göre ekstra aşamalar eklyip kendinize göre uyarlayabilirsiniz.
* Otomatik oluşturulan uygulama imzalama anahtarı(keystore dosyası) yerine başka kendi oluşturduğunuz bir keystore dosyası da kullanabilirsiniz.

## Bir sorun mu var?

Bir sorun ile karşılaşırsanız **[SoftDevTR Discord](https://discord.gg/4aVWp5S)** sunucusu üzerinden bana(omerakgoz34) mesaj atabilir, **omerakgoz34@gmail.com** adresine email atabilir veya [issues](https://gitlab.com/omerakgoz34/apk-builder-script/issues) bölümünden yeni bir hata bildirimi(issue) açıp sorununuzu bildirebilirsiniz.