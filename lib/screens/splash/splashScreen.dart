// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_shop/screens/log_in/component/body.dart';
import 'package:my_shop/screens/log_in/login.dart';
import 'package:my_shop/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startSplashScreen() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/image/splash.png',
              width: 200,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'MyShop',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
