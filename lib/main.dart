import 'package:appmania/info_page.dart';
import 'package:appmania/likedProducts.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        'second': (context) => infoPage(),
        'third': (context) => cartPage(),
        'four': (context) => favPage(),
      },
    ),
  );
}
