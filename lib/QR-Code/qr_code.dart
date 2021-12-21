import 'package:electronics_components/QR-Code/generate_qrcode.dart';
import 'package:electronics_components/QR-Code/scan_screen.dart';
import 'package:flutter/material.dart';

class QRCode extends StatefulWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text('QR-Code test'),
              SizedBox(height: 30),
              TextButton(
                onPressed: () =>  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenerateQRCode()),
                ),
                child: Text('Generate QR-Code')),
              SizedBox(height: 30),
              TextButton(
                onPressed: () =>  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScanPage()),
                ),
                child: Text('Scan QR-Code')),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}