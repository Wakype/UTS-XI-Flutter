import 'package:flutter/material.dart';
import 'package:my_shop/screens/splash/splashScreen.dart';

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

      },
    );
  }
}
