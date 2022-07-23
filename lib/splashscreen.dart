import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> image = [
    'assets/splash/1.png',
    'assets/splash/2.jpg',
    'assets/splash/4.jpg',
    'assets/splash/5.jpg',
    'assets/splash/6.png',
    'assets/splash/s1.jpg',
    'assets/splash/s2.jpg',
    'assets/splash/s3.jpg',
    'assets/splash/s4.jpg',
    'assets/splash/s5.jpg',
  ];
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  '${image.elementAt(Random().nextInt(image.length))}'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/textt.png',
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
