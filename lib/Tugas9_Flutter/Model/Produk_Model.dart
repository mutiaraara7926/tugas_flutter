// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ProdukModel {
  final String nama;
  final int price;
  final Color warna;
  ProdukModel({required this.nama, required this.price, required this.warna});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'price': price,
      'warna': warna.value,
    };
  }

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      nama: map['nama'] as String,
      price: map['price'] as int,
      warna: Color(map['warna'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdukModel.fromJson(String source) =>
      ProdukModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProdukModel copyWith({String? nama, int? price, Color? warna}) {
    return ProdukModel(
      nama: nama ?? this.nama,
      price: price ?? this.price,
      warna: warna ?? this.warna,
    );
  }

  @override
  String toString() => 'ProdukModel(nama: $nama, price: $price, warna: $warna)';

  @override
  bool operator ==(covariant ProdukModel other) {
    if (identical(this, other)) return true;

    return other.nama == nama && other.price == price && other.warna == warna;
  }

  @override
  int get hashCode => nama.hashCode ^ price.hashCode ^ warna.hashCode;
}
