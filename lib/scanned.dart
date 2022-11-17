import 'package:flutter/material.dart';

class Scanned extends StatefulWidget {
  Scanned({super.key, required this.barcode});
  String barcode;

  @override
  State<Scanned> createState() => _ScannedState();
}

class _ScannedState extends State<Scanned> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.teal.shade200,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.white, Colors.teal.shade200],
            begin: const FractionalOffset(1.0, 1.0),
            end: const FractionalOffset(1.0, 0.0),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your barcode is: \n',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.barcode,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
