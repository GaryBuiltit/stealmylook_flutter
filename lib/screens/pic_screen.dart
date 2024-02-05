import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import "package:flutter/material.dart";
import 'package:stealmylook_flutter/screens/results_screen.dart';
// import 'package:stealmylook_flutter/components/camera_preview.dart';

class PicScreen extends StatefulWidget {
  const PicScreen({Key? key, required this.imagePath}) : super(key: key);
  // final List<CameraDescription> cameras;
  final String imagePath;

  @override
  State<PicScreen> createState() => _PicScreenState();
}

class _PicScreenState extends State<PicScreen> {
  late CameraController controller;
  bool picTaken = false;
  late String base64String;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = CameraController(widget.cameras[0], ResolutionPreset.max);
  //   controller.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {});
  //   }).catchError((Object e) {
  //     if (e is CameraException) {
  //       switch (e.code) {
  //         case 'CameraAccessDenied':
  //           // Handle access errors here.
  //           break;
  //         default:
  //           // Handle other errors here.
  //           break;
  //       }
  //     }
  //   });
  // }

  imageConvert() {
    List<int> imgBytes = File(widget.imagePath).readAsBytesSync();
    base64String = base64Encode(imgBytes);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                height: MediaQuery.sizeOf(context).height - 200,
                width: MediaQuery.sizeOf(context).width,
                child: Image.file(File(widget.imagePath)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      imageConvert();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ResultsScreen(imgBase64: base64String),
                        ),
                      );
                    },
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.check),
                    // ignore: prefer_const_constructors
                    shape: CircleBorder(),
                  ),
                  const SizedBox(width: 15),
                  FloatingActionButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.black,
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    // ignore: prefer_const_constructors
                    shape: CircleBorder(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
