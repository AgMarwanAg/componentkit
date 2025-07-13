// lib/widgets/code_view.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart'; // A default theme

class CodeView extends StatelessWidget {
  final Widget screen;

  final Map<String, TextStyle> theme;

  final double? fontSize;

  const CodeView({super.key, required this.screen, this.theme = githubTheme, this.fontSize = 14.0});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Preview'),
                Tab(text: 'Code'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  screen,
                  FutureBuilder(
                    future: rootBundle.loadString('lib/lec2.dart'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SingleChildScrollView(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: HighlightView(
                              snapshot.data!,
                              language: 'dart',
                              theme: theme,
                              textStyle: TextStyle(fontSize: fontSize, color: theme['root']?.color),
                            ),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
