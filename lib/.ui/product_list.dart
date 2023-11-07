import 'package:flutter/material.dart';
import 'package:tugas_flutter/.ui/product_form.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProductForm();
              }));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text('Product 1'),
              subtitle: Text('Price: \$100'),
              onTap: null,
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Product 2'),
              subtitle: Text('Price: \$130'),
              onTap: null,
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Product 3'),
              subtitle: Text('Price: \$10'),
              onTap: null,
            ),
          ),
        ],
      ),
    );
  }
}
