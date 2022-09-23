// To parse this JSON data, do
//
//     final dataShops = dataShopsFromJson(jsonString);

import 'dart:convert';

DataShops dataShopsFromJson(String str) => DataShops.fromJson(json.decode(str));

String dataShopsToJson(DataShops data) => json.encode(data.toJson());

class DataShops {
    DataShops({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<Shops> data;

    factory DataShops.fromJson(Map<String, dynamic> json) => DataShops(
        status: json["status"],
        message: json["message"],
        data: List<Shops>.from(json["data"].map((x) => Shops.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Shops {
    Shops({
        required this.idBarang,
        required this.gambarBarang,
        required this.nameBarang,
        required this.asalBarang,
        required this.hargaBarang,
        required this.penjual,
        required this.detailBarang,
    });

    int idBarang;
    String gambarBarang;
    String nameBarang;
    String asalBarang;
    String hargaBarang;
    String penjual;
    List<DetailBarang> detailBarang;

    factory Shops.fromJson(Map<String, dynamic> json) => Shops(
        idBarang: json["id_barang"],
        gambarBarang: json["gambar_barang"],
        nameBarang: json["name_barang"],
        asalBarang: json["asal_barang"],
        hargaBarang: json["harga_barang"],
        penjual: json["penjual"],
        detailBarang: List<DetailBarang>.from(json["detail_barang"].map((x) => DetailBarang.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_barang": idBarang,
        "gambar_barang": gambarBarang,
        "name_barang": nameBarang,
        "asal_barang": asalBarang,
        "harga_barang": hargaBarang,
        "penjual": penjual,
        "detail_barang": List<dynamic>.from(detailBarang.map((x) => x.toJson())),
    };
}

class DetailBarang {
    DetailBarang({
        required this.deskripsiBarang,
    });

    String deskripsiBarang;

    factory DetailBarang.fromJson(Map<String, dynamic> json) => DetailBarang(
        deskripsiBarang: json["deskripsi_barang"],
    );

    Map<String, dynamic> toJson() => {
        "deskripsi_barang": deskripsiBarang,
    };
}
