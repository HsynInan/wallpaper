import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Privacy Policy"),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Uygulama içinde kullanıcı yetkilendirme özelliklerini etkinleştirirseniz, aşağıdaki ek bilgiler depolanır: \n- Depolama,\n -Ağ erişim izni,\n Uygulama sahibini kullanım hakkında bilgilendirmek için aşağıdaki (bilinmeyen) bilgileri de topluyoruz. \nUygulamada push bildirimi aktif ise, entegre BleshSDK kullanıcıları ile ilgili bilgiler aşağıda verilmiştir.\n BleshSDK sayesinde kullanıcıların bildirim izin durumu ve bilgilerine erişilebilmekte ve conf için gerekli güvenlik önlemleri alınır. Bu bilginin kimliği.\nKullanıcının kendisine gönderilen kampanyaya ilişkin görünümü. Kullanıcı, adını fotoğraf albümüne kaydetmek isterse, Kullanıcının fotoğraf albümüne ve kamerasına erişilir ve ekran görüntüsü fotoğraf albümüne kaydedilir. Bilgiler sadece bu amaçların gerçekleştirilmesi amacıyla üçüncü kişilerle paylaşılır ve bu kapsam dışında bilgi yayınlanmasına ve ifşa edilmesine izin verilmez.",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
