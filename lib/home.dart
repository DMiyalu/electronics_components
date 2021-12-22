import 'package:electronics_components/NFC/nfc.dart';
import 'package:electronics_components/QR-Code/qr_code.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        children: [
          customButton(context, text: "QR-CODE",
            onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRCode()),
                  )),
          customButton(context, text: "NFC",
            onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Nfc()),
                  )),
        ],
      ),
    )));
  }
}
// NFC
// Test. 1. Active/Deactive bluetooth
// Test. 2. Play Music

Widget customButton(context, {required String text,
  required Function onPressed}) {
  return TextButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 15, vertical: 5)
      ),

    ),
    onPressed: () => onPressed(),
    child: Text(text, style: TextStyle(color: Colors.white)));
}