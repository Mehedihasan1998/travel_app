import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/controller/profile_controller.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/screens/main_screens/edit_profile.dart';
import 'package:travel_app/screens/splash_screen.dart';
import 'package:travel_app/widgets/custom_widgets.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  final profileController = Get.put(ProfileController());
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
      body: FutureBuilder(
        future: profileController.getUserData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              UserModel userData = snapshot.data.obs as UserModel;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg"),
                  ),
                  Text("${userData.firstName} ${userData.lastName}",style: myStyle(18),),
                  Text("${userData.email}", style: myStyle(16),),
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
              );
            } else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            } else{
              return Center(child: Text("Something went wrong.",style: myStyle(16),));
            }
          } else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}


