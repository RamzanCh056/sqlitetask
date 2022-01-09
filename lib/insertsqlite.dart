
import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/services/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> newtime() async {
  print('insert db');
  TextEditingController client_name = new TextEditingController();
  TextEditingController opened_contract_date = new TextEditingController();
  TextEditingController closed_contract_date = new TextEditingController();
  TextEditingController counter_number = new TextEditingController();
  TextEditingController consumed_gasoline = new TextEditingController();

  ProductModel productrModel = new ProductModel(
   // carNo: car_no,
    clientName: client_name.text,
    openedContractDate: opened_contract_date.text,
    closedContractDate: closed_contract_date.text,
    counterNumber: int.tryParse(counter_number.text),
    consumedGasoline: double.tryParse(consumed_gasoline.text),
    checkup: 0,

  );
  ProductServices service = new ProductServices();
  int i = await service.insert(productrModel);
  print('id = $i');

  if (i > 0) {
    Fluttertoast.showToast(
        msg: "insert successfull",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  else {
    Fluttertoast.showToast(
        msg: "insert failed ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}