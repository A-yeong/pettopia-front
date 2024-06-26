import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

 

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
   
    _controller = CameraController(
    
      widget.camera,
 
      ResolutionPreset.medium,
    );

   
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
   
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
        
          return CameraPreview(_controller);
        } else {
        
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}