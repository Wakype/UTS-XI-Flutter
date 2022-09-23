// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:my_shop/model/shopsData.dart';
import 'package:my_shop/screens/splash/splashScreen.dart';
import 'package:my_shop/searchPage.dart';
// import 'package:my_shop/screens/splash/splashScreen.dart';
import 'package:my_shop/shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: const Login(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          textTheme: const TextTheme(
              bodyText1: TextStyle(
            fontFamily: "Poppins",
          ))),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/shop': (context) => Shop(),
        // '/detailShop': (context) => Shop(
        //   data: ModalRoute.of(context)?.settings.arguments as Shops),
        '/searchPage': (context) => SearchPage(
            keyword: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
