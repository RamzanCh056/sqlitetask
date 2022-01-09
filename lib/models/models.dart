
import 'package:flutter/foundation.dart';

class ProductModel {
  final int? id;
  final String? clientName;
  final String? openedContractDate;
  final String? closedContractDate;
  final int? counterNumber;
  final double? consumedGasoline;
  final String? carNo;
  final int? checkup;
  // final int? mysqlup;
  // final int? conTime;

  ///table and column name
  static String tableName = "Product";
  static String colId = "id";
  static String colClientName = "client_name";
  static String colOpenedContractDate = "opened_contract_date";
  static String colClosedContractDate = "closed_contract_date";
  static String colCounterNumber = "counter_number";
  static String colConsumedGasoline = "consumed_gasoline";
  static String colCarNo = "car_no";
  static String ColCheckUp= "check_up";
  // static String ColMysqlUp= "mysql_up";
  // static String coltmm = "con_t";

  ProductModel({
    this.id,
    this.clientName  ,
    this.openedContractDate = "",
    this.closedContractDate = "",
    this.counterNumber = -999,
    this.consumedGasoline = -999,
    this.carNo,
    this.checkup,
    //  this.mysqlup,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'client_name': clientName,
      'opened_contract_date': openedContractDate,
      'closed_contract_date': closedContractDate,
      'counter_number': counterNumber,
      'consumed_gasoline': consumedGasoline,
      'car_no': carNo,
      'check_up': checkup,
      // 'mysql_up': mysqlup,
    };
  }

  factory ProductModel.toObject(Map<dynamic, dynamic> maps) {
    return ProductModel(
      id: maps['id'],
      clientName: maps['client_name'] ?? "",
      openedContractDate: maps['opened_contract_date'] ?? "",
      closedContractDate: maps['closed_contract_date'] ?? "",
      counterNumber: maps['counter_number'],
      consumedGasoline: maps['consumed_gasoline'],
      carNo: maps['car_no'] ?? "",
      checkup:  maps ['check_up'],
      //  mysqlup:  maps ['mysql_up'],
    );
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'ProductrModel{id: $id, clientName: $clientName, openedContractDate: $openedContractDate, closedContractDate: $closedContractDate, counterNumber: $counterNumber, consumedGasoline: $consumedGasoline , checkup: $checkup}';
    //mysqlup: $mysqlup
    //timei: $timei
  }

  static String sqlCreate() {
    String? query = "";
    query += "CREATE TABLE $tableName(";
    query += "$colId INTEGER PRIMARY KEY,";
    query += "$colClientName TEXT ";
    query += "$colClientName TEXT NOT NULL,";
    query += "$colOpenedContractDate TEXT,";
    query += "$colClosedContractDate TEXT,";
    query += "$colCounterNumber INTEGER,";
    query += "$colConsumedGasoline REAL,";
    query += "$colCarNo TEXT,";
    query += "$ColCheckUp INTEGER";
    // query += "$ColMysqlUp INTEGER";
    query += ")";

    return query;
  }
}
