import 'package:flutter/material.dart';

class ProductSearchScreen  extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const ProductSearchScreen({super.key ,required this.products});

  @override

  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
  
}
class _ProductSearchScreenState extends State<ProductSearchScreen> {
  String query ='';

  @override

  Widget build(BuildContext context){
    //Filter Product based on search text
    final filteredProducts = widget.products
        .where((product) =>
            product['name'].toLowerCase().contains(query.toLowerCase()))
    .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Products"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
              labelText: 'search',
              border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  query= value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
            ? const Center(
              child: Text(
                "No Product found",
                style: TextStyle(fontSize: 18),
              ),
            )
            :ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(product['image']),
                  ),
                );
              },
            ),
          ),
              ],
      ),
    );
  }
}