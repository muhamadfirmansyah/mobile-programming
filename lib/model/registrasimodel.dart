class RegistrasiModel {
  int? code;
  bool? status;
  String? data;

  RegistrasiModel({this.code, this.status, this.data});

  factory RegistrasiModel.fromJson(Map<String, dynamic> json) {
    return RegistrasiModel(
      code: json['code'],
      status: json['status'],
      data: json['data'],
    );
  }
}
