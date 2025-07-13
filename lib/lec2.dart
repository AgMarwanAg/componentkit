import 'package:flutter/material.dart';

class Lec2 extends StatelessWidget {
  static const String routeName = '/lec2';
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo, letterSpacing: 1.2, decoration: TextDecoration.underline),
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
              const Text('7. Row, Expanded, Flexible & Spacer:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                      child: const Center(child: Text('Expanded')),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    width: 100,
                    height: 100,
                    child: const Center(child: Text('Fixed 100px')),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Using Flexible with fit: FlexFit.loose:', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Row(
                children: [
                  Container(
                    width: 150, // Preferred width
                    color: Colors.orange,
                    height: 100,
                    child: const Center(child: Text('Flexible 150px')),
                  ),
                  Container(
                    color: Colors.grey,
                    width: 100,
                    height: 100,
                    child: const Center(child: Text('Fixed 100px')),
                  ),
                ],
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
