import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'trips.db');
    Database tDB = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return tDB;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade =====================================");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE "TRIPS DETAILS" ("id" INTEGER PRIMARY KEY, "Driver name" TEXT, "Bus Number" INTEGER, "Bus Plate" number REAL,"Cost" REAL)''');
  }

  readData(String sql) async {
    Database? tDB = await db;
    List<Map> response = await tDB!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? tDB = await db;
    int response = await tDB!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? tDB = await db;
    int response = await tDB!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? tDB = await db;
    int response = await tDB!.rawDelete(sql);
    return response;
  }
}
