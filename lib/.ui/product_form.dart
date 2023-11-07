import 'package:flutter/material.dart';
import 'package:tugas_flutter/.ui/product_detail.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textBoxKodeProduk(),
            _textBoxNamaProduk(),
            _textBoxHargaProduk(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  Widget _textBoxKodeProduk() {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Kode produk",
        labelText: "Kode Produk",
      ),
      controller: _kodeProdukTextboxController,
    );
  }

  Widget _textBoxNamaProduk() {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Nama produk",
        labelText: "Nama Produk",
      ),
      controller: _namaProdukTextboxController,
    );
  }

  Widget _textBoxHargaProduk() {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Harga produk",
        labelText: "Harga Produk",
      ),
      controller: _hargaProdukTextboxController,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String kodeProduk = _kodeProdukTextboxController.text;
        String namaProduk = _namaProdukTextboxController.text;
        int harga = int.tryParse(
          _hargaProdukTextboxController.text,
        ) ?? 0;

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetail(
            kodeProduk: kodeProduk,
            namaProduk: namaProduk,
            harga: harga,
          ),
        ));
      },
      child: const Text('Simpan'),
    );
  }
}
