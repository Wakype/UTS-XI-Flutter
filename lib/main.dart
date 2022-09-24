// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_shop/screens/Detail%20Page/detail_page.dart';
import 'package:my_shop/screens/log_in/login.dart';
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
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          textTheme: const TextTheme(
              bodyText1: TextStyle(
            fontFamily: "Poppins",
          ))),
      initialRoute: '/',
      routes: {
        '/': (context) => const DetailPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const Shop()
      },
    );
  }
}
