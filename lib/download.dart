import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MyHomePage extends StatefulWidget {
  final url2;
  final fileName2;

  const MyHomePage({Key key, this.url2, this.fileName2}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          String newPath = "";
          print(directory);
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/TheWitcher";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
          });
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile() async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo("${widget.url2}", "${widget.fileName2}");

    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  Future<void> setwallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.url2);
    final String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.cancel,
              size: 30,
              color: Colors.grey.shade700,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.file_download),
        onPressed: () async {
          setState(() {
            loading = true;
            progress = 0;
          });
          bool downloaded =
              await saveVideo("${widget.url2}", "${widget.fileName2}");

          if (downloaded) {
            print("File Downloaded");
          } else {
            print("Problem Downloading File");
          }
          setState(() {
            loading = false;
          });
        },
      ),*/
        body: Builder(builder: (BuildContext context) {
          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: Image.network(
                          "${widget.url2}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 120,
                  right: 30,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                      icon: Icon(
                        Icons.image_sharp,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        setwallpaper();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          duration: Duration(milliseconds: 3000),
                          backgroundColor: Theme.of(context).accentColor,
                          content: Text(
                              " ✓ Ana ekran duvar kağıdı olarak ayarlandı."),
                          behavior: SnackBarBehavior.fixed, // Add this line
                        ));
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 30,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                      icon: Icon(
                        Icons.file_download,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                          progress = 0;
                        });
                        bool downloaded = await saveVideo(
                            "${widget.url2}", "${widget.fileName2}");

                        if (downloaded) {
                          print("File Downloaded");
                        } else {
                          print("Problem Downloading File");
                        }
                        setState(() {
                          loading = false;
                        });

                        Scaffold.of(context).showSnackBar(SnackBar(
                          duration: Duration(milliseconds: 3000),
                          backgroundColor: Theme.of(context).accentColor,
                          content: Text(
                              " ✓ Fotoğraf lokasyonu: Phone/Files/TheWitcher"),
                          behavior: SnackBarBehavior.fixed, // Add this line
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
/*Scaffold.of(context).showSnackBar(SnackBar(
                              backgroundColor: Color(0xfff356859),
                              content: Text(" ✓ Söz başarıyla kopyalandı.")));*/