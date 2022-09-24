// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'model/shopsData.dart';
import 'service/shopsService.dart';
import 'searchPage.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<Shops> dataShops = [];
  TextEditingController search = TextEditingController();

  void getShopsData() {
    ShopService().getData().then((value) {
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Feature("Food", Icons.restaurant, 0xff277BC0, 0xffffffff,
                          0xff277BC0),
                      Feature("Life Style", Icons.checkroom, 0xffFFB200,
                          0xffFFB200, 0xffffffff),
                      Feature("Furniture", Icons.table_bar, 0xffFFB200,
                          0xffFFB200, 0xffffffff),
                      Feature("Electronic", Icons.desktop_windows, 0xffFFB200,
                          0xffFFB200, 0xffffffff),
                      Feature("Toy", Icons.smart_toy, 0xffFFB200, 0xffFFB200,
                          0xffffffff),
                      Feature("Sport", Icons.sports_basketball, 0xffFFB200,
                          0xffFFB200, 0xffffffff),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            width: 430,
                            height: 200,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.indigo,
                                      Colors.blueGrey,
                                    ],
                                    stops: [
                                      0.3,
                                      0.7
                                    ]),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://png.pngtree.com/thumb_back/fh260/background/20190828/pngtree-dark-vector-abstract-background-image_302715.jpg'),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'DISCOUNT UP TO 50% !!!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: 430,
                            height: 200,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [Colors.yellow, Colors.blueGrey],
                                    stops: [0.2, 0.8]),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://w0.peakpx.com/wallpaper/357/610/HD-wallpaper-blue-yellow-abstraction-creative-background-blue-abstract-background-geometric-backgrounds.jpg'),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 200,
                                child: Text(
                                  'PROMO RAMADHAN, DISCOUNT UP TO 80% !!!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 25),
                            width: 430,
                            height: 200,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.blueGrey,
                                      Colors.deepPurple
                                    ],
                                    stops: [
                                      0.3,
                                      0.8
                                    ]),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://png.pngtree.com/thumb_back/fh260/background/20201016/pngtree-abstract-background-design-green-abstract-background-design-line-art-background-design-image_419710.jpg'),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 250,
                                child: Text(
                                  '17TH AUGUST PROMO! BUY 1 GET 2 FOR ALL OUTFIT !!!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Wrap(
                      spacing: MediaQuery.of(context).size.width * 0.05,
                      children: List.generate(dataShops.length, (index) {
                        return ShopList(context, dataShops[index], 0xffFFB200);
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
          boxShadow: [
            BoxShadow(
              color: Color(0xffFFF4CF).withOpacity(0.7),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Color(bgColor),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(color),
          ),
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
