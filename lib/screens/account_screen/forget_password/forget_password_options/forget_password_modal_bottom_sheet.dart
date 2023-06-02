import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/helper/routes.dart';
import 'package:travel_app/screens/account_screen/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:travel_app/screens/account_screen/forget_password/forget_password_options/forget_password_button.dart';
import 'package:travel_app/widgets/custom_widgets.dart';
class ForgetPasswodScreen{
  static Future<dynamic> buildShowModalBottomSheet() {
    return Get.bottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
          padding: EdgeInsets.all(30),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Make Selection!', style: myStyle(24,Colors.black, FontWeight.bold),),
              Text('Select one of the options given below to reset your password.', style: myStyle(16),),
              SizedBox(height: 30,),
              ForgetPasswordButton(
                btnIcon: Icons.mail_outline_rounded,
                title: "E-Mail",
                subtitle: "Reset via Mail verification",
                onTap: (){
                  Get.toNamed(TripRoutes.fpMail);
                },
              ),
              SizedBox(height: 20,),
              ForgetPasswordButton(
                btnIcon: Icons.mobile_friendly_rounded,
                title: "Phone No",
                subtitle: "Reset via Phone verification",
                onTap: (){},
              ),
            ],
          )
      ),
      enableDrag: false,
    );
  }
}