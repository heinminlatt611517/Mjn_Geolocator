import 'dart:async';
import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geolocator_example/pages/login_page.dart';
import 'package:flutter_geolocator_example/pages/my_location_page.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:splashscreen/splashscreen.dart';


/// Defines the main theme color.
final MaterialColor themeMaterialColor =
BaseflowPluginExample.createMaterialColor(
    const Color.fromRGBO(48, 49, 60, 1));

Future  main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage());
  }
}

class splashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Color(0xff242527),
      seconds: 4,
      navigateAfterSeconds: new LoginPage(),

      image: Image.asset('assets/splash_screen_logo.png'),
      loadingText: Text("Loading",style: TextStyle(color: Colors.blue),),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}



