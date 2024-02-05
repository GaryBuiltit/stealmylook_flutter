import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stealmylook_flutter/screens/pic_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late File imagePicked;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    void pickImage() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        // final imageTemp = File(image.path);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PicScreen(imagePath: image.path),
          ),
        );
        // setState(() => imagePicked = imageTemp);
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

    void takePic() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return;
        // final imageTemp = File(image.path);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PicScreen(imagePath: image.path),
          ),
        );
        // setState(() => imagePicked = imageTemp);
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/steal my look logo.png"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 20),
                    elevation: 5,
                  ),
                  onPressed: () {
                    takePic();
                  },
                  child: const Text("Snap A Pic"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 20),
                    elevation: 5,
                  ),
                  onPressed: () async {
                    pickImage();
                  },
                  child: const Text("Upload A Pic"),
                ),
              ],
            ),
          )),
    );
  }
}
