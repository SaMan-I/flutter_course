import 'package:flutter/material.dart';
import 'products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [
    Product(name: 'Milk', price: 23.5, kg: '1 lt'),
    Product(name: 'Sugar', price: 31.5, kg: '1 kg'),
    Product(name: 'Solt', price: 12.5, kg: '1 kg'),
    Product(name: 'Banan', price: 21.6, kg: '1 kg'),
    Product(name: 'Orange', price: 45.5, kg: '1 kg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(products[index].name),
            subtitle: Text('${products[index].price}'),
            trailing: Text(products[index].kg),
          ),
        ),
      ),
    );
  }
}
