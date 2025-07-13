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
      body: CodeView(code: sampleCode,screen: Lec2(),));
  }
}

String sampleCode = '''
class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  int x =10;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light grey background
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFF8F9FA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // TODO: Implement navigation logic
          },
        ),
        title: const Text(
          'Flutter Components',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const _SectionHeader(title: 'Layout Components'),
          _buildComponentGrid(_layoutComponents),
          const SizedBox(height: 16.0),
          const _SectionHeader(title: 'List and Grid Components'),
          _buildComponentGrid(_listAndGridComponents),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }

  Widget _buildComponentGrid(List<Map<String, dynamic>> components) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      children: components.map((component) {
        return _ComponentButton(
          icon: component['icon'] as IconData,
          label: component['label'] as String,
          onPressed: () {
            // TODO: Handle button tap
            print('\${component['label']} tapped');
          },
        );
      }).toList(),
    );
  }
}''';
