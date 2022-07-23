import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  // ignore: missing_return
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      cardColor: Color(0xfff6eb6ff),
      primaryColorLight: Colors.white,
      primaryColor: Colors.black,
      accentColor: Colors.black,
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Color(0xfff6eb6ff),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontFamily: "Lora",
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontFamily: "Lora",
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontFamily: "Lora",
        ),
        bodyText2: TextStyle(
          color: Colors.white,
          fontFamily: "Lora",
        ),
      ),
    );
  }

//171717
  static ThemeData get darkTheme {
    return ThemeData(
      cardColor: Colors.white,
      primaryColor: Colors.black,
      accentColor: Color(0xfff009b65),
      backgroundColor: Colors.white,
      primaryColorLight: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black,
          fontFamily: "Lora",
        ),
        headline2: TextStyle(
          color: Colors.black,
          fontFamily: "Lora",
        ),
        bodyText1: TextStyle(
          color: Colors.black,
          fontFamily: "Lora",
        ),
        bodyText2: TextStyle(
          color: Colors.black,
          fontFamily: "Lora",
        ),
      ),
    );
  }
}
