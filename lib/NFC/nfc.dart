import 'package:flutter/material.dart';

class Nfc extends StatefulWidget {
  const Nfc({Key? key}) : super(key: key);

  @override
  _NfcState createState() => _NfcState();
}

class _NfcState extends State<Nfc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('NFC')
            ]
          ),
        )
      ),
    );
  }
}
