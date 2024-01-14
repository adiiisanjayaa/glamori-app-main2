// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:glamori/app/data/database/cart_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// ignore: constant_identifier_names
enum ModelTransactionType { INSERT, UPDATE }
// await SqlLiteHelper.instance.bankTable.then((value) => value.insertBank(account));

//SqlLite
class SqlLiteHelper {
  static const _databaseName = "Glomori.db";
  static const _currentDBVersion = 4;

  SqlLiteHelper._privateConstructor();
  static final SqlLiteHelper instance = SqlLiteHelper._privateConstructor();

  static Database? _database;
  static CartTable? _cartTable;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<CartTable> get cartTable async {
    if (_cartTable == null) {
      Database db = await instance.database;
      _cartTable = CartTable(db);
    }
    return _cartTable!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _currentDBVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    // Create table here
    await db.execute(CartTable.QUERY_CREATE_TABLE);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute(CartTable.QUERY_DROP_TABLE);

    await db.execute(CartTable.QUERY_CREATE_TABLE);
  }

  Future onEnvSwitch() async {
    Database db = await _initDatabase();
    await db.execute(CartTable.QUERY_DROP_TABLE);

    await db.execute(CartTable.QUERY_CREATE_TABLE);
  }
}
