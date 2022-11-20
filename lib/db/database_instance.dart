import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:persist_data/models/persist_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseInstance {
  final String databaseName = "persist_data.db";
  final int databaseVersion = 2;

  // Atribut di Model Transaksi
  final String namaTabel = 'kontak';
  final String id = 'id';
  final String nama = 'nama';
  final String no_hp = 'no_hp';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory databaseDirectory = await getApplicationDocumentsDirectory();
    String path = join(databaseDirectory.path, databaseName);
    print('database init');
    return openDatabase(path, version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE ${namaTabel} ($id INTEGER PRIMARY KEY, $nama TEXT NULL, $no_hp TEXT NULL)');
  }

  Future<List<PersistModel>> getAll() async {
    final data = await _database!.query(namaTabel);
    List<PersistModel> result =
        data.map((e) => PersistModel.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(namaTabel, row);
    return query;
  }
}
