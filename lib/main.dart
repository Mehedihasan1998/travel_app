import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/helper/routes.dart';
import 'package:travel_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'My Trip',
      initialRoute: TripRoutes.initial,
      getPages: TripRoutes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
