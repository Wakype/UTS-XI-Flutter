// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'model/shopsData.dart';
import 'service/shopsService.dart';

class SearchPage extends StatefulWidget {
  final String keyword;

  SearchPage({required this.keyword});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Shops> dataShops = [];
  List<Shops> dataSearch = [];
  TextEditingController search = TextEditingController();

  void getShopsData() {
    FoodService().getData().then((value) {
      setState(() {
        dataShops = value;
      });
    });
  }

  @override
  void initState() {
    getShopsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                          controller: search,
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
                            Navigator.pushNamed(context, '/searchPage',
                                arguments: search.text);
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
              Column(
                children: [
                  Wrap(
                      spacing: MediaQuery.of(context).size.width * 0.05,
                      children: List.generate(dataSearch.length, (index) {
                        return ShopList(context, dataSearch[index], 0xffFFB200);
                      })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Feature(
    String kata, IconData icon, int color, int iconColor, int bgColor) {
  return Column(
    children: [
      Container(
        width: 85,
        height: 100,
        margin: EdgeInsets.only(left: 7, right: 10, bottom: 15),
        decoration: BoxDecoration(
          color: Color(bgColor),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(color),
          ),
          // color: Color(color),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromARGB(255, 0, 0, 0),
          //     // blurRadius: 5,
          //     offset: Offset(8, 10), // Shadow position
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Color(iconColor),
              size: 30,
            ),
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              kata,
              style: TextStyle(
                  color: Color(iconColor),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            )),
          ],
        ),
      ),
    ],
  );
}

Widget ShopList(context, Shops data, int color) {
  return Container(
    child: Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/detailEat', arguments: data);
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: DecorationImage(
                      image: NetworkImage(
                        data.gambarBarang,
                      ),
                      fit: BoxFit.contain,
                    ),
                    color: Color(0xff277BC0)),
              ),
              Container(
                width: 200,
                height: 130,
                decoration: BoxDecoration(
                  color: Color(0xff277BC0),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Text(
                        data.nameBarang,
                        style: TextStyle(
                          color: Color(color),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        data.asalBarang,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.hargaBarang,
                            style: TextStyle(
                                color: Color(color),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.bookmark_outline,
                            color: Color(color),
                            size: 30,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
