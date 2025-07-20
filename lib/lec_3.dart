import 'package:flutter/material.dart';

class Lec3 extends StatefulWidget {
  static const String routeName = '/lec3';
  const Lec3({super.key});

  @override
  State<Lec3> createState() => _Lec3State();
}

class _Lec3State extends State<Lec3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,

      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.amber,
        elevation: 20,
        title: const Text('Scaffold Properties'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        actions: [IconButton(icon: const Icon(Icons.info_outline), onPressed: () {})],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(alignment: Alignment.centerRight, child: Text('data')),
          Text('data'),
          Text('data'),
          Text('data'),
        ],
      ),
      // GridView.count(crossAxisCount: 2, crossAxisSpacing: 5, children: [Card(), Placeholder(), Placeholder()]),
      // Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [const Text('This is the body of the Scaffold.', style: TextStyle(fontSize: 18), textAlign: TextAlign.center)],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text('Drawer Header', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(leading: const Icon(Icons.home), title: const Text('Home'), onTap: () {}),
            ListTile(leading: const Icon(Icons.settings), title: const Text('Settings')),
          ],
        ),
      ),
    );
  }
}
