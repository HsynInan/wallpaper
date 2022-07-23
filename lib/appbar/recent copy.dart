import 'dart:convert';

//import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_thewitcher/Services/Konular/konularModel.dart';
import 'package:wallpaper_thewitcher/Services/Konular/konularService.dart';
import 'package:wallpaper_thewitcher/service/Count.dart';
import 'package:wallpaper_thewitcher/service/firebaseadmob.dart';

import '../download.dart';

class Recent extends StatefulWidget {
  const Recent({Key key}) : super(key: key);

  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  IWallpaperService postService;
  bool _isLoading = false;
  List<WallpaperModel> _wallpaperItem;
  final ams = AdMobService();
  String default_url = "Hata Oluştu";

  void initState() {
    postService = WallpaperService();

    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    _changeLoading();
    _wallpaperItem = await postService.fetchWallpaperModel(101);
    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    InterstitialAd newAdd = ams.getNewTripInterstitial();
    newAdd.load();
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : GridView.builder(
                  itemCount: _wallpaperItem == null ? 0 : _wallpaperItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Image.network(
                        _wallpaperItem[index].imageUrl,
                        width: 500,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        if (ReklamMiktari.ReklamSayisi % 101 == 0) {
                          ReklamMiktari.ReklamSayisi =
                              ReklamMiktari.ReklamSayisi + 1;
                        } else {
                          newAdd.show(
                              anchorType: AnchorType.bottom,
                              anchorOffset: 0.0,
                              horizontalCenterOffset: 0.0);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => MyHomePage(
                                      fileName2: _wallpaperItem[index].name,
                                      url2: _wallpaperItem[index].imageUrl,
                                    )));
                      },
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      mainAxisExtent: 350,
                      crossAxisCount: 2),
                )),
    );
  }
}
