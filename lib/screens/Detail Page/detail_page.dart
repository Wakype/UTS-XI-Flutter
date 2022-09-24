import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

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
            Navigator.pushNamed(context, "/home");
          },
        );
      },
      text: 'Checkout',
      color: const Color(0xffFFB200),
    );
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
                Navigator.pushNamed(context, "/login");
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
                child: Image.asset('assets/image/logo.png'),
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
                          const Text(
                            "Fresh Mango Juice",
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
                      const Text(
                        "Bogor",
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

Widget _buildButton({VoidCallback? onTap, required String text, Color? color}) {
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
              const Text(
                "Rp 79.00",
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
