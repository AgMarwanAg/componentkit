import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Lec8part2 extends StatefulWidget {
  static const String path = '/lec8-part2';

  const Lec8part2({super.key});

  @override
  State<Lec8part2> createState() => _Lec8part2State();
}

class _Lec8part2State extends State<Lec8part2> {
  bool loading = false;
  List data = [];
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    loading = true;
    setState(() {});
    Response? result = await ApiHelper.get('https://jsonplaceholder.typicode.com/posts');
    if (result != null) {
      data = result.data;
      loading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Text(data[index]['title']);
                },
              ));
  }
}

class ApiHelper {
  static Future<Response?> get(String path) async {
    try {
      final result = await Dio().get(path);
      return result;
    } catch (e) {
      print(e);

      return null;
    }
  }

  static Future<Response?> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final result = await Dio().post(
        path,
        data: data,
      );
      return result.data;
    } catch (e) {
      print(e);

      return null;
    }
  }
}
