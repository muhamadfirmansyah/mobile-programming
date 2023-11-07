import 'package:flutter/material.dart';
import 'package:tugas_flutter/helpers/user_info.dart';
import 'package:tugas_flutter/ui/loginview.dart';
import 'package:tugas_flutter/ui/produkviewlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = const ProdukViewList();
        //page = ProdukView();
        //page = const LoginView();
      });
    } else {
      setState(() {
        page = const LoginView();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko UMB',
      debugShowCheckedModeBanner: false,
      home: page,
      /* routes: {
        "/": (BuildContext context) => const LoginView(),
        "/login": (BuildContext context) => const LoginView(),
        "/register": (BuildContext context) =>const RegistrasiView(),        
        "/home": (BuildContext context) => ProdukView(),
      }, */
    );
  }
}
