import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// Create a CameraService class to handle camera initialization
class CameraService {
  late CameraController _controller;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    await _controller.initialize();
  }

  CameraController get cameraController => _controller;
}

// Use the CameraService to initialize the camera in your ScannerScreen
class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  late CameraService _cameraService;

  @override
  void initState() {
    super.initState();
    _cameraService = CameraService();
    _cameraService.initializeCamera().then((_) {
      if (mounted) {
        setState(() {});
      }
    }).catchError((error) {
      print('Error initializing camera: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    final cameraController = _cameraService.cameraController;
    if (!cameraController.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Scanner Screen'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner Screen'),
      ),
      body: CameraPreview(cameraController),
    );
  }
}

// Example usage in other views/screens
class SomeOtherScreen extends StatelessWidget {
  final CameraService cameraService;

  const SomeOtherScreen({Key? key, required this.cameraService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cameraController = cameraService.cameraController;
    return Scaffold(
      appBar: AppBar(
        title: Text('Some Other Screen'),
      ),
      body: CameraPreview(cameraController),
    );
  }
}
