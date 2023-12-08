import 'package:flutter/material.dart';
import 'package:tugas_flutter/bloc/produk_bloc.dart';
import 'package:tugas_flutter/model/produkmodel.dart';
import 'package:tugas_flutter/ui/produkviewlist.dart';
import 'package:tugas_flutter/widget/warning_dialog.dart';

// ignore: must_be_immutable
class ProdukView extends StatefulWidget {
  ProdukModel? produk;

  ProdukView({Key? key, this.produk}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProdukViewState createState() => _ProdukViewState();
}

class _ProdukViewState extends State<ProdukView> {
  final _formKey = GlobalKey<FormState>();

  // ignore: unused_field, prefer_final_fields
  bool _isLoading = false;
  String judul = "TAMBAH PRODUK";
  String tombolSubmit = "SIMPAN";

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "UBAH PRODUK";
        tombolSubmit = "UBAH";
        _kodeProdukTextboxController.text = widget.produk!.kodeproduk!;
        _namaProdukTextboxController.text = widget.produk!.namaproduk!;
        _hargaProdukTextboxController.text =
            widget.produk!.hargaproduk.toString();
      });
    } else {
      judul = "TAMBAH PRODUK";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _kodeProdukTextField(),
                _namaProdukTextField(),
                _hargaProdukTextField(),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Membuat Textbox Kode Produk
  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      keyboardType: TextInputType.text,
      controller: _kodeProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kode Produk harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Nama Produk
  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      keyboardType: TextInputType.text,
      controller: _namaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Produk harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Harga Produk
  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

//Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return OutlinedButton(
        child: Text(tombolSubmit),
        onPressed: () {
          // ignore: unused_local_variable
          var validate = _formKey.currentState!.validate();

          if (validate) {
            if (widget.produk != null) {
              ubah();
            } else {
              simpan();
            }
          }
        });
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });

    ProdukModel newProduk = ProdukModel(id: null);
    newProduk.kodeproduk = _kodeProdukTextboxController.text;
    newProduk.namaproduk = _namaProdukTextboxController.text;
    newProduk.hargaproduk = int.parse(_hargaProdukTextboxController.text);

    ProdukBloc.addProduk(produk: newProduk).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukViewList()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Permintaan simpan data gagal, silahkan coba lagi",
              ));
    });

    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });

    ProdukModel updateProduk = ProdukModel(id: null);
    updateProduk.id = widget.produk!.id;
    updateProduk.kodeproduk = _kodeProdukTextboxController.text;
    updateProduk.namaproduk = _namaProdukTextboxController.text;
    updateProduk.hargaproduk = int.parse(_hargaProdukTextboxController.text);

    ProdukBloc.updateProduk(produk: updateProduk).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukViewList()));
    }, onError: (error) {
      // ignore: avoid_print
      print(error);
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Permintaan ubah data gagal, silahkan coba lagi",
              ));
    });

    setState(() {
      _isLoading = false;
    });
  }
}
