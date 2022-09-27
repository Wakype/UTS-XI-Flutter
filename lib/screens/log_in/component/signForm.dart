import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'custom_surfix_icon.dart';
import 'package:my_shop/service/usersService.dart';
import 'package:my_shop/model/usersData.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();
  Users? dataUsers;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                  child: const Text(
                    "COOL",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
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
                onPressed: () => Navigator.pop(context),
                width: 120,
                child: const Text(
                  "Kembali",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ).show();
        }
      });
    });
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

          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,   
                  controller: _email,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    color: Colors.white,
                  ),
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
                        const CustomSuffixIcon(svgIcon: "assets/icon/user.svg"),
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
                  ),
                ),

                SizedBox(
                  height: height * 0.04,
                ),

                TextFormField(
                  controller: _password,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  obscureText: _obscureText,
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
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
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
                  ),
                ),
              ],
            ),
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