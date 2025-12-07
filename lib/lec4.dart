import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Lec4 extends StatelessWidget {
  static const path = '/lec4';
  const Lec4({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          Text('Asset Image'),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 170,
            child: Image.asset(
              'assets/test.jpeg',
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Icon(Icons.error));
              },
            ),
          ),
          Text('Network Image'),
          Image.network(
            "https://images.unsplash.com/photo-1626808642875-0aa545482dfb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Icon(Icons.error));
            },
          ),
          Divider(),
          Text('Buttons'),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                elevation: 40,
                // fixedSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onLongPress: () {
                print('Elevated Button Long Pressed');
              },
              onPressed: () {
                print('Elevated Button Clicked');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.touch_app),
                  Text('Click here'),
                ],
              )),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: Text('data')),
          OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
          TextButton(onPressed: () {}, child: Text('Text Button')),
          IconButton(
              onPressed: () async {
                LocationPermission result =
                    await Geolocator.requestPermission();
                if (result == LocationPermission.whileInUse) {
                  print(await Geolocator.getCurrentPosition());
                }
              },
              icon: Icon(Icons.location_on)),
          GestureDetector(
            onTap: () {
              print('GestureDetector tapped');
            },
            child: Container(
              color: Colors.amber,
              width: 200,
              height: 200,
            ),
          ),
          InkWell(
            onTap: () {
              print('InkWell tapped');
            },
            child: Container(
              color: Colors.teal,
              width: 200,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}
