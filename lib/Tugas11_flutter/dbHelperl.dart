// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:ppkd_b_3/Tugas11_flutter/model/model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> databaseHelper() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'anggota.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE anggota(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, umur TEXT, kota TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> registerAnggota(Anggota anggota) async {
    final db = await databaseHelper();
    await db.insert(
      'anggota',
      anggota.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Anggota>> getAllAnggota() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('anggota');
    return results.map((e) => Anggota.fromMap(e)).toList();
  }

  static Future<void> updateAnggota(Anggota anggota) async {
    final db = await databaseHelper();
    await db.update(
      'anggota',
      anggota.toMap(),
      where: 'id = ?',
      whereArgs: [anggota.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteUser(int id) async {
    final db = await databaseHelper();
    await db.delete('anggota', where: 'id = ?', whereArgs: [id]);
  }
}
