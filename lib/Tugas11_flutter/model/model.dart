import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Anggota {
  final String nama;
  final String umur;
  final String kota;
  Anggota({required this.nama, required this.umur, required this.kota});

  // DataKomunitas({ required this.nama, required this.umur});

  // DataKomunitas({this.id, required this.nama, required this.umur});

  // Map<String, dynamic> toMap() {
  //   return {'id': id, 'nama': nama, 'umur': umur};
  // }

  // factory DataKomunitas.fromMap(Map<String, dynamic> map) {
  //   return DataKomunitas(id: map['id'], nama: map['nama'], umur: map['umur']);
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': nama, 'umur': umur, 'kota': kota};
  }

  factory Anggota.fromMap(Map<String, dynamic> map) {
    return Anggota(
      nama: map['name'] as String,
      umur: map['umur'] as String,
      kota: map['kota'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Anggota.fromJson(String source) =>
      Anggota.fromMap(json.decode(source) as Map<String, dynamic>);
}
