import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _products = [
    {
      "name": "Smartphone",
      "price": 300,
      "image": "A16F8224-F8F7-44F3-A1D5-A9A1AEC9F92D.png",
    },
    {
      "name": "Laptop",
      "price": 1200,
      "image": "R.png",
    },
    {
      "name": "Headphones",
      "price": 88,
      "image": "71YmkmW-k3L._AC_SL1500_.jpg",
    },
  ];
  final List<Map<String, dynamic>> _cart = [];

  void _addToCart(product) {
    setState(() {
      _cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${product['name']} added to cart")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(product['image']),
              title: Text(product['name']),
              subtitle: Text("\$${product['price']}"),
              trailing: ElevatedButton(
                onPressed: () => _addToCart(product),
                child: const Text("Add to Cart"),
              ),
            ),
          );
        },
      ),
    );
  }
}
