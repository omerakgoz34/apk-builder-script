# APK Builder Script by omerakgoz34
# TR Edition

ANDROIDJAR="android.jar" # android.jar dosyasının konumu
APKNAME="org.author.appname" # APK dosyasının ismi
PKGNAMEDIR="org/author/appname" # Kaynak kodlarının bulunduğu klasör
KEYLOCATION="author.keystore" # Keystore dosyasının konumu
COMPILER="ecj" # Derleyici. ÖR= ecj, javac
OPT=$1

if [ -z $OPT ]; then
	echo
	echo "Kullanım: sh apk.sh <keystore şifresi / temizle>"
	echo "Bu araç omerakgoz34 tarafından oluşturulmuştur."
	echo
	exit
fi

if [ $OPT = "temizle" ]; then
	echo
	rm -f -r bin/*
	rm -f -r obj/*
	rm -f src/$PKGNAMEDIR/R*
	rm -f *dex
	echo
	echo "Temizlendi."
	echo
	exit
fi

clear
echo
echo "R.java oluşturuluyor..."
aapt package -f -m -J src -M AndroidManifest.xml -S res -I $ANDROIDJAR
if [ -f src/$PKGNAMEDIR/R.java ]; then
	echo
else
	echo
	echo "*** HATA ***"
	echo "R.java oluşturulamadı!"
	echo
	exit
fi

echo "Derleniyor..."
$COMPILER -d obj -classpath src -bootclasspath $ANDROIDJAR src/$PKGNAMEDIR/*.java
if [ -f obj/$PKGNAMEDIR/R.class ]; then
	echo
else
	echo
	echo "*** HATA ***"
	echo "Derleme başarısız!"
	echo
	exit
fi

echo "Derlemeler DEX'e dönüştürülüyor..."
dx --dex --output=classes.dex obj
if [ -f classes.dex ]; then
	echo
else
	echo
	echo "*** HATA ***"
	echo "DEX'e dönüştürme başarısız!"
	echo
	exit
fi

echo "APK olarak paketleniyor..."
aapt package -f -m -F bin/$APKNAME.unsigned.apk -M AndroidManifest.xml -S res -I $ANDROIDJAR
aapt add bin/$APKNAME.unsigned.apk classes.dex
rm -f classes.dex
if [ -f bin/$APKNAME.unsigned.apk ]; then
	echo
else
	echo
	echo "*** HATA ***"
	echo "APK paketleme başarısız!"
	echo
	exit
fi

echo "APK imzalanıyor..."
apksigner -p $OPT $KEYLOCATION bin/$APKNAME.unsigned.apk bin/$APKNAME.unaligned.apk
if [ -f bin/$APKNAME.unaligned.apk ]; then
	echo
else
	echo
	echo "*** HATA ***"
	echo "İmzalama başarısız!"
	echo
	exit
fi

echo "APK optimize ediliyor..."
zipalign -f 4 bin/$APKNAME.unaligned.apk bin/$APKNAME.apk
rm -f bin/$APKNAME.unsigned.apk
rm -f bin/$APKNAME.unaligned.apk
if [ -f bin/$APKNAME.apk ]; then
	echo
else
	echo
	echo "*** HATA ***"
	echo "Optimize etme başarısız!"
	echo
	exit
fi
echo
echo "APK Hazır:"
echo "bin/$APKNAME.apk"
echo
exit