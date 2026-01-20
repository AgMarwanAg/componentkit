import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Lec8part2 extends StatefulWidget {
  static const String path = '/lec8-part2';

  const Lec8part2({super.key});

  @override
  State<Lec8part2> createState() => _Lec8part2State();
}

class _Lec8part2State extends State<Lec8part2> {
    ApiHelper apiHelper = ApiHelper();
  List products = [];
  String? error;
  getAllProducts() async {
    final response = await apiHelper.get('https://fakestoreapi.com/products');
    if (response is List) {
      products = response;
    } else {
      error = response.toString();
    }
    setState(() {});
  }

  @override
  void initState() {
    getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Builder(
        builder: (context) {
          if (products.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.network(
                            product['image'],
                            width: double.infinity,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${product['price']}',
                              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star, size: 16, color: Colors.orange),
                                const SizedBox(width: 4),
                                Text('${product['rating']['rate']} (${product['rating']['count']})', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (error != null) {
            return Center(child: Text(error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


class ApiHelper {
  var client = Client();

  Future<dynamic> get(String url) async {
    try {
      final response = await client.get(Uri.parse(url));
      return json.decode(response.body);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.post(Uri.parse(url), headers: {'Content-Type': 'application/json'}, body: body != null ? json.encode(body) : null);
      return json.decode(response.body);
    } catch (e) {
      return e.toString();
    }
  }
}

