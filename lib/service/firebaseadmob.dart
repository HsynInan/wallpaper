import 'dart:io';
import 'dart:math';
import 'package:firebase_admob/firebase_admob.dart';

class AdMobService {
  List<String> banners = [
    'ca-app-pub-6946655200550918/2543704997',
    'ca-app-pub-6946655200550918/5493888691',
  ];

  List<String> gecisler = [
    'ca-app-pub-6946655200550918/2982688695',
    'ca-app-pub-6946655200550918/2352133307',
  ];

  String getAdMobAppId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544~1458002511';
    } else if (Platform.isAndroid) {
      return "ca-app-pub-6946655200550918~6482950009";
    }
    return null;
  }

  String getBannerAdId() {
    if (Platform.isIOS) {
//      return 'ca-app-pub-2334510780816542/6833456062';
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isAndroid) {
//      return 'ca-app-pub-2334510780816542/2993163849';
      return banners.elementAt(Random().nextInt(banners.length));
    }
    return null;
  }

  String getInterstitialAdId() {
    if (Platform.isIOS) {
//      return '';
      return 'ca-app-pub-3940256099942544/1033173712';
    } else if (Platform.isAndroid) {
//      return '';
      return gecisler.elementAt(Random().nextInt(gecisler.length));
    }
    return null;
  }

  InterstitialAd getNewTripInterstitial() {
    return InterstitialAd(
      adUnitId: getInterstitialAdId(),
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }
}
