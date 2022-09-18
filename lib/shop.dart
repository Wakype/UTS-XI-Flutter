// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 20, top: 25),
                      width: MediaQuery.of(context).size.width * 0.550,
                      child: TextField(
                        // textAlign: TextAlign.right,
                        // controller: search,
                        decoration: InputDecoration(
                            hintText: "VGA RTX 3050 Ti...",
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color(0xffFFB200),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                color: Color(0xffFFB200),
                              ),
                            )),
                        onSubmitted: (value) {
                          // Navigator.pushNamed(context, '/searchPage',
                          //     arguments: search.text);
                        },
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 25, bottom: 20),
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color(0xffFFB200),
                        )),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 25,
                      color: Color(0xffFFB200),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, bottom: 20),
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color(0xffFFB200),
                        )),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 25,
                      color: Color(0xffFFB200),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Feature("Food", Icons.restaurant, 0xff277BC0),
                    Feature("Life Style", Icons.checkroom, 0xffFFB200),
                    Feature("Furniture", Icons.table_bar, 0xffFFB200),
                    Feature("Electronic", Icons.desktop_windows, 0xffFFB200),
                    Feature("Toy", Icons.smart_toy, 0xffFFB200),
                    Feature("Sport", Icons.sports_basketball, 0xffFFB200),
                  ],
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

Widget Feature(String kata, IconData icon, int color) {
  return Column(
    children: [
      Container(
        width: 85,
        height: 100,
        margin: EdgeInsets.only(left: 7, right: 7, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(color),
          boxShadow: [
            BoxShadow(
              color: Color(0xff9C9EFE),
              blurRadius: 5,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              kata,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            )),
          ],
        ),
      ),
    ],
  );
}
