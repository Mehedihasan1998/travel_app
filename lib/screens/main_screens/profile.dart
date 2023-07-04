import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/screens/main_screens/edit_profile.dart';
import 'package:travel_app/screens/splash_screen.dart';
import 'package:travel_app/widgets/custom_widgets.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Profile",style: myStyle(18,Colors.black,FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.nights_stay_outlined,size: 25,color: Colors.black,),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 50,
            backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg"),
          ),
          Text("User Name",style: myStyle(18),),
          Text("support@gmail.com", style: myStyle(16),),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              elevation: 5.0,
              color: buttonColor,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: (){
                  Get.to(EditProfile());
                },
                minWidth: MediaQuery.of(context).size.width*0.5,
                height: 50,
                child: Text("Edit Profile",style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.settings,size: 25,color: Colors.blue,),
            title: Text("Settings", style: myStyle(16),),
            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 25,),
          ),
          InkWell(
            onTap: (){
              Get.offAll(SplashScreen());
            },
            child: ListTile(
              leading: Icon(Icons.logout,size: 25,color: Colors.blue,),
              title: Text("Logout", style: myStyle(16, Colors.red),),
            ),
          ),
        ],
      ),
    );
  }
}
