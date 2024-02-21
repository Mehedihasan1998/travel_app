import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/main_screens/profile.dart';

myStyle(double fs, [Color ?clr, FontWeight ?fw]){
  return GoogleFonts.nunito(
    color: clr,
    fontSize: fs,
    fontWeight: fw,
  );
}

const Color buttonColor = Colors.blue;
const Color buttonTextColor = Colors.white;

const customInputDecoration = InputDecoration(
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Colors.blue,
    ),
  ),

  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Colors.blue,
    ),
  ),
);

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.logout, size: 30, color: Colors.blue,)),
          Column(
            children: [
              Text("Current Location", style: myStyle(18),),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue, size: 20,),
                  Text("Rampura, Dhaka", style: myStyle(18,Colors.black, FontWeight.bold),),
                ],
              )
            ],
          ),
          IconButton(
              onPressed: () {
                Get.to(Profile());
              },
              icon: Icon(
                Icons.person_pin_outlined,
                size: 30,
                color: Colors.blue,
              )
          ),
        ],
      ),
    );
  }
}
