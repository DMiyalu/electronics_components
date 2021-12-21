import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ImageStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File>? copyImage({File? image}) async {
    final path = await _localPath;
    final File _image = await image!.copy('$path/image1.png');
    return _image;
  }
}
