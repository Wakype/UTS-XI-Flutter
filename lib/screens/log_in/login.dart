import 'package:flutter/material.dart';
import 'package:my_shop/screens/log_in/component/body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Body(),
    );
  }
}
