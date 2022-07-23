//import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_admob/firebase_admob.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_thewitcher/bottom.dart';
import 'package:wallpaper_thewitcher/download.dart';
import 'package:wallpaper_thewitcher/service/firebaseadmob.dart';
import 'package:wallpaper_thewitcher/splashscreen.dart';
import 'package:wallpaper_thewitcher/tema.dart';

import 'locator.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //FirebaseAdMob.instance.initialize(appId: AdMobService().getAdMobAppId());
  // setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        home: SplashScreen(),
        routes: {
          '/home': (context) => HomeNavigator(),
        });
  }
}

/*Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
}
*/