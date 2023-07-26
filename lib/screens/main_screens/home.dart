import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/screens/splash_screen.dart';
import 'package:travel_app/widgets/custom_widgets.dart';

import 'profile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List places = [
    "🌳   Forest",
    "⏲   Historical",
    "🏢   Hotels",
    "🏝️   Island",
    "⛵   Lake",
    "🌄   Mountain",
    "🏩   Resorts",
    "🌊   Sea"
  ];
  List selectedIndex = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HomeAppBar(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.28,
                child: GridView.count(
                  childAspectRatio: 4,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 15.0,
                  children: List.generate(places.length, (index) {
                    return InkWell(
                      onTap: (){
                        setState(() {
                          if(selectedIndex.isEmpty==true){
                            selectedIndex.add(index);
                          }else{
                            selectedIndex.clear();
                            selectedIndex.add(index);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedIndex.contains(index) ? Colors.blue: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "${places[index]}",
                          style: myStyle(20,  selectedIndex.contains(index) ? Colors.white: Colors.black, FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
