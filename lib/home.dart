import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool tapped = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              color: Colors.black,
            ),
            Text(
              'Surat City',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 250),
            Icon(
              CupertinoIcons.line_horizontal_3_decrease,
              color: Colors.black,
              size: 29,
            ),
          ],
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: const Text.rich(
              TextSpan(
                text: 'Find The ',
                style: TextStyle(
                  fontSize: 45,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Best\n',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Food',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' Around You\n',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            width: 350,
            padding: const EdgeInsets.all(15),
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color(0xfff4f4f4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: Colors.black87,
                ),
                SizedBox(width: 10),
                Text("Search your favourit food"),
                SizedBox(width: 80),
                Icon(CupertinoIcons.slider_horizontal_3),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 40, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Find',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '  5km>',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      ActionChip(
                        label: Text(
                          'salads',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ActionChip(
                        label: Text(
                          'salads',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ActionChip(
                        label: Text(
                          'salads',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 174,
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        height: 270,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              24,
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black12,
                              Colors.white,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 174,
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        height: 270,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              24,
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black12,
                              Colors.white,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 174,
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        height: 270,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              24,
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black12,
                              Colors.white,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
