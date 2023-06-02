import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/helper/routes.dart';
import 'package:travel_app/screens/account_screen/login.dart';
import 'package:travel_app/screens/account_screen/register.dart';

final List<String> imgList = [
  'images/cox\'s_bazar.jpg',
  'images/tiger.jpg',
  'images/hotel_room.jpg'
];
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.7,
            width: double.infinity,
            child: Builder(
              builder: (context) {
                final double height = MediaQuery.of(context).size.height;
                return CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayInterval: Duration(seconds: 2),
                    height: height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    // autoPlay: false,
                  ),
                  items: imgList
                      .map((item) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      image: DecorationImage(
                          image: AssetImage(item),
                      fit: BoxFit.fitHeight
                      ),
                    ),
                  ),
                  ).toList(),
                );
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Explore Anywhere In The World",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,),),
                  SizedBox(height: 10,),
                  Text("If you like to travel a lot. Then this app is for you to travel around the world with out any hassle.",
                  textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width*0.9,
                    height: 50,
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.blueGrey
                      )
                    ),
                    child: Text("Create an account",style: TextStyle(fontSize: 16),),
                    onPressed: (){
                      Get.toNamed(TripRoutes.register);
                    },
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    child: RichText(
                        text: TextSpan(
                            children: [
                      TextSpan(text: "Already have an account? ",style: TextStyle(color: Colors.black)),
                      TextSpan(text: "Sign in",style: TextStyle(color: Colors.blueAccent)),
                    ],),
                    ),
                    onTap: (){
                      Get.toNamed(TripRoutes.login);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
