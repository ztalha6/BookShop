import 'dart:io';

import 'package:bookshop/pages/adminshowroom.dart';
import 'package:bookshop/pages/loginScreen.dart';
import 'package:bookshop/pages/registration.dart';
import 'package:bookshop/pages/shopregistration.dart';
import 'package:bookshop/pages/showroom.dart';
import 'package:bookshop/pages/vendorshowroom.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

class Splash extends StatelessWidget {
  const Splash({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      imagePath: 'assets/splash.png',
      home: MyHomePage(),
      //home: ShopRegistration(),
      //home: AdminShowroom(),
      //home: Showroom(),
      //home: VendorShowroom(),
      // for abckground processing
      //customFunction: duringSplash,
      duration: 2000,
      //for background processing
      //type: AnimatedSplashType.BackgroundProcess,
      type: AnimatedSplashType.StaticDuration,
      //outputAndHome: op,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
