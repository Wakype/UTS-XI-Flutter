import 'package:flutter/material.dart';
import 'package:my_shop/body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.chevron_left),
                  Image.asset('assets/image/logo2.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: const [
                  Text(
                    'Let’s sign you in',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Body(),
    );
  }
}
