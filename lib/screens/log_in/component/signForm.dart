// ignore_for_file: unnecessary_import, file_names, implementation_imports

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'custom_surfix_icon.dart';
import 'socalCard.dart';
import 'package:my_shop/service/usersService.dart';
import 'package:my_shop/model/usersData.dart';

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
          // print(dataUsersmq@.password);
        });
      });
    }}

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
              onTap: () {},
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
      obscureText: true,
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
          svgIcon: tipe == "Email"
              ? "assets/icon/user.svg"
              : "assets/icon/noEyes.svg",
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