import 'package:componentkit/code_view/code_view.dart';
import 'package:componentkit/home_screen.dart';
import 'package:componentkit/lec2.dart';
import 'package:componentkit/lec3.dart';
import 'package:componentkit/lec4.dart';
 import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        Lec2.path: (context) => CodeView(path: Lec2.path, child: Lec2()),
        Lec3.path: (context) => CodeView(path: Lec3.path, child: Lec3()),
        Lec4.path: (context) => CodeView(path: Lec4.path, child: Lec4()),
        // Test.routeName: (context) => Test(),
      },
    ),
  );
}
