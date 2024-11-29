import 'package:flutter/material.dart';
import 'package:hello_world/product.dart';

class PageB extends StatelessWidget {
  const PageB({this.product, super.key});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page B')),
      body: _PageB(
        product: product,
      ),
    );
  }
}

class _PageB extends StatelessWidget {
  const _PageB({this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    addStock(product);
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
          onPressed: () => {Navigator.pop(context, product)},
          child: const Text('回首頁')),
      Text('${product!.name}'),
      Text('${product!.desc}'),
      Text('${product!.price}'),
      Text('${product!.stock}')
    ]));
  }
}

void addStock(Product? product) {
  if (product == null) return;
  product.stock = product.stock! - 1;
}
