import 'package:electronics_components/home.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class Nfc extends StatefulWidget {
  const Nfc({Key? key}) : super(key: key);

  @override
  _NfcState createState() => _NfcState();
}

class _NfcState extends State<Nfc> {
  void startNfcProcess() async {
    bool isAvailable = await NfcManager.instance.isAvailable();

    // Start Session
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        print('nfc tag: ${tag.data}');

        Ndef? ndef = Ndef.from(tag);
        if (ndef == null) {
          print('Tag is not compatible with NDEF');
          return;
        }

        print('ndef value: ${ndef.cachedMessage}');
      },
    );

    // Stop Session
    NfcManager.instance.stopSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(children: [
          customButton(context,
              text: "Start Nfc Process", onPressed: () => startNfcProcess()),
          Text('NFC')
        ]),
      )),
    );
  }
}
