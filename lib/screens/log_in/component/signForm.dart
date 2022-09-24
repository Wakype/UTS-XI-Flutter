// ignore_for_file: unnecessary_new, prefer_final_fields, file_names, unnecessary_import, implementation_imports, unused_import

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
  final formKey = GlobalKey<FormState>();
  Users? dataUsers;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  List<Users> dataLogin = [];
  List<Users> dataFilter = [];

  void getLoginData() {
    UsersService().getData().then((value) {
      setState(() {
        dataLogin = value;
        if (_email.text != "" && _password.text != "") {
          dataFilter = dataLogin
              .where((element) =>
                  element.email
                      .toLowerCase()
                      .contains(_email.text.toLowerCase()) &&
                  element.password.toLowerCase().contains(_password.text))
              .toList();

          if (dataFilter.isNotEmpty) {
            Navigator.pushReplacementNamed(context, '/shop');
          } else {
            Alert(
              context: context,
              type: AlertType.error,
              title: "RFLUTTER ALERT",
              desc: "Flutter is more awesome with RFlutter Alert.",
              buttons: [
                DialogButton(
                  child: Text(
                    "COOL",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
            ).show();
          }
        } else {
          Alert(
            context: context,
            type: AlertType.error,
            title: "Email / Password Salah!",
            desc: "Isi Email / Passwordmu dengan benar",
            buttons: [
              DialogButton(
                child: Text(
                  "Kembali",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }
      });
    });
  }

  // void validationLogin() {
  //   if (_email.text != "" && _password.text != "") {
  //     UsersService().getData().then((value) {
  //       setState(() {
  //         dataUsers = value;
  //         // print(dataUsersmq@.password);
  //       });
  //     });
  //   }}

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _email,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    labelStyle: const TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.white,
                      fontSize: 19,
                    ),
                    hintText: "Enter Your Email",
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
                    suffixIcon:
                        CustomSuffixIcon(svgIcon: "assets/icon/user.svg"),
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
                ),

                SizedBox(
                  height: height * 0.04,
                ),

                //Password
                // customField("password", _password),
                TextFormField(
                  controller: _password,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.white,
                      fontSize: 19,
                    ),
                    hintText: "Enter Your Password",
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
                    suffixIcon:
                        CustomSuffixIcon(svgIcon: "assets/icon/noEyes.svg"),
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
                ),
              ],
            ),
          ),

          //Email address
          // customField("Email", _email),

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
              final isValidForm = formKey.currentState?.validate();
              getLoginData();
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

// TextFormField customField(String tipe, TextEditingController controller) {
//   final formKey = GlobalKey<FormState>();

//   return TextFormField(
//     autovalidateMode: AutovalidateMode.onUserInteraction,
//     key: formKey,
//     controller: controller,
//     style: const TextStyle(
//       fontFamily: "Poppins",
//       fontSize: 18,
//       color: Colors.white,
//     ),
//     obscureText: tipe == 'Email' ? false : true,
//     decoration: InputDecoration(
//       labelText: tipe == 'Email' ? "Email Address" : "Password",
//       labelStyle: const TextStyle(
//         fontFamily: "Poppins",
//         color: Colors.white,
//         fontSize: 19,
//       ),
//       hintText: tipe == 'Email' ? "Enter Your Email" : "Enter Your Password",
//       hintStyle: const TextStyle(
//         fontFamily: "Poppins",
//         color: Colors.white,
//         fontSize: 16.5,
//       ),
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 42,
//         vertical: 24,
//       ),
//       suffixIcon: CustomSuffixIcon(
//         svgIcon:
//             tipe == "Email" ? "assets/icon/user.svg" : "assets/icon/noEyes.svg",
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(22),
//         borderSide: const BorderSide(color: Colors.white),
//         gapPadding: 10,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(22),
//         borderSide: const BorderSide(color: Colors.white),
//         gapPadding: 10,
//       ),
//       filled: true,

//       // enabledBorder: OutlineInputBorder(
//       //   borderRadius: BorderRadius.circular(28),
//       // ),
//     ),
//   );
// }
