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
        child: TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRCode()),
          ),
          child: Text('Electronics Components'))
      )
    );
  }
}
// NFC
// Test. 1. Active/Deactive bluetooth
// Test. 2. Play Music