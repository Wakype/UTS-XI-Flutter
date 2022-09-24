// // ignore_for_file: unused_import, avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:my_shop/model/shopsData.dart';
// import 'package:my_shop/service/shopsService.dart';
// import 'package:my_shop/main.dart';

// class DetailPage extends StatefulWidget {
//   final Shops data;

//   DetailPage({required this.data});

//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   int _count = 0;

//   void _incrementCount() {
//     setState(() {
//       _count++;
//     });
//   }

//   void _decrementCount() {
//     setState(() {
//       _count--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final successAlert = _buildButton(
//         onTap: () {
//           // Navigator.pushNamed(context, "/login");
//           CoolAlert.show(
//             context: context,
//             type: CoolAlertType.success,
//             text: 'Transaction completed successfully!',
//             // autoCloseDuration: const Duration(seconds: 5),
//             onConfirmBtnTap: () {
//               Navigator.pushNamed(context, "/shop");
//             },
//           );
//         },
//         text: 'Checkout',
//         color: const Color(0xFFFFB200),
//         data: widget.data);
//     final double height = MediaQuery.of(context).size.height;
//     final double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: const Color(0xffE2E1E4),
//       body: CustomScrollView(
//         slivers: [
//           //sliver app bar
//           SliverAppBar(
//             backgroundColor: const Color(0xffE2E1E4),
//             leading: const Icon(
//               Icons.chevron_left,
//               size: 30,
//             ),
//             expandedHeight: height * 0.54,
//             pinned: true,
//             // elevation: 0,

//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                 color: const Color(0xffE2E1E4),
//                 child: Image.network(widget.data.gambarBarang),
//               ),
//               centerTitle: true,
//             ),
//           ),

//           //sliver items
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   height: height * 0.4,
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 28, vertical: 30),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               widget.data.nameBarang,
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "Poppins",
//                                   color: Color(0xffFFB200)),
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   width: 100,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     border: Border.all(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       InkWell(
//                                         onTap: _decrementCount,
//                                         child: Container(
//                                           child: const Icon(
//                                             Icons.remove,
//                                             size: 18,
//                                           ),
//                                         ),
//                                       ),
//                                       Text(
//                                         "$_count",
//                                         style: const TextStyle(fontSize: 14),
//                                       ),
//                                       InkWell(
//                                         onTap: _incrementCount,
//                                         child: Container(
//                                           child: const Icon(
//                                             Icons.add,
//                                             size: 18,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         Text(
//                           widget.data.asalBarang,
//                           style: TextStyle(color: Color(0xffFFCB42)),
//                         ),
//                         SizedBox(
//                           height: height * 0.10,
//                         ),
//                         const SizedBox(
//                           height: 40,
//                         ),
//                         successAlert,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _buildButton(
//     {VoidCallback? onTap,
//     required String text,
//     Color? color,
//     required Shops data}) {
//   return MaterialButton(
//     color: color,
//     minWidth: double.infinity,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20.0),
//     ),
//     onPressed: onTap,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 24),
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 child: SvgPicture.asset(
//                   "assets/icon/basket-shopping-solid.svg",
//                   width: 26,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 text,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontFamily: "Poppins",
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 50),
//                 child: const Text(
//                   "|",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 25),
//                 ),
//               ),
//               Text(
//                 data.hargaBarang,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18),
//               )
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_shop/model/shopsData.dart';
import 'package:my_shop/service/shopsService.dart';
import 'package:my_shop/main.dart';

class DetailPage extends StatefulWidget {
  final Shops data;

  DetailPage({required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final successAlert = _buildButton(
        onTap: () {
          // Navigator.pushNamed(context, "/login");
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: 'Transaction completed successfully!',
            // autoCloseDuration: const Duration(seconds: 5),
            onConfirmBtnTap: () {
              Navigator.pushNamed(context, "/shop");
            },
          );
        },
        text: 'Checkout',
        color: const Color(0xffFFB200),
        data: widget.data);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: CustomScrollView(
        slivers: [
          //sliver app bar
          SliverAppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/shop");
              },
              child: const Icon(
                Icons.chevron_left,
                size: 35,
                color: Colors.black,
              ),
            ),
            expandedHeight: height * 0.5,
            pinned: true,
            // elevation: 0,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color.fromARGB(255, 245, 245, 245),
                child: Image.asset(widget.data.gambarBarang),
              ),
              centerTitle: true,
            ),
          ),

          //sliver items
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: height * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.data.nameBarang,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins"),
                          ),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: 110,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: const Color(0xffFFF0CD)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: _decrementCount,
                                      child: Container(
                                        child: const Icon(Icons.remove,
                                            size: 16, color: Color(0xffFFB200)),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 40,
                                        child: Text(
                                          "$_count",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xffFFB200)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: _incrementCount,
                                      child: Container(
                                        child: const Icon(Icons.add,
                                            size: 16, color: Color(0xffFFB200)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        widget.data.asalBarang,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      successAlert,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildButton(
    {VoidCallback? onTap,
    required String text,
    Color? color,
    required Shops data}) {
  return MaterialButton(
    color: color,
    minWidth: double.infinity,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    onPressed: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(
                  "assets/icon/basket-shopping-solid.svg",
                  width: 26,
                  color: Colors.white,
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "|",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
              Text(
                data.hargaBarang,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )
            ],
          )
        ],
      ),
    ),
  );
}
