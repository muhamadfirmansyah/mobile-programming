import 'dart:convert';
import 'package:tugas_flutter/helpers/api.dart';
import 'package:tugas_flutter/helpers/api_url.dart';
import 'package:tugas_flutter/model/registrasimodel.dart';

class RegistrasiBloc {
  static Future<RegistrasiModel> registrasi(
      {String? nama, String? email, String? password}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = {"nama": nama, "email": email, "password": password};

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return RegistrasiModel.fromJson(jsonObj);
  }
}
