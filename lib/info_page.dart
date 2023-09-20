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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(flex: 3, child: Container()),
            Expanded(
              flex: 7,
              child: Container(
                height: 500,
                width: 400,
                decoration: const BoxDecoration(
                  color: Color(0xfff4f4f4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
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
