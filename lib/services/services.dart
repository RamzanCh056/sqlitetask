import 'package:flutter_app/Helper/helper.dart';
import 'package:flutter_app/models/models.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';

class ProductServices {
  /// services study please refer:
  /// https://medium.com/flutter-community/creating-services-to-do-the-work-in-your-flutter-app-93d6c4aa7697
  ///
  DatabaseHelper helper = new DatabaseHelper();

  Future<int> insert(ProductModel productrModel) async {
    // row to insert

    int id = await helper.insert(ProductModel.tableName, productrModel.toMap());

    // show the results: print all rows in the db
    //print(await db.query(DatabaseHelper.table));
    return id;
  }


  Future<int> update(ProductModel productrModel) async {
    // row to insert

    int id = await helper.update(
      ProductModel.tableName, productrModel.toMap(), where: "id = ? ", whereArgs: [productrModel.id],);


    // show the results: print all rows in the db
    //print(await db.query(DatabaseHelper.table));
    return id;
  }

  Future<int> update1 (String tableName, Map<String,Object> values, String? where, List<Object?>? whereArgs)
  async {
    // row to insert

    int id = await helper.update(
        tableName ,values , where:where, whereArgs:whereArgs);


    // show the results: print all rows in the db
    //print(await db.query(DatabaseHelper.table));
    return id;
  }

  Future<int?> updatei(ProductModel productrModel) async {
    //  Database? helper = await instance.database;

    Map<String, dynamic> p = productrModel.toMap();

    p.keys
        .where((k) => p[k] == null)
        .toList()
        .forEach(p.remove);
    int id = await helper.update(
      ProductModel.tableName, productrModel.toMap(), where: "id = ? ", whereArgs: [productrModel.id],);
    return id;
  }



  Future <int> delete(ProductModel productrModel) async {
    // int daysBetween (DateTime from, DateTime to ){

    // row to insert
    //Database db = await DatabaseHelper.instance.database;
    // int id = await helper.delete("delete from  Product where Con_t <= date('now','-1 day')");
    // int id = await helper.delete(ProductModel.tableName,where:  "conTime = ? ", whereArgs: [productrModel.conTime];
    //   var db1 = await db.execute("delete from  Product where Con_t <= date('now','-1 day')" );
    //  int id = await helper.delete(ProductModel.tableName, where: "julianday('now') - julianday (Con_t) > 1");
    int id = await helper.delete(ProductModel.tableName, where: " Con_t <= date('now','-30 day')");
    //int id = await helper.delete(ProductModel.tableName, where: "conTime = ? ", whereArgs:  [productrModel.conTime].inDays >= 30);

    // show the results: print all rows in the db
    //print(await db.query(DatabaseHelper.table));
    return id;
  }

/*
  Future  delete(ProductModel productrModel) async {
    // row to insert
    Database db = await DatabaseHelper.instance.database;
    //int id = await helper.delete(ProductModel.tableName, where: productrModel.conTime > 30 );
    // var db1 = await db.execute("delete from Product where julianday('now')-julianday(Con_t) > 1" );
    var db1 = await db.execute("delete from  Product where Con_t <= date('now','-1 day')" );

    //return id;
   // String sql = "DELETE FROM myTable WHERE Save_Date <= date('now','-2 day')";
   // db.execSQL(sql);
    //String sql = "DELETE FROM tableName WHERE contime <= date('now','-2 day')";
   // helper.delete(sql);
  }
*/
/*
  Future<int> update(ProductModel productrModel) async {
    // row to insert

    int id = await helper.update(ProductModel.tableName, productrModel.toMap());
    String strWhere = "";
    List<Object?> strWhereArgs = [];
    if ((productrModel.id ?? "").isNotEmpty) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colId} = ? ";
      strWhereArgs.update(productrModel.id);
    }
    //where: '$columnId = ?', whereArgs: [productModel.id]
    // show the results: print all rows in the db
    //print(await db.query(DatabaseHelper.table));
    return id;
  }

*/





  Future<List> getProducts(ProductModel productrModel) async {
    String strWhere = "";
    List<Object?> strWhereArgs = [];
    if ((productrModel.clientName ?? "").isNotEmpty) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colClientName} = ? ";
      strWhereArgs.add(productrModel.clientName);
    }

    if ((productrModel.openedContractDate ?? "").isNotEmpty) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colOpenedContractDate} = ? ";
      strWhereArgs.add(productrModel.openedContractDate);
    }

    if ((productrModel.closedContractDate ?? "").isNotEmpty) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colClosedContractDate} = ? ";
      strWhereArgs.add(productrModel.closedContractDate);
    }

    if (productrModel.counterNumber != -999) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colCounterNumber} = ? ";
      strWhereArgs.add(productrModel.counterNumber);
    }

    if (productrModel.consumedGasoline != -999) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colConsumedGasoline} = ? ";
      strWhereArgs.add(productrModel.consumedGasoline);
    }

    if (productrModel.carNo != null) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colCarNo} = ? ";
      strWhereArgs.add(productrModel.carNo);
    }

    /*  if (productrModel.timei != null) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.coltmm} = ? ";
      strWhereArgs.add(productrModel.timei);
    }*/

    // Query the table for all The Dogs.
    final List<Map<dynamic, dynamic>> maps = await helper.select(
        ProductModel.tableName,
        // where: strWhere.isEmpty ? null : strWhere,
        where: strWhere.isEmpty ? null : strWhere,
        whereArgs: strWhereArgs.isEmpty ? null : strWhereArgs);

    // Convert the List<Map<String, dynamic> into a List<Dog>.

    return maps;


  }




  Future<List> getProductsForMysqlSync(ProductModel productrModel) async {
    String strWhere = "";
    List<Object?> strWhereArgs = [];
    if ((productrModel.clientName ?? "").isNotEmpty) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colClientName} = ? ";
      strWhereArgs.add(productrModel.clientName);
    }

    if ((productrModel.openedContractDate ?? "").isNotEmpty) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colOpenedContractDate} = ? ";
      strWhereArgs.add(productrModel.openedContractDate);
    }

    if ((productrModel.closedContractDate ?? "").isNotEmpty) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colClosedContractDate} = ? ";
      strWhereArgs.add(productrModel.closedContractDate);
    }

    if (productrModel.counterNumber != -999) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colCounterNumber} = ? ";
      strWhereArgs.add(productrModel.counterNumber);
    }

    if (productrModel.consumedGasoline != -999) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colConsumedGasoline} = ? ";
      strWhereArgs.add(productrModel.consumedGasoline);
    }

    if (productrModel.carNo != null) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.colCarNo} = ? ";
      strWhereArgs.add(productrModel.carNo);
    }

    if (productrModel.checkup != null) {
      if (strWhere.isNotEmpty) strWhere += " AND ";
      strWhere += "${ProductModel.ColCheckUp} = ? ";
      strWhereArgs.add(productrModel.checkup);
    }

    // Query the table for all The Dogs.

    final List<Map<dynamic, dynamic>> maps = await helper.select(
        ProductModel.tableName,
        //   where:  " Con_t <= date('now','-30 day')");
        where: strWhere.isEmpty ? null : strWhere,
        whereArgs: strWhereArgs.isEmpty ? null : strWhereArgs);
    // Convert the List<Map<String, dynamic> into a List<Dog>.

    return maps;


  }
  Future<List<ProductModel>> getProductsList(ProductModel productrModel) async {
    final List maps = await getProducts(productrModel);
    List<ProductModel> products = List<ProductModel>.from(
        maps.map((model) => ProductModel.toObject(model)));

    return products;
  }



}
