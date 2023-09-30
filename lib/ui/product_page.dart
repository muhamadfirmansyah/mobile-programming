import 'package:flutter/material.dart';
import 'package:tugas_flutter/ui/product_form.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductForm()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text('Android TV Digital 32 Inch'),
              subtitle: Text('5000000'),
              onTap: null,
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Lemari Pendingin 2 Pintu - Inventor'),
              subtitle: Text('700000'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Mesin Cuci 25 kg'),
              subtitle: Text('40000000'),
            ),
          ),
        ],
      ),
    );
  }
}
