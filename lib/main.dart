import 'package:componentkit/home_screen.dart';
import 'package:componentkit/lec2.dart';
import 'package:componentkit/lec_3.dart';
import 'package:componentkit/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => HomeScreen(), Lec2.routeName: (context) => Lec2(), Lec3.routeName: (context) => Lec3(), Test.routeName: (context) => Test()},
    ),
  );
}
