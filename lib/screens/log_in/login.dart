import 'package:flutter/material.dart';
import 'package:my_shop/screens/log_in/component/body.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Body(),
    );
  }
}
