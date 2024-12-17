import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', name: 'Elma', price: 29.99),
    Product(id: '2', name: 'Muz', price: 49.99),
    Product(id: '3', name: 'Domates', price: 19.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Listesi'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} TL'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).addProduct(product);
              },
            ),
          );
        },
      ),
    );
  }
}
