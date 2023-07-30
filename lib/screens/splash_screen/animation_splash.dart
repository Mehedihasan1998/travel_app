import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/screens/splash_screen.dart';
class AnimationSplash extends StatefulWidget {
  const AnimationSplash({Key? key}) : super(key: key);

  @override
  State<AnimationSplash> createState() => _AnimationSplashState();
}

class _AnimationSplashState extends State<AnimationSplash> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10), ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>SplashScreen()), (route) => false));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("animations/bus.json", height: 200, width: 300, reverse: true, repeat: true, fit: BoxFit.cover),
      ),
    );
  }
}
