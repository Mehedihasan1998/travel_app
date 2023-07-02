import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/screens/splash_screen.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          InkWell(
              onTap: (){
                Get.offAll(SplashScreen());
              },
              child: Icon(Icons.logout,size: 25,)),
        ],
      ),
    );
  }
}
