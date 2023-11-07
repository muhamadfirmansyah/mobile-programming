class ProdukModel {
  int? id;
  String? kodeproduk;
  String? namaproduk;
  int? hargaproduk;

  ProdukModel({this.id, this.kodeproduk, this.namaproduk, this.hargaproduk});

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      id: json['id'],
      kodeproduk: json['kodeproduk'],
      namaproduk: json['namaproduk'],
      hargaproduk: json['hargaproduk'],
    );
  }
}
