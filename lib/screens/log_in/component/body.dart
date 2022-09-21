import 'dart:developer';
import 'package:flutter/material.dart';
import 'custom_surfix_icon.dart';
import 'socalCard.dart';
import 'package:my_shop/service/usersService.dart';
import 'package:my_shop/model/usersData.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            color: Colors.grey.withOpacity(0.1)),
                        child: InkWell(
                          child: const Icon(
                            Icons.chevron_left,
                            size: 40,
                            // color: Colors.b,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Image.asset('assets/image/logo2.png'),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Let`s sign you in',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 35),
                  width: 480,
                  height: 615.2,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      color: Color(0xFFFFB200)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const SignForm(),
                        SizedBox(height: height * 0.08),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocalCard(
                              icon: "assets/image/google.png",
                              press: () {},
                            ),
                            SocalCard(
                              icon: "assets/image/twitter.png",
                              press: () {},
                            ),
                            SocalCard(
                              icon: "assets/image/facebook (1).png",
                              press: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don`t have an account ? ',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                )),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  Users? dataUsers;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  void validationLogin() {
    if (_email.text != "" && _password.text != "") {
      UsersService().getData().then((value) {
        setState(() {
          dataUsers = value;
          print(dataUsers?.email);
          log("$dataUsers.email");
        });
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          //Email address
          customField("Email", _email),

          SizedBox(
            height: height * 0.04,
          ),

          //Password
          customField(
            "password",
            _password,
          ),

          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Forgot Password ?',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 50,
          // ),
          SizedBox(
            height: height * 0.06,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/shop');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 23),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: const Center(
                  child: Text(
                'Continue',
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Color(0xFFFFB200),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

TextFormField customField(String tipe, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      color: Colors.white,
    ),
    obscureText: tipe == 'Email' ? false : true,
    decoration: InputDecoration(
      labelText: tipe == 'Email' ? "Email Address" : "Password",
      labelStyle: const TextStyle(
        fontFamily: "Poppins",
        color: Colors.white,
        fontSize: 19,
      ),
      hintText: tipe == 'Email' ? "Enter Your Email" : "Enter Your Password",
      hintStyle: const TextStyle(
        fontFamily: "Poppins",
        color: Colors.white,
        fontSize: 16.5,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 42,
        vertical: 24,
      ),
      suffixIcon: CustomSuffixIcon(
        svgIcon:
            tipe == "Email" ? "assets/icon/user.svg" : "assets/icon/noEyes.svg",
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(color: Colors.white),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(color: Colors.white),
        gapPadding: 10,
      ),
      filled: true,

      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(28),
      // ),
    ),
  );
}

TextFormField emailFormFeild() {
  return TextFormField(
    style: const TextStyle(
      fontFamily: "Poppins",
      fontSize: 18,
      color: Colors.white,
    ),
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: "Email Address",
      labelStyle: const TextStyle(
        fontFamily: "Poppins",
        color: Colors.white,
        fontSize: 19,
      ),
      hintText: "Enter your name",
      hintStyle: const TextStyle(
        fontFamily: "Poppins",
        color: Colors.white,
        fontSize: 16.5,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: const CustomSuffixIcon(
        svgIcon: "assets/icon/user.svg",
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 42,
        vertical: 24,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: Colors.white),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        gapPadding: 10,
      ),
      filled: true,

      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(28),
      // ),
    ),
  );
}
