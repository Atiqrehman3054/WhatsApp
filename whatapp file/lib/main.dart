import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:whatapp/screens/CameraScreen.dart';
import 'package:whatapp/screens/Homepage.dart';
import 'package:flutter_launcher_icons/android.dart';

Future <void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: ThemeData(
        fontFamily: "OpenSans",
          primaryColor: Color(0xFF075E54),
          accentColor: Color(0xFF128C7E)),


      title: 'Flutter Demo',

      home: Homepage(),
    );
  }
}

