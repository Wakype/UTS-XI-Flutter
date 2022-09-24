// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:my_shop/screens/log_in/component/signForm.dart';
import 'custom_surfix_icon.dart';
import 'socalCard.dart';
import "package:my_shop/service/usersService.dart";

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
              height: 69,
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

// class SignForm extends StatefulWidget {
//   const SignForm({super.key});

//   @override
//   State<SignForm> createState() => _SignFormState();
// }

// class _SignFormState extends State<SignForm> {
//   bool _obscureText = true;
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     return Form(
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),

//           //Email address
//           emailFormFeild(),

//           SizedBox(
//             height: height * 0.04,
//           ),

//           //Password
//           passwordFormFeild(),

//           const SizedBox(
//             height: 10,
//           ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: const [
//               Text(
//                 'Forgot Password ?',
//                 style: TextStyle(
//                   fontFamily: "Poppins",
//                   fontSize: 14.5,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           // const SizedBox(
//           //   height: 50,
//           // ),
//           SizedBox(
//             height: height * 0.06,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.pushNamed(context, '/shop');
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 23),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.black,
//               ),
//               child: const Center(
//                   child: Text(
//                 'Continue',
//                 style: TextStyle(
//                   fontFamily: "Poppins",
//                   color: Color(0xFFFFB200),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 ),
//               )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   TextFormField passwordFormFeild() {
//     return TextFormField(
//       style: const TextStyle(
//         fontFamily: "Poppins",
//         fontSize: 18,
//         color: Colors.white,
//       ),
//       obscureText: _obscureText,
//       decoration: InputDecoration(
//         labelText: "Password",
//         labelStyle: const TextStyle(
//           fontFamily: "Poppins",
//           color: Colors.white,
//           fontSize: 19,
//         ),
//         hintText: "Enter Your Password",
//         hintStyle: const TextStyle(
//           fontFamily: "Poppins",
//           color: Colors.white,
//           fontSize: 16.5,
//         ),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 42,
//           vertical: 24,
//         ),
        // suffixIcon: GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       _obscureText = !_obscureText;
        //     });
        //   },
        //   child: Container(
        //       margin: const EdgeInsets.symmetric(horizontal: 24),
        //       child: Icon(
        //         _obscureText ? Icons.visibility : Icons.visibility_off,
        //         color: Colors.white,
        //       )),
        // ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(22),
//           borderSide: const BorderSide(color: Colors.white),
//           gapPadding: 10,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(22),
//           borderSide: const BorderSide(color: Colors.white),
//           gapPadding: 10,
//         ),
//         filled: true,

//         // enabledBorder: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(28),
//         // ),
//       ),
//     );
//   }

//   TextFormField emailFormFeild() {
//     return TextFormField(
//       style: const TextStyle(
//         fontFamily: "Poppins",
//         fontSize: 18,
//         color: Colors.white,
//       ),
//       keyboardType: TextInputType.emailAddress,
//       decoration: InputDecoration(
//         labelText: "Email Address",
//         labelStyle: const TextStyle(
//           fontFamily: "Poppins",
//           color: Colors.white,
//           fontSize: 19,
//         ),
//         hintText: "Enter your email",
//         hintStyle: const TextStyle(
//           fontFamily: "Poppins",
//           color: Colors.white,
//           fontSize: 16.5,
//         ),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: const CustomSuffixIcon(
//           svgIcon: "assets/icon/user.svg",
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 42,
//           vertical: 24,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20.0),
//           borderSide: const BorderSide(color: Colors.white),
//           gapPadding: 10,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20.0),
//           borderSide: const BorderSide(
//             color: Colors.white,
//           ),
//           gapPadding: 10,
//         ),
//         filled: true,

//         // enabledBorder: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(28),
//         // ),
//       ),
//     );
//   }
// }
