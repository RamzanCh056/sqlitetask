import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_app/services/services.dart';
import 'insertsqlite.dart';
import 'models/models.dart';
class insert extends StatefulWidget {
   insert({Key? key}) : super(key: key);


  @override
  _insertState createState() => _insertState();
}

class _insertState extends State<insert> {
  TextEditingController client_name = new TextEditingController();
  TextEditingController opened_contract_date = new TextEditingController();
  TextEditingController closed_contract_date = new TextEditingController();
  TextEditingController counter_number = new TextEditingController();
  TextEditingController consumed_gasoline = new TextEditingController();
  Future getDataLocalr() async {
    ProductServices services = new ProductServices();
    List result = await services.getProducts(new ProductModel());
    return result;
    print(result);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: Colors.lightBlueAccent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Open Contract',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
            top: 16.0, left: 4.0, right: 4.0, bottom: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Material(
                        color: Colors.white70,
                        //borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: TextField(
                          controller: client_name,
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.people),
                            hintText: 'client name ',
                            labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blue),
                            icon: Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Material(
                        color: Colors.white70,
                        //borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: TextField(
                          controller: opened_contract_date,
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.people),
                            hintText: 'client name ',
                            labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blue),
                            icon: Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Card(
                  //   // color: Colors.black,
                  //   // color: Color(0x013d5afe),
                  //   child: Padding(
                  //     //  padding:  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Column(
                  //       children: [
                  //         Material(
                  //           color: const Color(0xffffffff),
                  //           borderRadius:
                  //           const BorderRadius.all(Radius.circular(10.0)),
                  //           child: TextField(
                  //             controller: opened_contract_date,
                  //             decoration: const InputDecoration(
                  //               hintText: 'Open Contract Date',
                  //               icon: Padding(
                  //                 padding: EdgeInsets.only(left: 15.0),
                  //                 child: Icon(
                  //                   Icons.calendar_today,
                  //                   color: Colors.black,
                  //                 ),
                  //               ),
                  //               border: InputBorder.none,
                  //               enabledBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: Colors.black, width: 2.0),
                  //                 borderRadius:
                  //                 BorderRadius.all(Radius.circular(10.0)),
                  //               ),
                  //               focusedBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: Colors.black, width: 2.0),
                  //                 borderRadius:
                  //                 BorderRadius.all(Radius.circular(10.0)),
                  //               ),
                  //             ),
                  //             readOnly: true,
                  //             onTap: () async {
                  //               var pickedDate = await showDatePicker(
                  //                 context: context,
                  //                 initialDate: DateTime.now(),
                  //                 firstDate: DateTime(2000),
                  //                 lastDate: DateTime(2101),
                  //               );
                  //
                  //               if (pickedDate != null) {
                  //                 print(pickedDate);
                  //                 String formattedDate =
                  //                 DateFormat('yyyy-MM-dd')
                  //                     .format(pickedDate);
                  //                 print(formattedDate);
                  //                 setState(() {
                  //                   opened_contract_date.text = formattedDate;
                  //                 });
                  //               } else {
                  //                 print('Date is not selected');
                  //               }
                  //             },
                  //           ),
                  //         ),
                  //         SizedBox(height: 8.0),
                  //         Material(
                  //           color: Color(0xffffffff),
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(10.0)),
                  //           child: TextField(
                  //             controller: closed_contract_date,
                  //             decoration: InputDecoration(
                  //               hintText: 'Close Contract Date',
                  //               icon: Padding(
                  //                 padding: EdgeInsets.only(left: 15.0),
                  //                 child: Icon(
                  //                   Icons.calendar_today,
                  //                   color: Colors.black,
                  //                 ),
                  //               ),
                  //               border: InputBorder.none,
                  //               enabledBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: Colors.black, width: 2.0),
                  //                 borderRadius:
                  //                 BorderRadius.all(Radius.circular(10.0)),
                  //               ),
                  //               focusedBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: Colors.black, width: 2.0),
                  //                 borderRadius:
                  //                 BorderRadius.all(Radius.circular(10.0)),
                  //               ),
                  //             ),
                  //             readOnly: true,
                  //             onTap: () async {
                  //               var pickedDate = await showDatePicker(
                  //                 context: context,
                  //                 initialDate: DateTime.now(),
                  //                 firstDate: DateTime(2000),
                  //                 lastDate: DateTime(2101),
                  //               );
                  //               if (pickedDate != null) {
                  //                 print(pickedDate);
                  //                 String formattedDate =
                  //                 DateFormat('yyyy-MM-dd')
                  //                     .format(pickedDate);
                  //                 print(formattedDate);
                  //                 setState(() {
                  //                   closed_contract_date.text = formattedDate;
                  //                 });
                  //               } else {
                  //                 print('Date is not selected');
                  //               }
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Card(
                    // color: Colors.black,
                    // color: Color(0x013d5afe),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Material(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            color: Color(0xffffffff),
                            child: TextField(
                              controller: closed_contract_date,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                icon: Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Icon(
                                      Icons.add_road_outlined,
                                      color: Colors.black,
                                    )),
                                hintText: 'Input Counter Number',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Material(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            color: Color(0xffffffff),
                            child: TextField(
                              controller: counter_number,
                              // controller: check_up,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                icon: Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Icon(
                                      Icons.add_road_outlined,
                                      color: Colors.black,
                                    )),
                                hintText: 'Input Consumed Gasoline',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(

              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.black,
                borderRadius: BorderRadius.circular(30.0),

                child: MaterialButton(

                  //sqflite

                  onPressed: () async {
                      //newtime();
                      getDataLocalr();

                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                     'Confirm',
                    style:
                    TextStyle(color: Colors.yellowAccent, fontSize: 20.0),
                  ),
                ),
              ),
            ),
            //  ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("insert Data"),
    //
    //   ),
    //   body: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(left: 12, right: 20),
    //         child: Container(
    //           child: TextField(
    //     decoration: InputDecoration(
    //         hintText: 'Enter a message',
    //
    //         ),
    //     ),
    //   ),
    //       )
    //
    //     ],
    //
    //   ),
    // );
  }
}
