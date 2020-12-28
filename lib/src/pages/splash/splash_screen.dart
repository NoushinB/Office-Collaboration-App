import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_asstes.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/pages/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Card(
                      child: Center(
                        child: Container(

                          height: height / 4,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(AppAssets.one),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text("Mulki Zerin",
                        style: TextStyle(
                            color: AppColors.darkPrimaryColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Text(
              'copyright @ 2020 - Mulki Zerin',
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12),
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }

  startTimer() async {
    debugPrint("Timer started");
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigateToMainPage);
  }

  Future<void> navigateToMainPage() async {
    debugPrint("Timer completed");
    // var screenHeight = MediaQuery.of(context).size.height;
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardPage(screenHeight: screenHeight)));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
