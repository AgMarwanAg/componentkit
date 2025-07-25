import 'package:componentkit/code_view/code_view.dart';
import 'package:componentkit/home_screen.dart';
import 'package:componentkit/lec2.dart';
import 'package:componentkit/lec3.dart';
import 'package:componentkit/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        Lec2.path: (context) => CodeView(child: Lec2(), path: Lec2.path),
        Lec3.path: (context) => CodeView(child: Lec3(), path: Lec3.path),
        // Test.routeName: (context) => Test(),
      },
    ),
  );
}
