// // lib/screens/my_code_screen.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_highlight/themes/github.dart';

// import 'code_view.dart'; // Adjust the import path

// class CodeDisplayScreen extends StatelessWidget {
//   final String sampleCode;

//   const CodeDisplayScreen({super.key, required this.sampleCode});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dart Code View with Custom Theme')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Rendered Dart Code with Custom Colors:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 16),
//             // CodeView(code: sampleCode, language: 'dart', theme: customCodeTheme),
//           ],
//         ),
//       ),
//     );
//   }
// }

// final customCodeTheme = Map<String, TextStyle>.from(githubTheme)
//   ..addAll({
//     'function': githubTheme['function']?.copyWith(color: Colors.blueAccent) ?? const TextStyle(color: Colors.blueAccent),
//     'keyword': githubTheme['keyword']?.copyWith(color: Colors.purple) ?? const TextStyle(color: Colors.purple),
//     'variable': githubTheme['variable']?.copyWith(color: Colors.orange) ?? const TextStyle(color: Colors.orange),
//     'local': githubTheme['local']?.copyWith(color: Colors.orange) ?? const TextStyle(color: Colors.orange),
//     'name.variable': githubTheme['name.variable']?.copyWith(color: Colors.orange) ?? const TextStyle(color: Colors.orange),
//     'class': const TextStyle(color: Colors.teal),
//     'type': const TextStyle(color: Colors.teal),
//   });
