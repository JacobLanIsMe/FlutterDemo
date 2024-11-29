import 'package:flutter/material.dart';

class ListviewPage extends StatelessWidget {
  ListviewPage({super.key});
  final List<Product> listItems = List<Product>.generate(500, (i) {
    return Product(name: 'Product: $i', price: 'Price: ${i * 100}');
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.add),
            title: Text('${listItems[index].name}'),
            subtitle: Text('${listItems[index].price}'),
          );
        },
        itemCount: listItems.length,
      ),
    );
  }
}

class Product {
  String? name;
  String? price;
  Product({this.name, this.price});
}
