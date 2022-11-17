import 'dart:async';

import 'package:barcod_scan/scanned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: brcode(),
  ));
}

class brcode extends StatefulWidget {
  @override
  State<brcode> createState() => _brcodeState();
}

class _brcodeState extends State<brcode> {
  bool isScan = false;

  List<List<String>> _data = [];

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#717D7E', 'Cancel', true, ScanMode.BARCODE)
        .then((value) => setState(() {
              if (int.parse(value) != -1) {
                _data.add([value, DateTime.now().toString()]);

                isScan = true;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scanned(
                              barcode: value,
                            )));
              } else {
                isScan = false;
                print('11111111111111:$value');
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _data.length > 0
          ? ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) => Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [Colors.teal.shade200, Colors.blueAccent],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _data[index][0],
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3),
                            ),
                            Text(
                              DateTime.parse(_data[index][1]).year.toString() +
                                  ':' +
                                  DateTime.parse(_data[index][1])
                                      .month
                                      .toString() +
                                  ':' +
                                  DateTime.parse(_data[index][1])
                                      .day
                                      .toString() +
                                  ', ' +
                                  DateTime.parse(_data[index][1])
                                      .hour
                                      .toString() +
                                  ':' +
                                  DateTime.parse(_data[index][1])
                                      .minute
                                      .toString() +
                                  ':' +
                                  DateTime.parse(_data[index][1])
                                      .second
                                      .toString(),
                              style: TextStyle(fontSize: 10, letterSpacing: 3),
                            ),
                          ],
                        )),
                  ))
          : Center(
              child: Text(
                'No Barcode Scanned Yet',
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scan();
        },
        child: Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: new LinearGradient(
                colors: [Colors.teal.shade200, Colors.blueAccent],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
              ),
            ),
            child: FaIcon(
              FontAwesomeIcons.barcode,
              color: Colors.white,
              size: 30,
            )),
      ),
    );
  }
}
