import 'package:appmania/utils/Global.dart';
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
      body: Container(
        color: const Color(0xff6cd551),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: const Color(0xff6cd551),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${data['title']}",
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
                                  backgroundColor: Colors.grey,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        (data['qty'] > 1)
                                            ? data['qty']--
                                            : data['qty'] = 1;
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
                                  "${data['qty']}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        data['qty']++;
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\$ ${data['price']}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Global.cartProducts.remove(data);

                                  Global.totalPrice -= data['price'];
                                });
                              },
                              child: const Icon(Icons.remove_circle_outline,
                                  color: Colors.red),
                            ),
                            SizedBox(width: 80),
                            Text(
                              "\$ ${data['price'] * data['qty']}",
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
  }
}
