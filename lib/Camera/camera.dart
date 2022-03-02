import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

List<CameraDescription>? cameras;

class _CameraState extends State<Camera> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    // cameras = await availableCameras();
    // controller = CameraController(cameras![0], ResolutionPreset.max);
    // controller!.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return Center(
        child: Text('camera enable'),
      );
    }
    return SizedBox(
      child: CameraPreview(controller!),
    );
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      print('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('error on taking picture: $e');
      // _showCameraException(e);
      return null;
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        print('Picture succees');
        setState(() {
          // imageFile = file;
        });
        // if (file != null) showInSnackBar('Picture saved to ${file.path}');
      }
    });
  }
}
