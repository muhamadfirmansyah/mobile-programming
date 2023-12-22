import 'package:flutter/material.dart';
import 'package:tugas_flutter/bloc/logout_bloc.dart';
import 'package:tugas_flutter/bloc/produk_bloc.dart';
import 'package:tugas_flutter/model/produkmodel.dart';
import 'package:tugas_flutter/ui/ProdukDetailView.dart';
import 'package:tugas_flutter/ui/loginview.dart';
import 'package:tugas_flutter/ui/produkview.dart';

class ProdukViewList extends StatefulWidget {
  const ProdukViewList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProdukViewListState createState() => _ProdukViewListState();
}

class _ProdukViewListState extends State<ProdukViewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: const Icon(Icons.add, size: 26.0),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProdukView()));
                },
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // children: [
          //   ListTile(
          //     title: const Text('Logout'),
          //     trailing: const Icon(Icons.logout),
          //     onTap: () async {
          //       await LogoutBloc.logout().then(
          //         (value) => Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const LoginView(),
          //           ),
          //         ),
          //       );
          //     },
          //   )
          // ],
          children: [
            const UserAccountsDrawerHeader(
              //membuat gambar profil
              currentAccountPicture: Image(image: AssetImage("profile.png")),
              //membuat nama akun
              accountName: Text("Sahretech"),
              //membuat nama email
              accountEmail: Text("User: "),
              //memberikan background
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("universitas-mercu-buana-logo.jpg"),
                      fit: BoxFit.cover)),
            ),
            //membuat list menu
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Beranda"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Pegawai"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text("Transaksi"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.emoji_emotions),
              title: const Text("Profil"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Tentang"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await LogoutBloc.logout().then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List>(
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          // ignore: avoid_print
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return const Center(
              child: Text('Error Connection'),
            );
          }

          return snapshot.hasData
              ? ListProduk(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListProduk extends StatelessWidget {
  final List? list;

  const ListProduk({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemProduk(
            produk: list![i],
          );
        });
  }
}

class ItemProduk extends StatelessWidget {
  final ProdukModel produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetailView(
                      produk: produk,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaproduk!),
          subtitle: Text(produk.hargaproduk.toString()),
        ),
      ),
    );
  }
}
