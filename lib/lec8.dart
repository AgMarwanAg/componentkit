import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lec8 extends StatelessWidget {
  static const String path = '/lec8';

  const Lec8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  PrefsHelper.setString('name', value);
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                String? name = PrefsHelper.getString('name');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2(name: name),
                  ),
                );
              },
              child: Text('Go to screen 2'),
            ),
            ElevatedButton(
              onPressed: () {
                PrefsHelper.remove('name');
              },
              child: Text('delete cache'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  final String? name;
  const Screen2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(name == null ? 'hello user' : 'hello $name'),
      ),
    );
  }
}

class PrefsHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // 🔹 Now getters are synchronous
  static String? getString(String key) {
    return prefs.getString(key);
  }

  static Future<bool> setString(String key, String value) {
    return prefs.setString(key, value);
  }

  static int? getInt(String key) {
    return prefs.getInt(key);
  }

  static Future<bool> setInt(String key, int value) {
    return prefs.setInt(key, value);
  }

  static bool? getBool(String key) {
    return prefs.getBool(key);
  }

  static Future<bool> setBool(String key, bool value) {
    return prefs.setBool(key, value);
  }

  static Future<bool> remove(String key) => prefs.remove(key);
  static Future<bool> clear() => prefs.clear();
}
