import 'package:componentkit/code_view/code_view.dart';
import 'package:componentkit/home_screen.dart';
import 'package:componentkit/lec2.dart';
import 'package:componentkit/lec3.dart';
import 'package:componentkit/lec4.dart';
import 'package:componentkit/lec5.dart';
import 'package:componentkit/lec5part2.dart';
import 'package:componentkit/lec6.dart';
import 'package:componentkit/lec7.dart';
import 'package:componentkit/lec8.dart';
import 'package:componentkit/lec9.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lec8part2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHelper.init();

  runApp(
    SafeArea(
      top: false,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          Lec2.path: (context) => CodeView(path: Lec2.path, child: Lec2()),
          Lec3.path: (context) => CodeView(path: Lec3.path, child: Lec3()),
          Lec4.path: (context) => CodeView(path: Lec4.path, child: Lec4()),
          Lec5.path: (context) => CodeView(path: Lec5.path, child: Lec5()),
          Lec5part2.path: (context) => CodeView(
                path: Lec5part2.path,
                loadPath: 'lib/lec5part2.dart',
                child: Lec5part2(),
              ),
          Lec6.path: (context) => CodeView(path: Lec6.path, child: Lec6()),
          Lec7.path: (context) => CodeView(path: Lec7.path, child: Lec7()),
          Lec8.path: (context) => CodeView(path: Lec8.path, child: Lec8()),
          Lec8part2.path: (context) => CodeView(
                path: Lec8part2.path,
                loadPath: 'lib/lec8part2.dart',
                child: Lec8part2(),
              ),
          Lec9.path: (context) => CodeView(path: Lec9.path, child: Lec9()),
        },
      ),
    ),
  );
}
