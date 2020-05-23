import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DefinicionBD {

  static final DefinicionBD dbProvider = DefinicionBD();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await crearBD();
    return _database;
  }

  crearBD() async {
    String path = join(await getDatabasesPath(), "animaliak.db");
    var bd;
    bd = await openDatabase(path,
        version: 1, onCreate: _initDB, onUpgrade: _onUpgrade);
    return bd;
  }

  void _onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void _initDB(Database database, int version) async {
    await database.execute("CREATE TABLE usuarios ("
        "id INTEGER AUTO_INCREMENT PRIMARY KEY,"
        "nombre_usuario TEXT,"
        "contrasena TEXT"
        ")");
  }
}



