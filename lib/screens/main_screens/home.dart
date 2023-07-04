import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/screens/splash_screen.dart';
import 'package:travel_app/widgets/custom_widgets.dart';

import 'profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Home",
          style: myStyle(18, Colors.black, FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  Get.to(Profile());
                },
                icon: Icon(
                  Icons.person_pin_outlined,
                  size: 30,
                  color: Colors.blue,
                )),
          ),
        ],
      ),
    );
  }
}
