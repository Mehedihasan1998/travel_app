import 'package:flutter/material.dart';
import 'package:travel_app/helper/routes.dart';
import 'package:travel_app/screens/account_screen/forget_password/forget_password_otp/forget_password_otp.dart';
import 'package:travel_app/widgets/custom_button.dart';
import 'package:travel_app/widgets/custom_widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordMail extends StatelessWidget {
  ForgetPasswordMail({Key? key}) : super(key: key);
  TextEditingController mailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage("images/fingure_print.png"),
              ),
              Text("Forget Password",style: myStyle(25,Colors.black,FontWeight.bold),),
              Text("Provide the OTP that has been sent to your mail to reset your password.",textAlign: TextAlign.center,style: myStyle(16),),
              SizedBox(height: 20,),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: mailcontroller,
                validator: (value){
                  if(value!.isEmpty){
                    return "Enter an Email";
                  }
                  if(!value.contains("@")){
                    return "Enter valid Email";
                  }
                },
                decoration: customInputDecoration.copyWith(
                  prefixIcon: Icon(Icons.mail),
                  hintText: "Email Address",
                  labelText: "Enter Your Email",),
              ),
              MyButton(
                title: "Next",
                color: Colors.blue,
                onPressed: (){
                  Get.toNamed(TripRoutes.fpOtp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
