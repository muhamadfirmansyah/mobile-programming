import 'dart:convert';
import 'package:tugas_flutter/helpers/api.dart';
import 'package:tugas_flutter/helpers/api_url.dart';
import 'package:tugas_flutter/model/loginmodel.dart';

class LoginBloc {
  static Future<LoginModel> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"email": email, "password": password};
    //var response = await Api().post(apiUrl, body);
    var response = await Api().post(apiUrl, body);

    //var jsonObj = json.decode(response.body);
    var jsonObj = jsonDecode(response.body);

    //var jsonObj = json.encode(response.body);
    return LoginModel.fromJson(jsonObj);
  }
}
