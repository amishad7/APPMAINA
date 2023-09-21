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
              setState(() {});
            },
            icon: const Icon(CupertinoIcons.suit_heart),
          ),
        ],
      ),
      backgroundColor: Colors.greenAccent,
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.greenAccent,
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    Container(
                      height: 25,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        color: Colors.green,
                      ),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          Text(
                            "1",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove)),
                        ],
                      ),
                    ),
                    Text(
                      "Salad",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    Text(
                      "asdfghjklkjhgfdsasdfghjkmnxcvbnmnbvsdfghjkjhgfdsrtyuhgfddfghjkjhgfdsfghjsdfghnbcvbngndgdgbsdfhbvfdhvjbafduhvbadskhjkbvhsvhdvdfvdbfvdfubvhbv",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text("4.4"),
                        Text("100 cal"),
                        Text("20min"),
                      ],
                    ),
                    Container(
                      width: 200,
                      height: 70,
                      color: Colors.green,
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
