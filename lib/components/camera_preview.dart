import 'package:camera/camera.dart';
import "package:flutter/material.dart";

class CamPreview extends StatefulWidget {
  const CamPreview({Key? key, required this.cameraController})
      : super(key: key);
  final CameraController cameraController;

  @override
  State<CamPreview> createState() => _CamPreviewState();
}

class _CamPreviewState extends State<CamPreview> {
  @override
  Widget build(BuildContext context) {
    return CameraPreview(widget.cameraController);
  }
}
