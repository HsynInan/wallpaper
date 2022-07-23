import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'konularModel.dart';

abstract class IWallpaperService {
  Future<List<WallpaperModel>> fetchWallpaperModel(int id);
  Future<List<WallpaperModel>> fetchKarakterWallpaperModel(int id);
  Future<List<WallpaperModel>> fetchPopularWallpaperModel(int id);
}

class WallpaperService implements IWallpaperService {
  @override
  Future<List<WallpaperModel>> fetchWallpaperModel(int id) async {
    try {
      final res = await http.get(
          Uri.parse("https://www.dersnotlarim.net/wallpaper/user.php?id=22"));

      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body);

        List<WallpaperModel> posts = body
            .map<WallpaperModel>(
              (item) => WallpaperModel.fromJson((item)),
            )
            .toList();

        return posts;
      } else {
        throw "Unable to retrieve posts.";
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  Future<List<WallpaperModel>> fetchKarakterWallpaperModel(int id) async {
    try {
      final res = await http.get(Uri.parse(
          "https://www.dersnotlarim.net/wallpaper/karakter.php?id=22"));

      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body);

        List<WallpaperModel> posts = body
            .map<WallpaperModel>(
              (item) => WallpaperModel.fromJson((item)),
            )
            .toList();

        return posts;
      } else {
        throw "Unable to retrieve posts.";
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  Future<List<WallpaperModel>> fetchPopularWallpaperModel(int id) async {
    try {
      final res = await http.get(Uri.parse(
          "https://www.dersnotlarim.net/wallpaper/popular.php?id=22"));

      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body);

        List<WallpaperModel> posts = body
            .map<WallpaperModel>(
              (item) => WallpaperModel.fromJson((item)),
            )
            .toList();

        return posts;
      } else {
        throw "Unable to retrieve posts.";
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}
