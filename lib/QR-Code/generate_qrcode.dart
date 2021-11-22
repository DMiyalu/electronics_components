import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({Key? key}) : super(key: key);

  @override
  _GenerateQRCodeState createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              key: globalKey,
              child: QrImage(
                data: "Stanislas Makengo",
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            SizedBox(height: 30),
            TextButton(onPressed: _captureAndSharePng, child: Text('Envoyer'))
          ],
        ),
      ),
    );
  }

  Future<void> _captureAndSharePng() async {
    print('reading');
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.openWrite;

      // ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      // Uint8List pngBytes = byteData!.buffer.asUint8List();

      // final tempDir = await getTemporaryDirectory();
      // final file = await new File('${tempDir.path}/image.png').create();
      // final _imageFile = await file.writeAsBytes(pngBytes);
      shareFile(file: _imageFile);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> shareFile({required File file}) async {
    Share.shareFiles([], text: 'Share qr_code generated as png');
  }
}
