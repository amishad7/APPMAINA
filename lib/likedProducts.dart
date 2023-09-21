import 'package:appmania/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favPage extends StatefulWidget {
  const favPage({super.key});

  @override
  State<favPage> createState() => _favPageState();
}

class _favPageState extends State<favPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6cd551),
        elevation: 0,
        title: const Text(
          "Favourite's",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Color(0xff6cd551),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xff6cd551),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...Global.cartProducts.map((e) {
                        return GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                Navigator.of(context).pushNamed(
                                  'second',
                                  arguments: e,
                                );
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 120,
                            width: 350,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Colors.black12,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                          NetworkImage(e['thumbnail']),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 9),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${e['title']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            (e['qty'] > 1)
                                                                ? e['qty']--
                                                                : e['qty'] = 1;
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.remove,
                                                          size: 10,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      "${e['qty']}",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(width: 10),
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            e['qty']++;
                                                            Global.totalPrice =
                                                                Global
                                                                    .TotalPrice();
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.add,
                                                          size: 10,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "\$ ${e['price']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      Global.cartProducts
                                                          .remove(e);

                                                      Global.totalPrice -=
                                                          e['price'];
                                                    });
                                                  },
                                                  child: Icon(
                                                    CupertinoIcons.heart_fill,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                SizedBox(width: 60),
                                                Text(
                                                  "\$ ${e['price'] * e['qty']}",
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
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
