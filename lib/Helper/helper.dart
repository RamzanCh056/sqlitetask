import 'dart:io' show Directory;
import 'package:flutter_app/models/models.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  DatabaseHelper();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(ProductModel.sqlCreate());
    // await db.execute(ProductMaint.sqlCreate());
    // await db.execute(ProductRefuel.sqlCreate());
  }






  Future<int> insert(
      String table,
      Map<String, Object?> values, {
        String? nullColumnHack,
        //ConflictAlgorithm? conflictAlgorithm,
      }) async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await DatabaseHelper.instance.database;

    // do the insert and get the id of the inserted row
    int id = await db.insert(
      table,
      values,
      nullColumnHack: nullColumnHack,
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // show the results: print all rows in the db
    print(await db.query(table));
    print("ok");
    return id;
  }

  Future <int> delete (
      String table,
      //  String sql,
      // Map<String, Object?> values,
          {
        String? where,
        List<Object?>? whereArgs,
      }
      ) async {
    Database db = await DatabaseHelper.instance.database;

    int id = await db.delete(
      //  sql,
      table,
      //values,
      where: where,
      whereArgs: whereArgs,
    );

    // show the results: print all rows in the db
    print(await db.query(table));
    print("ok");
    return id;
  }

  Future<int>update (
      String table,
      Map<String, Object?> values, {
        // String? nullColumnHack,
        String? where,
        List<Object?>? whereArgs,
        //ConflictAlgorithm? conflictAlgorithm,
      }) async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database db = await DatabaseHelper.instance.database;


    // do the insert and get the id of the inserted row
    int id = await db.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
      //  nullColumnHack: nullColumnHack,
      //  conflictAlgorithm: ConflictAlgorithm.replace,
    );


    // show the results: print all rows in the db
    print(await db.query(table));
    print("ok");
    return id;
  }

  Future<List<Map>> select
      (
      String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // get all rows
    List<Map> result = await db.query(table,
        distinct: distinct,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset);

    // get single row
    //List<Map> result = await db.query(DatabaseHelper.table,
    //    columns: [DatabaseHelper.columnId, DatabaseHelper.columnName, DatabaseHelper.columnAge],
    //    where: '${DatabaseHelper.columnId} = ?',
    //    whereArgs: [1]);

    // raw query
    //List<Map> result = await db.rawQuery('SELECT * FROM my_table WHERE name=?', ['Mary']);

    // get each row in the result list and print it
    result.forEach((row) => print(row));
    return result;
  }

}
