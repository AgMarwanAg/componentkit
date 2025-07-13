import 'package:componentkit/code_view/code_view.dart';
import 'package:componentkit/lec2.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  static const String routeName = '/test';
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CodeView(screen: Lec2()),
    );
  }
}
