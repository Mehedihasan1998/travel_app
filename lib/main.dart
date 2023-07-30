import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/firebase_options.dart';
import 'package:travel_app/helper/routes.dart';
import 'package:travel_app/repository/authentication_repository.dart';
import 'package:travel_app/screens/splash_screen.dart';
import 'package:travel_app/screens/splash_screen/animation_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Trip',
      initialRoute: TripRoutes.initial,
      getPages: TripRoutes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
      ),
      home: AnimationSplash(),
    );
  }
}
