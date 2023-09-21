import 'package:appmania/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class infoPage extends StatefulWidget {
  const infoPage({super.key});

  @override
  State<infoPage> createState() => _infoPageState();
}

class _infoPageState extends State<infoPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6cd551),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed('four', arguments: data);
              });
            },
            icon: const Icon(CupertinoIcons.suit_heart),
          ),
        ],
      ),
      backgroundColor: const Color(0xff6cd551),
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 600,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Column(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 150),
                        Container(
                          height: 35,
                          width: 110,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff6cd551),
                                blurRadius: 10,
                              ),
                            ],
                            color: Colors.green,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    (data['qty'] > 1)
                                        ? data['qty']--
                                        : data['qty'] = 1;
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${data['qty']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    data['qty']++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 70),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data['title']}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                              Text(
                                "${data['description']}",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        const SizedBox(height: 30),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("⭐️4.4"),
                            Text("🔥100 cal"),
                            Text("⏰20min"),
                          ],
                        ),
                        const SizedBox(height: 60),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Global.cartProducts.add(data);
                              Global.totalPrice += data['price'];
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Global.cartProducts.add(data);
                                Global.totalPrice = Global.TotalPrice();
                              });
                            },
                            child: Container(
                              width: 360,
                              height: 70,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff6cd551),
                                    blurRadius: 10,
                                  ),
                                ],
                                color: Color(0xff6cd551),
                              ),
                              child: Center(
                                child: const Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.9),
              child: CircleAvatar(
                radius: 130,
                backgroundColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      const BoxShadow(color: Color(0xff6cd551), blurRadius: 50),
                    ],
                    image: DecorationImage(
                      image: NetworkImage('${data['thumbnail']}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
