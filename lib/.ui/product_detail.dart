import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ProductDetail({Key? key, this.kodeProduk, this.namaProduk, this.harga})
      : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Column(
        children: [
          Text('Kode Produk: ${widget.kodeProduk}'),
          Text('Nama Produk: ${widget.namaProduk}'),
          Text('Harga Produk: ${widget.harga}')
        ],
      ),
    );
  }
}
