import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_3/tugas14fluttter/model/user_model.dart';

Future<List<Result>> getUser() async {
  final response = await http.get(
    Uri.parse("https://rickandmortyapi.com/api/character?page=2"),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body)["results"];
    return userJson.map((json) => Result.fromJson(json)).toList();
  } else {
    throw Exception("Gagal memuat data");
  }
}
