import 'package:componentkit/lec2.dart';
import 'package:componentkit/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(routes: {'/': (context) => Test(), Test.routeName: (context) => Test()}));
}
