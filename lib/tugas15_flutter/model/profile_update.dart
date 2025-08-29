// To parse this JSON data, do
//
//     final profileUpdate = profileUpdateFromJson(jsonString);

import 'dart:convert';

ProfileUpdate profileUpdateFromJson(String str) =>
    ProfileUpdate.fromJson(json.decode(str));

String profileUpdateToJson(ProfileUpdate data) => json.encode(data.toJson());

class ProfileUpdate {
  final String message;
  final Data data;

  ProfileUpdate({required this.message, required this.data});

  factory ProfileUpdate.fromJson(Map<String, dynamic> json) => ProfileUpdate(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class Data {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
