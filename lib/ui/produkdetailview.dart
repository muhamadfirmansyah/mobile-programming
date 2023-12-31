import 'package:flutter/material.dart';
import 'package:tugas_flutter/bloc/produk_bloc.dart';
import 'package:tugas_flutter/model/produkmodel.dart';
import 'package:tugas_flutter/ui/produkview.dart';
import 'package:tugas_flutter/ui/produkviewlist.dart';
import 'package:tugas_flutter/widget/warning_dialog.dart';

// ignore: must_be_immutable
class ProdukDetailView extends StatefulWidget {
  ProdukModel? produk;

  ProdukDetailView({Key? key, this.produk}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProdukDetailViewState createState() => _ProdukDetailViewState();
}

class _ProdukDetailViewState extends State<ProdukDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                'https://miro.medium.com/v2/resize:fit:640/format:webp/0*ObJbOfJnx4QIPUq9.png'),
            Text(
              "Kode : ${widget.produk!.kodeproduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk!.namaproduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk!.hargaproduk.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Tombol Edit
        OutlinedButton(
            child: const Text("EDIT"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProdukView(
                            produk: widget.produk!,
                          )));
            }),
        //Tombol Hapus
        OutlinedButton(
            child: const Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        //tombol hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            delete();
          },
        ),
        //tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  delete() {
    ProdukBloc.deleteProduk(id: widget.produk!.id).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukViewList()));
    }, onError: (error) {
      // ignore: avoid_print
      print(error);
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Permintaan hapus data gagal, silahkan coba lagi",
              ));
    });
  }
}
