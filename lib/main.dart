// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:stealmylook_flutter/screens/pic_screen.dart';
import 'screens/homepage.dart';

// List<CameraDescription> _cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Steal My Look',
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const MyHomePage(),
      //   '/takepic': (context) => PicScreen(),
      // },
      home: MyHomePage(),
    );
  }
}
