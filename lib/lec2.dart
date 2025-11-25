import 'package:componentkit/code_view/code_view.dart';
import 'package:flutter/material.dart';

class Lec2 extends StatelessWidget {
  static const String path = '/lec2';
  const Lec2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Core Widgets'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to the Widget Explorer!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    letterSpacing: 1.2,
                    decoration: TextDecoration.underline,
                    // backgroundColor: Colors.blueAccent,
                    decorationStyle: TextDecorationStyle.dotted,
                    shadows: [Shadow(color: Colors.red, offset: Offset(2.0, 2.0), blurRadius: 10)]),
              ),
              const SizedBox(height: 20),
              const Text('6. Container:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.amber.shade200, Colors.amber.shade500], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 3, blurRadius: 7, offset: const Offset(0, 3))],
                ),
                child: const Text("This is a styled Container."),
              ),
              const SizedBox(height: 20),
              // ---------------- Expanded Example ----------------
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(8),
                child: const Text("Expanded: Forces widget to fill remaining space", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Container(width: 80, color: Colors.red),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: Text('this is expanded widget', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ---------------- Flexible Example ----------------
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(8),
                child: const Text("Flexible: Lets widget grow but keeps natural size if possible", style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Container(width: 80, color: Colors.green),
                    Flexible(
                      child: Container(
                        color: Colors.orange,
                        child: Text('this is long text to test flexible widget and shows the text in multiple lines', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
              const Text('8. Stack, Positioned & Align:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(width: double.infinity, height: 150, color: Colors.grey.shade300),
                  const Positioned(top: 10, left: 10, child: Text("Positioned")),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(padding: EdgeInsets.all(8.0), child: Text("Align")),
                  ),
                  const Center(child: Icon(Icons.star, color: Colors.yellow, size: 50)),
                  Positioned(
                    bottom: -20,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.red,
                      child: const Text('Clipped', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text('10. Card:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Card(
                elevation: 8.0,
                color: Colors.blueGrey.shade50,
                margin: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: const BorderSide(color: Colors.blueGrey, width: 1),
                ),
                child: const Padding(padding: EdgeInsets.all(16.0), child: Text("This is a styled Card.")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
