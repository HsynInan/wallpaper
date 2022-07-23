import 'package:flutter/material.dart';

class Hakkinda extends StatelessWidget {
  const Hakkinda({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Hakkımızda"),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
                "The Witcher savaşında savaşla barış içinde yaşamak, insanlar ve elflerle yeni bir ırk verir. The Witcher olarak bilinen Geralt of Rivia, vaat edilen çocuğun doğumunu beklemektedir. Bu çocuk, yaratıcısını değiştirme gücüne sahiptir.\n\nBu, resmi bir 'The Witcher WALLPAPERS' uygulaması değildir, herhangi bir uygulamanın geliştiricisi veya ortağıyla ilişkili veya bağlantılı değildir. Bu uygulama, yasaların 'adil kullanım' yönergelerini takip eder, 'adil kullanım' yönergelerine uymayan doğrudan bir telif hakkı veya ticari marka ihlali olduğunu düşünüyorsanız, lütfen doğrudan bizimle iletişime geçin. \n\nStandartların üstünde içerikler üretip siz değerli konuklarımıza kaliteyi göstermek istiyoruz..",
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
