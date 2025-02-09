// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class InitSqfliteDbSingletonHelper {
  static Database? _database;

  static final InitSqfliteDbSingletonHelper db =
      InitSqfliteDbSingletonHelper._();
  InitSqfliteDbSingletonHelper._();

  Future<Database> get database async {
    if (_database != null) _database;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentDir = await getApplicationDocumentsDirectory();

    final path = join(documentDir.path, 'LegoExpress.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE IF NOT EXIST users (
          id INTEGER PRIMARY KEY,
          uuid TEXT
        )
      ''');
    });
  }
}
