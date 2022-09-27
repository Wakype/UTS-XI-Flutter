// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'model/shopsData.dart';
import 'service/shopsService.dart';

class NotFound extends StatefulWidget {
  final String keyword;

  NotFound({required this.keyword});

  @override
  State<NotFound> createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  List<Shops> dataShops = [];
  List<Shops> dataSearch = [];
  TextEditingController search = TextEditingController();

  void getShopsData() {
    ShopService().getData().then((value) {
      setState(() {
        dataShops = value;
        dataSearch = dataShops
            .where((element) => element.nameBarang.contains(widget.keyword))
            .toList();
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
                      children: [
                        Container(child: Text('Barang Tidak Ditemukan!'))
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ShopList(context, Shops data, int color) {
  return Container(
    child: Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/detailShop', arguments: data);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            height: 350,
            width: 200,
            decoration: BoxDecoration(
                // color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffFFF4CF).withOpacity(0.7),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                border: Border.all(width: 2, color: Color(color)),
                borderRadius: BorderRadius.all(Radius.circular(15))),
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
                      image: AssetImage(
                        data.gambarBarang,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  // height: 130,
                  decoration: BoxDecoration(
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
                            color: Color(0xffFFCB42),
                            fontSize: 16,
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
        ),
      ],
    ),
  );
}
