import 'package:flutter/material.dart';

class Lec3 extends StatelessWidget {
  static const String path = '/lec3';

  const Lec3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Text('scaffold Properties'),
        // leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.arrow_back),
          Icon(Icons.arrow_back),
        ],
      ),
      drawer: HomeDrawerWidget(),
      endDrawer: HomeDrawerWidget(),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen2()),
            );
          },
          child: Text('go to screen2'),
        ),
      ),
    );
  }
}

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: 300,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.redAccent,
            child: Text('hello '),
          ),
          ListTile(
            title: Text('title'),
            subtitle: Text('subtitle'),
            leading: Icon(Icons.arrow_back),
            trailing: Icon(Icons.ac_unit_rounded),
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('screen2')),
      body: Center(child: Text('hello user')),
    );
  }
}
