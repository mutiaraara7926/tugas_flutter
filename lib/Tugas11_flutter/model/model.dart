import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Anggota {
  final int? id;
  final String nama;
  final String umur;
  final String kota;
  Anggota({
    this.id,
    required this.nama,
    required this.umur,
    required this.kota,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': nama,
      'umur': umur,
      'kota': kota,
    };
  }

  factory Anggota.fromMap(Map<String, dynamic> map) {
    return Anggota(
      id: map['id'] as int,
      nama: map['name'] as String,
      umur: map['umur'] as String,
      kota: map['kota'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Anggota.fromJson(String source) =>
      Anggota.fromMap(json.decode(source) as Map<String, dynamic>);
}
